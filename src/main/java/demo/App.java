package demo;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import io.vavr.collection.List;
import io.vavr.jackson.datatype.VavrModule;
import io.vertx.core.json.Json;
import io.vertx.core.json.JsonObject;
import io.vertx.pgclient.PgConnectOptions;
import io.vertx.reactivex.pgclient.PgPool;
import io.vertx.sqlclient.PoolOptions;
import lombok.Data;

import java.time.LocalDate;
import static io.vavr.API.*;

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

        var drakkars = client
                .rxPreparedQuery("""
                    select d.json::jsonb || json_build_object('chief', chief.json)::jsonb || json_build_object('members', array_agg(v.json))::jsonb
                    from drakkar_json d
                    join viking_json chief on chief.id = d.json ->> 'chief_id'
                    join viking_in_drakkar_json vdk on d.id = vdk.viking_id
                    join viking_json v on v.id = vdk.drakkar_id
                    where v.json @> '{"name":"Aasvard"}'
                    group by d.json, chief.json
                    """
                )
                .map(rows ->
                    List.ofAll(rows).map(r ->
                            r.get(JsonObject.class, 0)
                    ).map(json -> json.mapTo(Drakkar.class))
                )
                .blockingGet();

        println(drakkars.mkString("\n"));
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
        Viking chief;
        List<Viking> members;
    }

}
