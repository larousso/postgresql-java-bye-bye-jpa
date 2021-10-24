package demo;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import io.vavr.collection.List;
import io.vavr.jackson.datatype.VavrModule;
import io.vertx.core.json.JsonArray;
import io.vertx.core.json.JsonObject;
import io.vertx.core.json.jackson.DatabindCodec;
import io.vertx.pgclient.PgConnectOptions;
import io.vertx.pgclient.PgPool;
import io.vertx.sqlclient.Tuple;
import io.vertx.sqlclient.PoolOptions;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.UUID;

import static io.vavr.API.println;


public class App {
    public static void main(String[] args) {
        initJsonCodecs();
        var client = initDb();

var results = client
        .preparedQuery("""
                select row_to_json(d)::jsonb ||
                        json_build_object(
                            'chief', (select row_to_json(v)
                                      from viking v
                                      where v.id = d.chief_id
                            ),
                            'members', array(select row_to_json(v)
                                from viking v
                                join viking_in_drakkar vidj on v.id = vidj.viking_id
                                where vidj.drakkar_id = d.id
                            )
                        )::jsonb
                 from drakkar d
                 limit 10;
                """
        )
        .mapping(r -> r.getJsonObject(0).mapTo(Drakkar.class))
        .execute()
        .map(List::ofAll)
        .toCompletionStage().toCompletableFuture().join();
println(results.mkString("\n"));
//
//client.preparedQuery("""
//        insert into viking
//        select *
//        from json_populate_record(null::viking, $1);
//         """
//).execute(Tuple.of(
//        JsonObject.mapFrom(
//                new Viking(
//                        UUID.randomUUID().toString(),
//                        "Devfest",
//                        "Nantes",
//                        "M",
//                        4,
//                        LocalDate.now()
//                )
//        )
//)).toCompletionStage().toCompletableFuture().join();
//

//        client.preparedQuery("""
//                insert into viking
//                select *
//                from json_populate_recordset(null::viking, $1);
//                 """
//        ).execute(Tuple.of(
//                new JsonArray(java.util.List.of(
//                        JsonObject.mapFrom(new Viking(UUID.randomUUID().toString(), "Lodbrok", "Ragnar", "M", 4, LocalDate.now())),
//                        JsonObject.mapFrom(new Viking(UUID.randomUUID().toString(), "Lodbrok", "Ragnar", "M", 5, LocalDate.now()))
//                ))
//        )).toCompletionStage().toCompletableFuture().join();
//
//client.preparedQuery("""
//        insert into viking
//        select *
//        from json_populate_record(null::viking, $1)
//        on conflict ("id") do update
//        set ("id" ,"name" ,"lastName" ,"gender" ,"numberOfBattles" ,"birthDate") =
//        (
//            select
//                "id" ,"name" ,"lastName" ,"gender" ,"numberOfBattles" ,"birthDate"
//            from json_populate_record(null::viking, $1)
//        );
//         """
//).execute(Tuple.of(JsonObject.mapFrom(
//        new Viking(
//                "1",
//                "Lodbrok",
//                "Ragnar",
//                "M",
//                4,
//                LocalDate.now()
//        ))
//)).toCompletionStage().toCompletableFuture().join();
//
//        client.preparedQuery("""
//                insert into viking_json(id, json) values($1, $2::jsonb)
//                """
//        ).execute(Tuple.of(
//                "2000000000",
//                JsonObject.mapFrom(new Viking("2000000000", "Lodbrok", "Ragnar", "M", 1, LocalDate.now()))
//        )).toCompletionStage().toCompletableFuture().join();

        System.out.println("Done");
client.preparedQuery("""
        insert into viking
        select *
        from json_populate_record(null::viking, $1)
        on conflict ("id") do update
        set ("id" ,"name" ,"lastName" ,"gender" ,"numberOfBattles" ,"birthDate") =
        (
            select
                "id" ,"name" ,"lastName" ,"gender" ,"numberOfBattles" ,"birthDate"
            from json_populate_record(null::viking, $1)
        );
         """
        ).execute(Tuple.of(JsonObject.mapFrom(
                new Viking(
                        "1",
                        "Lodbrok",
                        "Ragnar",
                        "M",
                        4,
                        LocalDate.now()
                ))
        ));
        client.close();
    }

    private static PgPool initDb() {
        return PgPool.pool(new PgConnectOptions()
                        .setPort(5555)
                        .setDatabase("viking")
                        .setHost("localhost")
                        .setUser("viking")
                        .setPassword("viking"),
                new PoolOptions().setMaxSize(5));
    }

    private static void initJsonCodecs() {
        DatabindCodec.mapper().registerModule(new VavrModule());
        DatabindCodec.mapper().registerModule(new JavaTimeModule());
        DatabindCodec.mapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        DatabindCodec.mapper().configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
    }

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class Viking {
        public String id;
        public String name;
        public String lastName;
        public String gender;
        public Integer numberOfBattles;
        public LocalDate birthDate;
    }

    @Data
    public static class Drakkar {
        public String id;
        public String name;
        public Viking chief;
        public java.util.List<Viking> members;
    }

}
