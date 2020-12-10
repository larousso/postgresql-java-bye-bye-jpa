package demo;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import io.vavr.collection.List;
import io.vavr.jackson.datatype.VavrModule;
import io.vertx.core.json.Json;
import io.vertx.core.json.JsonObject;
import io.vertx.pgclient.PgConnectOptions;
import io.vertx.reactivex.pgclient.PgPool;
import io.vertx.sqlclient.PoolOptions;
import io.vertx.reactivex.sqlclient.Tuple;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

import static io.vavr.API.*;

public class App {
    public static void main(String[] args) {

        Json.mapper.registerModule(new VavrModule());
        Json.mapper.registerModule(new JavaTimeModule());
        Json.mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        Json.mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);

        var client = PgPool.pool(new PgConnectOptions()
                        .setPort(5432)
                        .setDatabase("postgres")
                        .setHost("localhost")
                        .setUser("viking")
                        .setPassword("viking"),
                new PoolOptions().setMaxSize(5));

        var results = client
                .rxPreparedQuery("""
                        select
                            row_to_json(d)::jsonb ||
                            json_build_object('members',
                                              array(select row_to_json(v)
                                                    from viking_in_drakkar vdk
                                                     join viking v on v.id = vdk.drakkar_id
                                                    where d.id = vdk.viking_id
                                                  ))::jsonb
                        from drakkar d
                        offset 20
                        limit 10;
                        """
                )
                .map(rows -> List.ofAll(rows)
                    .map(r ->
                        r.get(JsonObject.class, 0).mapTo(Drakkar.class)
                    )
                )
                .blockingGet();
        println(results.mkString("\n"));

//        client.rxPreparedQuery("""
//                        insert into viking_json(id, json) values($1, $2::jsonb)
//                        """,
//                        Tuple.of(
//                                "2000000000",
//                                JsonObject.mapFrom(new Viking("2000000000", "Lodbrok", "Ragnar", "M", 1, LocalDate.now()))
//                        )
//                ).blockingGet();
//                System.out.println("Done");

        client.close();
    }

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
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
