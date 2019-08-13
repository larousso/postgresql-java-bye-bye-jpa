package demo;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import io.vavr.API;
import io.vavr.collection.List;
import io.vavr.jackson.datatype.VavrModule;
import io.vertx.core.json.Json;
import io.vertx.core.json.JsonObject;
import io.vertx.pgclient.PgConnectOptions;
import io.vertx.reactivex.pgclient.PgPool;
import io.vertx.sqlclient.PoolOptions;
import lombok.Data;

import java.time.LocalDate;

public class App {
    public static void main(String[] args) {

        Json.mapper.registerModule(new VavrModule());
        Json.mapper.registerModule(new JavaTimeModule());
        Json.mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

        PgPool client = PgPool.pool(new PgConnectOptions()
                    .setPort(5432)
                    .setHost("localhost")
                    .setDatabase("viking")
                    .setUser("viking")
                    .setPassword("viking"),
                new PoolOptions().setMaxSize(5));

        List<Drakkar> drakkars = client.rxQuery("""
                    select
                        row_to_json(d.*)::jsonb ||
                        json_build_object('members', array_agg(row_to_json(v.*)))::jsonb
                    from drakkar d
                    join viking_in_drakkar vdk on d.id = vdk.viking_id
                    join viking v on v.id = vdk.drakkar_id
                    where v.name = 'Aasvard'
                    group by d.*
                    """)
                .map(rows ->
                    List.ofAll(rows).map(r -> r.get(JsonObject.class, 0).mapTo(Drakkar.class))
                )
                .blockingGet();

        API.println(drakkars.mkString("\n"));
    }

    @Data
    public static class Viking {
        String id;
        String name;
        String lastName;
        String gender;
        Integer numberOfBattles;
        LocalDate birthDate;
    }

    @Data
    public static class Drakkar {
        String id;
        String name;
        List<Viking> members;
    }

}
