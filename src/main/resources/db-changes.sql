create table IF NOT EXISTS viking (
    "id" text primary key,
    "name" text,
    "lastName" text,
    "gender" text,
    "numberOfBattles" int,
    "birthDate" date
);

create index viking_name_idx on viking("name");

create table IF NOT EXISTS drakkar(
    "id" text primary key,
    "name" text,
    "chief_id" text references viking("id")
);


create table IF NOT EXISTS viking_in_drakkar(
    "id" text primary key,
    "viking_id" text references viking(id),
    "drakkar_id" text references drakkar(id),
    unique("viking_id", "drakkar_id")
);


insert into viking ("id", "gender", "name",  "lastName", "numberOfBattles", "birthDate")
select
    id,
    'M',
    ('{Aasbjorn, Aasgeir, Aasgrim, Aaskell, Aaskjell, Aasleik, Aasleif, Aasleiv, Aasvald, Aasvard, Ag, Aggrim, Agmund, Agnar, Aake, Almar, Alvald, Alvar, Alvbjørn, Alvfinn, Alvgaut, Alvgeir, Arn, Arnbjorn, Arnfinn, Arnfred, Arngeir, Arngrim, Arni, Arnkjell, Arnleif, Arnleiv, Arnljot, Arnmod, Arnstein, Arnthor, Arnulf, Arnvald, Arnvid, Atli, Audar, Audbjorn, Audfinn, Audgrim, Audkjell, Audmund, Audstein, Audulv, Audun, Audvald,
Bard, Bendik, Berg, Bergsvein, Berulf, Berulv, Besse, Birgir, Bjarni, Bjermund, Bjorgulv, Bjorn, Bjornar, Bjornulv, Bodolf, Bogi, Boldolv, Bodvar, Borgi, Borgir, Borgulv, Borgvald, Borri, Botolv, Bredi, Bragi, Brusi, Brynjulf,
Dagfinn, Dreng, Dyri,
Egil, Eigil, Eilif, Eiliv, Eimund, Einar, Einvald, Eldar, Eiric, Erik, Erland, Erlend, Erling, Eystein, Eyyolf, Eyyolv,
Fartein, Faste, Finn, Finnbjorn, Finngard, Folki, Folkvald, Freyr, Fridleiv, Fridthjof, Frodi,
Gauti, Geir, Geirbrand, Geirmund, Geirolf, Geirolv, Geirstein, Geirulf, Geirulv, Gisli, Gissur, Glumir, Gorm, Grim, Grimkjell, Gudbjorn, Gudleik, Gudleiv, Gudmund, Gudolf, Gudolv, Gudstein, Gullbjorn, Gullbrand, Gullik, Gunbjorn, Gunnar, Gunnbjorn, Gunner, Gunnolf, Gunnolv, Gunnsten, Gunnstein, Gunnvald, Gunnvar, Gutorm, Guttorm,
Haabjorn, Hagbart, Haagen, Haaken, Haakon, Haarek, Haarik, Haavald, Haavard, Haavid, Halfdan, Hallbjorn, Hallfred, Hallgeir, Hallgrim, Halli, Hallkjell, Hallstein, Hallthor, Hallvard, Hallvor, Harald, Hauk, Heming, Hemming, Herbjorn, Herbrad, Herleif, Herleik, Herleiv, Hermod, Hermund, Hervard, Hildebrand, Hildemar, Hjalmar, Hogni, Holgir,
Ingar, Ingebjorn, Ingemar, Ingolf, Ingvald, Ingvar, Ivar, Iver,
Joar, Jogeir, Jor, Jorik, Jorulv, Jorund, Jostein,
Kaalv, Kaarbjorn, Kaare, Ketil, Kjetil, Kleng, Knut, Kol, Kolbein, Kolbjorn, Kolfinn, Kolgrim, Koll, Kolstein,
Leid, Leidolv, Leidulf, Leidulv, Leidvor, Leif, Leiv,
Magnar, Magni,
Narfi, Narvi, Nottolv,
Olaf, Olav, Odd, Oddbjorn, Oddfred, Oddgeir, Oddleif, Oddleiv, Oddmar, Oddmund, Oddvar, Odin, Olbjorn, Olgir, Olgeir, Olvar, Ottar,
Raadgeir, Raadmund, Raadolf, Raadolv, Ragnar, Ragnvald, Randmod, Randolf, Randolv, Reidalv, Reidar, Reidmar, Reidolf, Reidolv, Reidulf, Reidulv, Roald, Roar, Rolf, Rolleif, Rolleiv, Runolv, Rorek, Rorik, Runi,
Sigbjorn, Sigfred, Sigstein, Sigtrygg, Sigurd, Sigvald, Sigvat, Sjaundi, Skjalg, Skuli, Snorri, Solmund, Stein, Steinar, Steinbjorn, Steingrim, Stig, Styrbjorn, Svein, Sveinar, Sveinbjorn, Sveinung, Sverre, Sverri, Saebjorn, Saemund, Saevald,
Tali, Tarjei, Tjodgeir, Tjodolf, Tjoldolv, Tjodrek, Tjodrik, Toki, Thor, Thoralf, Thoralv, Thorbjorn, Thord, Thorfinn, Thorgeir, Thorgrim, Thorkel, Thorkell, Thorleik, Thorleiv, Thormod, Thorodd, Thorolf, Thorolv, Thorstein, Thorsten, Thorvald, Trond, Tryggvi,
Ulrik, Ulf, Ulv,
Vebjorn, Vegard, Vegeir, Vemund, Vidar, Vidkunn, Vigbjorn, Volund, Yngvi}'::text[])[round(random()*333+1)] as "name",
    ('{Aasbjornson, Aasgeison, Aasgrison, Aaskelsson, Aaskjelsson, Aasleikson, Aasleifson, Aasleivson, Aasvaldson, Aasvardson, Agson, Aggrimson, Agmundson, Agnason, Aakeson, Almason, Alvaldson, Alvason, Alvbjørnson, Alvfinsson, Alvgarson, Alvgeison, Arnson, Arnbjornson, Arnfinsson, Arngeison, Arnasson, Arnkjelsson, Arnleifson, Arnthoson, Arnulfson, Arnvaldson, Arnvidson, Atlasson, Audason, Audfinsson, Audkjelsson, Audmundson,
Bardson, Bendikson, Bergson, Bergsveinson, Berulfson, Berulvson, Besseson, Birgison, Bjarnasson, Bjermundson, Bjornason, Bjornulvson, Bogasson, Boldolvson, Bodvason, Borgasson, Borgison, Borrasson, Bredasson, Bragasson, Brusasson,
Dagfinsson, Dyrasson,
Eimundson, Einason, Eldason, Erikson, Erlandson, Erlendson, Erlingson, Eysteinson, Eyyolfson, Eyyolvson,
Farteinson, Fasteson, Finsson, Finnbjornson, Finngardson, Folkasson, Folkvaldson, Freyson, Fridleivson, Fridthjofson, Frodison,
Gautasson, Geison, Geirbrandson, Geirmundson, Geirolfson, Geirolvson, Geirsteinson, Geirulfson, Geirulvson, Gislasson, Gissuson, Glumison, Gormson, Grimson, Grimkjelsson, Gudbjornson, Gudleikson, Gudleivson, Gudmundson, Gudolfson, Gudolvson, Gudsteinson, Gullbjornson, Gullbrandson, Gullikson, Gunbjornson, Gunnason, Gunnbjornson, Gunneson, Gunnolfson, Gunnolvson, Gunnstenson, Gunnsteinson, Gunnvaldson, Gunnvason, Gutormson, Guttormson,
Haabjornson, Hagbartson, Haagenson, Haakenson, Haakonson, Haarekson, Haarikson, Haavaldson, Haavardson, Haavidson, Halfdanar· Hallbjornson, Hallfredson, Hallgeison, Hallgrimson, Hallasson, Hallkjelsson, Hallsteinson, Hallthoson, Hallvardson, Hallvoson, Haraldson, Haukson, Hemingson, Hemmingson, Herbjornson, Herbradson, Herleifson, Herleikson, Herleivson, Hermodson, Hermundson, Hervardson, Hildebrandson, Hildemason, Hjalmason, Hognasson, Holgison,
Ingason, Ingebjornson, Ingemason, Ingolfson, Ingvaldson, Ingvason, Ivason, Iver
Joason, Jogeison, Joson, Jorikson, Jorulvson, Jorundson, Jostein
Kaalvson, Kaarbjornson, Kaareson, Ketilson, Kjetilson, Klengson, Knutson, Kolson, Kolbeinson, Kolbjornson, Kolfinsson, Kolgrimson, Kolsson, Kolstein
Leidson, Leidolvson, Leidulfson, Leidulvson, Leidvoson, Leifson, Leivson,
Magnason, Magnasson,
Narfasson, Narvasson, Nottolvson,
Olafson, Olavson, Oddson, Oddbjornson, Oddfredson, Oddgeison, Oddleifson, Oddleivson, Oddmason, Oddmundson, Oddvason, Odinson, Olbjornson, Olgison, Olgeison, Olvason, Ottason,
Raadgeison, Raadmundson, Raadolfson, Raadolvson, Ragnason, Ragnvaldson, Randmodson, Randolfson, Randolvson, Reidalvson, Reidason, Reidmason, Reidolfson, Reidolvson, Reidulfson, Reidulvson, Roaldson, Roason, Rolfson, Rolleifson, Rolleivson, Runolvson, Rorekson, Rorikson, Runasson,
Sigbjornson, Sigfredson, Sigsteinson, Sigtryggson, Sigurdson, Sigvaldson, Sigvatson, Sjaundasson, Skjalgson, Skulasson, Snorrasson, Solmundson, Steinson, Steinason, Steinbjornson, Steingrimson, Stigson, Styrbjornson, Sveinson, Sveinason, Sveinbjornson, Sveinungson, Sverreson, Sverrasson, Saebjornson, Saemundson, Saevaldson,
Talasson, Tarjeasson, Tjodgeison, Tjodolfson, Tjoldolvson, Tjodrekson, Tjodrikson, Tokasson, Thoson, Thoralfson, Thoralvson, Thorbjornson, Thordson, Thorfinsson, Thorgeison, Thorgrimson, Thorkelson, Thorkelsson, Thorleikson, Thorleivson, Thormodson, Thoroddson, Thorolfson, Thorolvson, Thorsteinson, Thorstenson, Thorvaldson, Trondson, Tryggvasson,
Ulrikson, Ulfson, Ulvson,
Vebjornson, Vegardson, Vegeison, Vemundson, Vidason, Vidkunsson, Vigbjornson, Volundson, Yngvasson
}'::text[])[round(random()*303+1)] as "lastName",
    round(random() * 50) as "numberOfBattles",
    (timestamp '800-01-10 20:00:00' +
    random() * (timestamp '900-12-31 00:00:00' -
    timestamp '800-01-01 00:00:00'))::date as "birthDate"
from generate_series(1, 200000, 1) as id
;

insert into viking ("id", "gender", "name", "lastName", "numberOfBattles", "birthDate")
select
    id,
    'F',
    ('{Aadny, Aafrid, Aagunn, Aalaug, Aasa, Aasbjorg, Aase, Aasfrid, Aasgerd, Aashild, Aaslaug, Aasne, Aasrunn, Aasveig, Agnhild, Alfhild, Alfrid, Annbjorg, Annfrid, Anngjerd, Annhild, Annlaug, Annveig, Arnbjorg, Arnfrid, Arnhild, Arnhill, Arnlaug, Arnveig, Asbjorg, Asfrid, Asgjerd, Aslaug, Asrunn, Asta, Astrid, Asveig, Aud, Audbjorg, Audfrid, Audgerd, Audgunn, Audhild, Audrun, Audveig,
Bergfrid, Berghild, Bergljot, Bergthora, Bergunn, Bjarnhild, Bjorg, Bjorgfrid, Bjorghild, Bjorgunn, Bjorgveig, Bjornhild, Bodhild, Bodil, Borghild, Borgny, Borgunn, Bryngerd, Brynhild,
Dagbjorg, Dageid, Dagfrid, Daghild, Dagmoy, Dagny, Dagrun, Dagveig,
Eidbjorg, Eidfrid, Eidunn, Eirunn, Eivor, Eldbjorg, Eldfrid, Eldrid, Embla, Erika, Eydis, Eyrun, Eyvor,
Finngerd, Finnlaug, Fredbjorg, Fredgunn, Fredhild, Fredlaug, Fredmoy, Freidun, Freydis, Frida, Fridbjorg, Fridgunn, Fridhild,
Geirhild, Geirunn, Gerd, Gjartrud, Gro, Gudbjorg, Gudfrid, Gudlaug, Gudrun, Gudveig, Gudvor, Gunn, Gunbjorg, Gunda, Gunnbjorg, Gunnfrid, Gunnhild, Gunn, Gunnlaug, Gunnveig, Gunnvor, Gyda,
Hallbjorg, Hallfrid, Hallgerd, Hallgunn, Hallrid, Hallveig, Heidrun, Helga, Helgunn, Hella, Herbjorg, Herborg, Herfrid, Hergunn, Hervor, Hild, Hilda, Hilde, Hildebjorg, Hildeborg, Hildegunn, Hill, Hjartrud, Hjordis, Holmfrid, Hladgerd,
Idunn, Inga, Ingebjorg, Ingegerd, Inger, Inghild, Inglaug, Ingrid, Ingunn, Ingvild,
Jarlaug, Jarlfrid, Jarnhild, Joreid, Jorgunn, Jorhild, Jorfrid, Jorlaug, Jorunn,
Kjellaug, Kjellbjorg, Kjellfrid, Kjellrun, Kjellvor, Kjerlaug, Knuthild, Kollbjorg,
Lagertha, Lidveig, Lidvor, Liv, Liveig, Livunn, Lydveig, Lydvor,
Magnhild, Magnvor, Malfrid, Malmfrid, Mildfrid, Mildrun, Modgunn, Modhild, Moyfrid,
Norbjorg, Norfrid, Norgunn, Norhild, Norlaug, Norveig,
Oda, Oddbjorg, Oddfrid, Oddgunn, Oddlaug, Oddrun, Oddrunn, Oddveig, Odfrid, Odlaug, Odveig, Olbjorg, Oleiv, Olrun, Olveig, Oslaug, Oyfrid, Oygunn, Oylaug, Oyonn, Oyvor,
Ragna, Ragnfrid, Ragnhild, Rambjorg, Ramfrid, Randi, Ranfrid, Rannveig, Ranveig, Reidhild, Reidun, Reinhild, Runa, Runhild,
Sabjorg, Salmoy, Sebjorg, Sif, Sigbjorg, Sigfrid, Signe, Signhild, Signy, Sigrid, Sigrunn, Sigurda, Sigvalda, Sigvarda, Sigveig, Sigvor, Siv, Skjaldvor, Snefrid, Solaug, Solbjorg, Solfrid, Solgerd, Solgunn, Solhild, Sollaug, Solmoy, Solrunn, Solunn, Solveig, Solvor, Steinunn, Steinvor, Svanbjorg, Svanfrid, Svanhild, Svanlaug,
Thora, Thorbjorg, Thorborg, Thordis, Thordny, Thordun, Thorfrid, Torgerd, Thorgunn, Thorhild, Torgerd, Thorunn, Thorvalda, Thurid, Tjodhild, Tjodunn, Tjodvor, Tova, Tove, Trude, Trudi, Tryghild, Turid, Tuva,
Udbjorg, Ulvhild, Unn, Unnfrid, Unnhild, Unni, Unnlaug, Unnveig, Urda,
Valbjorg, Valfrid, Valgerd, Varunn, Vebjorg, Velaug, Venhild, Vidrun, Vigdis, Vighild, Vilbjorg, Vilborg, Vilfrid, Vilgerd, Vilgunn,
Ymbjorg, Yngvild}'::text[])[round(random()*317+1)] as "name",
    ('{Aasbjorndóttir, Aasgeidóttir, Aasgridóttir, Aaskelsdóttir, Aaskjelsdóttir, Aasleikdóttir, Aasleifdóttir, Aasleivdóttir, Aasvalddóttir, Aasvarddóttir, Agdóttir, Aggrimdóttir, Agmunddóttir, Agnadóttir, Aakedóttir, Almadóttir, Alvalddóttir, Alvadóttir, Alvbjørndóttir, Alvfinsdóttir, Alvgardóttir, Alvgeidóttir, Arndóttir, Arnbjorndóttir, Arnfinsdóttir, Arngeidóttir, Arnasdóttir, Arnkjelsdóttir, Arnleifdóttir, Arnthodóttir, Arnulfdóttir, Arnvalddóttir, Arnviddóttir, Atlasdóttir, Audadóttir, Audfinsdóttir, Audkjelsdóttir, Audmunddóttir,
Barddóttir, Bendikdóttir, Bergdóttir, Bergsveindóttir, Berulfdóttir, Berulvdóttir, Bessedóttir, Birgidóttir, Bjarnasdóttir, Bjermunddóttir, Bjornadóttir, Bjornulvdóttir, Bogasdóttir, Boldolvdóttir, Bodvadóttir, Borgasdóttir, Borgidóttir, Borrasdóttir, Bredasdóttir, Bragasdóttir, Brusasdóttir,
Dagfinsdóttir, Dyrasdóttir,
Eimunddóttir, Einadóttir, Eldadóttir, Erikdóttir, Erlanddóttir, Erlenddóttir, Erlingdóttir, Eysteindóttir, Eyyolfdóttir, Eyyolvdóttir,
Farteindóttir, Fastedóttir, Finsdóttir, Finnbjorndóttir, Finngarddóttir, Folkasdóttir, Folkvalddóttir, Freydóttir, Fridleivdóttir, Fridthjofdóttir, Frodidóttir,
Gautasdóttir, Geidóttir, Geirbranddóttir, Geirmunddóttir, Geirolfdóttir, Geirolvdóttir, Geirsteindóttir, Geirulfdóttir, Geirulvdóttir, Gislasdóttir, Gissudóttir, Glumidóttir, Gormdóttir, Grimdóttir, Grimkjelsdóttir, Gudbjorndóttir, Gudleikdóttir, Gudleivdóttir, Gudmunddóttir, Gudolfdóttir, Gudolvdóttir, Gudsteindóttir, Gullbjorndóttir, Gullbranddóttir, Gullikdóttir, Gunbjorndóttir, Gunnadóttir, Gunnbjorndóttir, Gunnedóttir, Gunnolfdóttir, Gunnolvdóttir, Gunnstendóttir, Gunnsteindóttir, Gunnvalddóttir, Gunnvadóttir, Gutormdóttir, Guttormdóttir,
Haabjorndóttir, Hagbartdóttir, Haagendóttir, Haakendóttir, Haakondóttir, Haarekdóttir, Haarikdóttir, Haavalddóttir, Haavarddóttir, Haaviddóttir, Halfdanar· Hallbjorndóttir, Hallfreddóttir, Hallgeidóttir, Hallgrimdóttir, Hallasdóttir, Hallkjelsdóttir, Hallsteindóttir, Hallthodóttir, Hallvarddóttir, Hallvodóttir, Haralddóttir, Haukdóttir, Hemingdóttir, Hemmingdóttir, Herbjorndóttir, Herbraddóttir, Herleifdóttir, Herleikdóttir, Herleivdóttir, Hermoddóttir, Hermunddóttir, Hervarddóttir, Hildebranddóttir, Hildemadóttir, Hjalmadóttir, Hognasdóttir, Holgidóttir,
Ingadóttir, Ingebjorndóttir, Ingemadóttir, Ingolfdóttir, Ingvalddóttir, Ingvadóttir, Ivadóttir, Iver
Joadóttir, Jogeidóttir, Jodóttir, Jorikdóttir, Jorulvdóttir, Jorunddóttir, Jostein
Kaalvdóttir, Kaarbjorndóttir, Kaaredóttir, Ketildóttir, Kjetildóttir, Klengdóttir, Knutdóttir, Koldóttir, Kolbeindóttir, Kolbjorndóttir, Kolfinsdóttir, Kolgrimdóttir, Kolsdóttir, Kolstein
Leiddóttir, Leidolvdóttir, Leidulfdóttir, Leidulvdóttir, Leidvodóttir, Leifdóttir, Leivdóttir,
Magnadóttir, Magnasdóttir,
Narfasdóttir, Narvasdóttir, Nottolvdóttir,
Olafdóttir, Olavdóttir, Odddóttir, Oddbjorndóttir, Oddfreddóttir, Oddgeidóttir, Oddleifdóttir, Oddleivdóttir, Oddmadóttir, Oddmunddóttir, Oddvadóttir, Odindóttir, Olbjorndóttir, Olgidóttir, Olgeidóttir, Olvadóttir, Ottadóttir,
Raadgeidóttir, Raadmunddóttir, Raadolfdóttir, Raadolvdóttir, Ragnadóttir, Ragnvalddóttir, Randmoddóttir, Randolfdóttir, Randolvdóttir, Reidalvdóttir, Reidadóttir, Reidmadóttir, Reidolfdóttir, Reidolvdóttir, Reidulfdóttir, Reidulvdóttir, Roalddóttir, Roadóttir, Rolfdóttir, Rolleifdóttir, Rolleivdóttir, Runolvdóttir, Rorekdóttir, Rorikdóttir, Runasdóttir,
Sigbjorndóttir, Sigfreddóttir, Sigsteindóttir, Sigtryggdóttir, Sigurddóttir, Sigvalddóttir, Sigvatdóttir, Sjaundasdóttir, Skjalgdóttir, Skulasdóttir, Snorrasdóttir, Solmunddóttir, Steindóttir, Steinadóttir, Steinbjorndóttir, Steingrimdóttir, Stigdóttir, Styrbjorndóttir, Sveindóttir, Sveinadóttir, Sveinbjorndóttir, Sveinungdóttir, Sverredóttir, Sverrasdóttir, Saebjorndóttir, Saemunddóttir, Saevalddóttir,
Talasdóttir, Tarjeasdóttir, Tjodgeidóttir, Tjodolfdóttir, Tjoldolvdóttir, Tjodrekdóttir, Tjodrikdóttir, Tokasdóttir, Thodóttir, Thoralfdóttir, Thoralvdóttir, Thorbjorndóttir, Thorddóttir, Thorfinsdóttir, Thorgeidóttir, Thorgrimdóttir, Thorkeldóttir, Thorkelsdóttir, Thorleikdóttir, Thorleivdóttir, Thormoddóttir, Thorodddóttir, Thorolfdóttir, Thorolvdóttir, Thorsteindóttir, Thorstendóttir, Thorvalddóttir, Tronddóttir, Tryggvasdóttir,
Ulrikdóttir, Ulfdóttir, Ulvdóttir,
Vebjorndóttir, Vegarddóttir, Vegeidóttir, Vemunddóttir, Vidadóttir, Vidkunsdóttir, Vigbjorndóttir, Volunddóttir, Yngvadóttir
}'::text[])[round(random()*303+1)] as "lastName",
    round(random() * 50) as "numberOfBattles",
    (timestamp '800-01-10 20:00:00' +
    random() * (timestamp '900-12-31 00:00:00' -
    timestamp '800-01-01 00:00:00'))::date as "birthDate"
from generate_series(200001, 400000, 1) as id
;


insert into drakkar ("id", "chief_id", "name")
select data.drakkar_id::text, data.viking_id, (select name from viking where id = data.viking_id)
from (
    select drakkar_id, (round(random()*400000))::text as viking_id
    from generate_series(1, 1000, 1) as drakkar_id
) as data;


insert into viking_in_drakkar ("id", "viking_id", "drakkar_id")
select id, round(random()*399999)+1, round(random()*999) + 1
from generate_series(1, 2000000, 1) as id
on conflict do nothing;


-------------------------------------------------------------------------------------------------------------
----------------------------                  JSON                   ----------------------------------------
-------------------------------------------------------------------------------------------------------------


create table IF NOT EXISTS viking_json (
    id text primary key,
    json jsonb not null
);

CREATE INDEX viking_json_idx ON viking_json using gin (json);


create table IF NOT EXISTS drakkar_json(
    "id" text primary key,
    json jsonb not null
);

CREATE INDEX drakkar_json_idx ON drakkar_json using gin (json);

create table IF NOT EXISTS viking_in_drakkar_json(
    "id" text primary key,
    "viking_id" text references viking_json(id),
    "drakkar_id" text references drakkar_json(id),
    unique("viking_id", "drakkar_id")
);



insert into viking_json ("id", "json")
select data.id, row_to_json(data.*) from (
    select id,
     'M' as "gender",
     ('{Aasbjorn, Aasgeir, Aasgrim, Aaskell, Aaskjell, Aasleik, Aasleif, Aasleiv, Aasvald, Aasvard, Ag, Aggrim, Agmund, Agnar, Aake, Almar, Alvald, Alvar, Alvbjørn, Alvfinn, Alvgaut, Alvgeir, Arn, Arnbjorn, Arnfinn, Arnfred, Arngeir, Arngrim, Arni, Arnkjell, Arnleif, Arnleiv, Arnljot, Arnmod, Arnstein, Arnthor, Arnulf, Arnvald, Arnvid, Atli, Audar, Audbjorn, Audfinn, Audgrim, Audkjell, Audmund, Audstein, Audulv, Audun, Audvald,
Bard, Bendik, Berg, Bergsvein, Berulf, Berulv, Besse, Birgir, Bjarni, Bjermund, Bjorgulv, Bjorn, Bjornar, Bjornulv, Bodolf, Bogi, Boldolv, Bodvar, Borgi, Borgir, Borgulv, Borgvald, Borri, Botolv, Bredi, Bragi, Brusi, Brynjulf,
Dagfinn, Dreng, Dyri,
Egil, Eigil, Eilif, Eiliv, Eimund, Einar, Einvald, Eldar, Eiric, Erik, Erland, Erlend, Erling, Eystein, Eyyolf, Eyyolv,
Fartein, Faste, Finn, Finnbjorn, Finngard, Folki, Folkvald, Freyr, Fridleiv, Fridthjof, Frodi,
Gauti, Geir, Geirbrand, Geirmund, Geirolf, Geirolv, Geirstein, Geirulf, Geirulv, Gisli, Gissur, Glumir, Gorm, Grim, Grimkjell, Gudbjorn, Gudleik, Gudleiv, Gudmund, Gudolf, Gudolv, Gudstein, Gullbjorn, Gullbrand, Gullik, Gunbjorn, Gunnar, Gunnbjorn, Gunner, Gunnolf, Gunnolv, Gunnsten, Gunnstein, Gunnvald, Gunnvar, Gutorm, Guttorm,
Haabjorn, Hagbart, Haagen, Haaken, Haakon, Haarek, Haarik, Haavald, Haavard, Haavid, Halfdan, Hallbjorn, Hallfred, Hallgeir, Hallgrim, Halli, Hallkjell, Hallstein, Hallthor, Hallvard, Hallvor, Harald, Hauk, Heming, Hemming, Herbjorn, Herbrad, Herleif, Herleik, Herleiv, Hermod, Hermund, Hervard, Hildebrand, Hildemar, Hjalmar, Hogni, Holgir,
Ingar, Ingebjorn, Ingemar, Ingolf, Ingvald, Ingvar, Ivar, Iver,
Joar, Jogeir, Jor, Jorik, Jorulv, Jorund, Jostein,
Kaalv, Kaarbjorn, Kaare, Ketil, Kjetil, Kleng, Knut, Kol, Kolbein, Kolbjorn, Kolfinn, Kolgrim, Koll, Kolstein,
Leid, Leidolv, Leidulf, Leidulv, Leidvor, Leif, Leiv,
Magnar, Magni,
Narfi, Narvi, Nottolv,
Olaf, Olav, Odd, Oddbjorn, Oddfred, Oddgeir, Oddleif, Oddleiv, Oddmar, Oddmund, Oddvar, Odin, Olbjorn, Olgir, Olgeir, Olvar, Ottar,
Raadgeir, Raadmund, Raadolf, Raadolv, Ragnar, Ragnvald, Randmod, Randolf, Randolv, Reidalv, Reidar, Reidmar, Reidolf, Reidolv, Reidulf, Reidulv, Roald, Roar, Rolf, Rolleif, Rolleiv, Runolv, Rorek, Rorik, Runi,
Sigbjorn, Sigfred, Sigstein, Sigtrygg, Sigurd, Sigvald, Sigvat, Sjaundi, Skjalg, Skuli, Snorri, Solmund, Stein, Steinar, Steinbjorn, Steingrim, Stig, Styrbjorn, Svein, Sveinar, Sveinbjorn, Sveinung, Sverre, Sverri, Saebjorn, Saemund, Saevald,
Tali, Tarjei, Tjodgeir, Tjodolf, Tjoldolv, Tjodrek, Tjodrik, Toki, Thor, Thoralf, Thoralv, Thorbjorn, Thord, Thorfinn, Thorgeir, Thorgrim, Thorkel, Thorkell, Thorleik, Thorleiv, Thormod, Thorodd, Thorolf, Thorolv, Thorstein, Thorsten, Thorvald, Trond, Tryggvi,
Ulrik, Ulf, Ulv,
Vebjorn, Vegard, Vegeir, Vemund, Vidar, Vidkunn, Vigbjorn, Volund, Yngvi}'::text[])[round(random()*333+1)] as "name",
('{Aasbjornson, Aasgeison, Aasgrison, Aaskelsson, Aaskjelsson, Aasleikson, Aasleifson, Aasleivson, Aasvaldson, Aasvardson, Agson, Aggrimson, Agmundson, Agnason, Aakeson, Almason, Alvaldson, Alvason, Alvbjørnson, Alvfinsson, Alvgarson, Alvgeison, Arnson, Arnbjornson, Arnfinsson, Arngeison, Arnasson, Arnkjelsson, Arnleifson, Arnthoson, Arnulfson, Arnvaldson, Arnvidson, Atlasson, Audason, Audfinsson, Audkjelsson, Audmundson,
Bardson, Bendikson, Bergson, Bergsveinson, Berulfson, Berulvson, Besseson, Birgison, Bjarnasson, Bjermundson, Bjornason, Bjornulvson, Bogasson, Boldolvson, Bodvason, Borgasson, Borgison, Borrasson, Bredasson, Bragasson, Brusasson,
Dagfinsson, Dyrasson,
Eimundson, Einason, Eldason, Erikson, Erlandson, Erlendson, Erlingson, Eysteinson, Eyyolfson, Eyyolvson,
Farteinson, Fasteson, Finsson, Finnbjornson, Finngardson, Folkasson, Folkvaldson, Freyson, Fridleivson, Fridthjofson, Frodison,
Gautasson, Geison, Geirbrandson, Geirmundson, Geirolfson, Geirolvson, Geirsteinson, Geirulfson, Geirulvson, Gislasson, Gissuson, Glumison, Gormson, Grimson, Grimkjelsson, Gudbjornson, Gudleikson, Gudleivson, Gudmundson, Gudolfson, Gudolvson, Gudsteinson, Gullbjornson, Gullbrandson, Gullikson, Gunbjornson, Gunnason, Gunnbjornson, Gunneson, Gunnolfson, Gunnolvson, Gunnstenson, Gunnsteinson, Gunnvaldson, Gunnvason, Gutormson, Guttormson,
Haabjornson, Hagbartson, Haagenson, Haakenson, Haakonson, Haarekson, Haarikson, Haavaldson, Haavardson, Haavidson, Halfdanar· Hallbjornson, Hallfredson, Hallgeison, Hallgrimson, Hallasson, Hallkjelsson, Hallsteinson, Hallthoson, Hallvardson, Hallvoson, Haraldson, Haukson, Hemingson, Hemmingson, Herbjornson, Herbradson, Herleifson, Herleikson, Herleivson, Hermodson, Hermundson, Hervardson, Hildebrandson, Hildemason, Hjalmason, Hognasson, Holgison,
Ingason, Ingebjornson, Ingemason, Ingolfson, Ingvaldson, Ingvason, Ivason, Iver
Joason, Jogeison, Joson, Jorikson, Jorulvson, Jorundson, Jostein
Kaalvson, Kaarbjornson, Kaareson, Ketilson, Kjetilson, Klengson, Knutson, Kolson, Kolbeinson, Kolbjornson, Kolfinsson, Kolgrimson, Kolsson, Kolstein
Leidson, Leidolvson, Leidulfson, Leidulvson, Leidvoson, Leifson, Leivson,
Magnason, Magnasson,
Narfasson, Narvasson, Nottolvson,
Olafson, Olavson, Oddson, Oddbjornson, Oddfredson, Oddgeison, Oddleifson, Oddleivson, Oddmason, Oddmundson, Oddvason, Odinson, Olbjornson, Olgison, Olgeison, Olvason, Ottason,
Raadgeison, Raadmundson, Raadolfson, Raadolvson, Ragnason, Ragnvaldson, Randmodson, Randolfson, Randolvson, Reidalvson, Reidason, Reidmason, Reidolfson, Reidolvson, Reidulfson, Reidulvson, Roaldson, Roason, Rolfson, Rolleifson, Rolleivson, Runolvson, Rorekson, Rorikson, Runasson,
Sigbjornson, Sigfredson, Sigsteinson, Sigtryggson, Sigurdson, Sigvaldson, Sigvatson, Sjaundasson, Skjalgson, Skulasson, Snorrasson, Solmundson, Steinson, Steinason, Steinbjornson, Steingrimson, Stigson, Styrbjornson, Sveinson, Sveinason, Sveinbjornson, Sveinungson, Sverreson, Sverrasson, Saebjornson, Saemundson, Saevaldson,
Talasson, Tarjeasson, Tjodgeison, Tjodolfson, Tjoldolvson, Tjodrekson, Tjodrikson, Tokasson, Thoson, Thoralfson, Thoralvson, Thorbjornson, Thordson, Thorfinsson, Thorgeison, Thorgrimson, Thorkelson, Thorkelsson, Thorleikson, Thorleivson, Thormodson, Thoroddson, Thorolfson, Thorolvson, Thorsteinson, Thorstenson, Thorvaldson, Trondson, Tryggvasson,
Ulrikson, Ulfson, Ulvson,
Vebjornson, Vegardson, Vegeison, Vemundson, Vidason, Vidkunsson, Vigbjornson, Volundson, Yngvasson
}':: text [])[round(random()*303+1)] as "lastName",
        round(random() * 50) as "numberOfBattles",
        (timestamp '800-01-10 20:00:00' +
        random() * (timestamp '900-12-31 00:00:00' -
        timestamp '800-01-01 00:00:00'))::date as "birthDate"
from generate_series(1, 200000, 1) as id
) as data;

insert into viking_json ("id", "json")
select data.id, row_to_json(data.*) from (
select
    id,
    'F' as "gender",
    ('{Aadny, Aafrid, Aagunn, Aalaug, Aasa, Aasbjorg, Aase, Aasfrid, Aasgerd, Aashild, Aaslaug, Aasne, Aasrunn, Aasveig, Agnhild, Alfhild, Alfrid, Annbjorg, Annfrid, Anngjerd, Annhild, Annlaug, Annveig, Arnbjorg, Arnfrid, Arnhild, Arnhill, Arnlaug, Arnveig, Asbjorg, Asfrid, Asgjerd, Aslaug, Asrunn, Asta, Astrid, Asveig, Aud, Audbjorg, Audfrid, Audgerd, Audgunn, Audhild, Audrun, Audveig,
Bergfrid, Berghild, Bergljot, Bergthora, Bergunn, Bjarnhild, Bjorg, Bjorgfrid, Bjorghild, Bjorgunn, Bjorgveig, Bjornhild, Bodhild, Bodil, Borghild, Borgny, Borgunn, Bryngerd, Brynhild,
Dagbjorg, Dageid, Dagfrid, Daghild, Dagmoy, Dagny, Dagrun, Dagveig,
Eidbjorg, Eidfrid, Eidunn, Eirunn, Eivor, Eldbjorg, Eldfrid, Eldrid, Embla, Erika, Eydis, Eyrun, Eyvor,
Finngerd, Finnlaug, Fredbjorg, Fredgunn, Fredhild, Fredlaug, Fredmoy, Freidun, Freydis, Frida, Fridbjorg, Fridgunn, Fridhild,
Geirhild, Geirunn, Gerd, Gjartrud, Gro, Gudbjorg, Gudfrid, Gudlaug, Gudrun, Gudveig, Gudvor, Gunn, Gunbjorg, Gunda, Gunnbjorg, Gunnfrid, Gunnhild, Gunn, Gunnlaug, Gunnveig, Gunnvor, Gyda,
Hallbjorg, Hallfrid, Hallgerd, Hallgunn, Hallrid, Hallveig, Heidrun, Helga, Helgunn, Hella, Herbjorg, Herborg, Herfrid, Hergunn, Hervor, Hild, Hilda, Hilde, Hildebjorg, Hildeborg, Hildegunn, Hill, Hjartrud, Hjordis, Holmfrid, Hladgerd,
Idunn, Inga, Ingebjorg, Ingegerd, Inger, Inghild, Inglaug, Ingrid, Ingunn, Ingvild,
Jarlaug, Jarlfrid, Jarnhild, Joreid, Jorgunn, Jorhild, Jorfrid, Jorlaug, Jorunn,
Kjellaug, Kjellbjorg, Kjellfrid, Kjellrun, Kjellvor, Kjerlaug, Knuthild, Kollbjorg,
Lagertha, Lidveig, Lidvor, Liv, Liveig, Livunn, Lydveig, Lydvor,
Magnhild, Magnvor, Malfrid, Malmfrid, Mildfrid, Mildrun, Modgunn, Modhild, Moyfrid,
Norbjorg, Norfrid, Norgunn, Norhild, Norlaug, Norveig,
Oda, Oddbjorg, Oddfrid, Oddgunn, Oddlaug, Oddrun, Oddrunn, Oddveig, Odfrid, Odlaug, Odveig, Olbjorg, Oleiv, Olrun, Olveig, Oslaug, Oyfrid, Oygunn, Oylaug, Oyonn, Oyvor,
Ragna, Ragnfrid, Ragnhild, Rambjorg, Ramfrid, Randi, Ranfrid, Rannveig, Ranveig, Reidhild, Reidun, Reinhild, Runa, Runhild,
Sabjorg, Salmoy, Sebjorg, Sif, Sigbjorg, Sigfrid, Signe, Signhild, Signy, Sigrid, Sigrunn, Sigurda, Sigvalda, Sigvarda, Sigveig, Sigvor, Siv, Skjaldvor, Snefrid, Solaug, Solbjorg, Solfrid, Solgerd, Solgunn, Solhild, Sollaug, Solmoy, Solrunn, Solunn, Solveig, Solvor, Steinunn, Steinvor, Svanbjorg, Svanfrid, Svanhild, Svanlaug,
Thora, Thorbjorg, Thorborg, Thordis, Thordny, Thordun, Thorfrid, Torgerd, Thorgunn, Thorhild, Torgerd, Thorunn, Thorvalda, Thurid, Tjodhild, Tjodunn, Tjodvor, Tova, Tove, Trude, Trudi, Tryghild, Turid, Tuva,
Udbjorg, Ulvhild, Unn, Unnfrid, Unnhild, Unni, Unnlaug, Unnveig, Urda,
Valbjorg, Valfrid, Valgerd, Varunn, Vebjorg, Velaug, Venhild, Vidrun, Vigdis, Vighild, Vilbjorg, Vilborg, Vilfrid, Vilgerd, Vilgunn,
Ymbjorg, Yngvild}'::text[])[round(random()*317+1)] as "name",
    ('{Aasbjorndóttir, Aasgeidóttir, Aasgridóttir, Aaskelsdóttir, Aaskjelsdóttir, Aasleikdóttir, Aasleifdóttir, Aasleivdóttir, Aasvalddóttir, Aasvarddóttir, Agdóttir, Aggrimdóttir, Agmunddóttir, Agnadóttir, Aakedóttir, Almadóttir, Alvalddóttir, Alvadóttir, Alvbjørndóttir, Alvfinsdóttir, Alvgardóttir, Alvgeidóttir, Arndóttir, Arnbjorndóttir, Arnfinsdóttir, Arngeidóttir, Arnasdóttir, Arnkjelsdóttir, Arnleifdóttir, Arnthodóttir, Arnulfdóttir, Arnvalddóttir, Arnviddóttir, Atlasdóttir, Audadóttir, Audfinsdóttir, Audkjelsdóttir, Audmunddóttir,
Barddóttir, Bendikdóttir, Bergdóttir, Bergsveindóttir, Berulfdóttir, Berulvdóttir, Bessedóttir, Birgidóttir, Bjarnasdóttir, Bjermunddóttir, Bjornadóttir, Bjornulvdóttir, Bogasdóttir, Boldolvdóttir, Bodvadóttir, Borgasdóttir, Borgidóttir, Borrasdóttir, Bredasdóttir, Bragasdóttir, Brusasdóttir,
Dagfinsdóttir, Dyrasdóttir,
Eimunddóttir, Einadóttir, Eldadóttir, Erikdóttir, Erlanddóttir, Erlenddóttir, Erlingdóttir, Eysteindóttir, Eyyolfdóttir, Eyyolvdóttir,
Farteindóttir, Fastedóttir, Finsdóttir, Finnbjorndóttir, Finngarddóttir, Folkasdóttir, Folkvalddóttir, Freydóttir, Fridleivdóttir, Fridthjofdóttir, Frodidóttir,
Gautasdóttir, Geidóttir, Geirbranddóttir, Geirmunddóttir, Geirolfdóttir, Geirolvdóttir, Geirsteindóttir, Geirulfdóttir, Geirulvdóttir, Gislasdóttir, Gissudóttir, Glumidóttir, Gormdóttir, Grimdóttir, Grimkjelsdóttir, Gudbjorndóttir, Gudleikdóttir, Gudleivdóttir, Gudmunddóttir, Gudolfdóttir, Gudolvdóttir, Gudsteindóttir, Gullbjorndóttir, Gullbranddóttir, Gullikdóttir, Gunbjorndóttir, Gunnadóttir, Gunnbjorndóttir, Gunnedóttir, Gunnolfdóttir, Gunnolvdóttir, Gunnstendóttir, Gunnsteindóttir, Gunnvalddóttir, Gunnvadóttir, Gutormdóttir, Guttormdóttir,
Haabjorndóttir, Hagbartdóttir, Haagendóttir, Haakendóttir, Haakondóttir, Haarekdóttir, Haarikdóttir, Haavalddóttir, Haavarddóttir, Haaviddóttir, Halfdanar· Hallbjorndóttir, Hallfreddóttir, Hallgeidóttir, Hallgrimdóttir, Hallasdóttir, Hallkjelsdóttir, Hallsteindóttir, Hallthodóttir, Hallvarddóttir, Hallvodóttir, Haralddóttir, Haukdóttir, Hemingdóttir, Hemmingdóttir, Herbjorndóttir, Herbraddóttir, Herleifdóttir, Herleikdóttir, Herleivdóttir, Hermoddóttir, Hermunddóttir, Hervarddóttir, Hildebranddóttir, Hildemadóttir, Hjalmadóttir, Hognasdóttir, Holgidóttir,
Ingadóttir, Ingebjorndóttir, Ingemadóttir, Ingolfdóttir, Ingvalddóttir, Ingvadóttir, Ivadóttir, Iver
Joadóttir, Jogeidóttir, Jodóttir, Jorikdóttir, Jorulvdóttir, Jorunddóttir, Jostein
Kaalvdóttir, Kaarbjorndóttir, Kaaredóttir, Ketildóttir, Kjetildóttir, Klengdóttir, Knutdóttir, Koldóttir, Kolbeindóttir, Kolbjorndóttir, Kolfinsdóttir, Kolgrimdóttir, Kolsdóttir, Kolstein
Leiddóttir, Leidolvdóttir, Leidulfdóttir, Leidulvdóttir, Leidvodóttir, Leifdóttir, Leivdóttir,
Magnadóttir, Magnasdóttir,
Narfasdóttir, Narvasdóttir, Nottolvdóttir,
Olafdóttir, Olavdóttir, Odddóttir, Oddbjorndóttir, Oddfreddóttir, Oddgeidóttir, Oddleifdóttir, Oddleivdóttir, Oddmadóttir, Oddmunddóttir, Oddvadóttir, Odindóttir, Olbjorndóttir, Olgidóttir, Olgeidóttir, Olvadóttir, Ottadóttir,
Raadgeidóttir, Raadmunddóttir, Raadolfdóttir, Raadolvdóttir, Ragnadóttir, Ragnvalddóttir, Randmoddóttir, Randolfdóttir, Randolvdóttir, Reidalvdóttir, Reidadóttir, Reidmadóttir, Reidolfdóttir, Reidolvdóttir, Reidulfdóttir, Reidulvdóttir, Roalddóttir, Roadóttir, Rolfdóttir, Rolleifdóttir, Rolleivdóttir, Runolvdóttir, Rorekdóttir, Rorikdóttir, Runasdóttir,
Sigbjorndóttir, Sigfreddóttir, Sigsteindóttir, Sigtryggdóttir, Sigurddóttir, Sigvalddóttir, Sigvatdóttir, Sjaundasdóttir, Skjalgdóttir, Skulasdóttir, Snorrasdóttir, Solmunddóttir, Steindóttir, Steinadóttir, Steinbjorndóttir, Steingrimdóttir, Stigdóttir, Styrbjorndóttir, Sveindóttir, Sveinadóttir, Sveinbjorndóttir, Sveinungdóttir, Sverredóttir, Sverrasdóttir, Saebjorndóttir, Saemunddóttir, Saevalddóttir,
Talasdóttir, Tarjeasdóttir, Tjodgeidóttir, Tjodolfdóttir, Tjoldolvdóttir, Tjodrekdóttir, Tjodrikdóttir, Tokasdóttir, Thodóttir, Thoralfdóttir, Thoralvdóttir, Thorbjorndóttir, Thorddóttir, Thorfinsdóttir, Thorgeidóttir, Thorgrimdóttir, Thorkeldóttir, Thorkelsdóttir, Thorleikdóttir, Thorleivdóttir, Thormoddóttir, Thorodddóttir, Thorolfdóttir, Thorolvdóttir, Thorsteindóttir, Thorstendóttir, Thorvalddóttir, Tronddóttir, Tryggvasdóttir,
Ulrikdóttir, Ulfdóttir, Ulvdóttir,
Vebjorndóttir, Vegarddóttir, Vegeidóttir, Vemunddóttir, Vidadóttir, Vidkunsdóttir, Vigbjorndóttir, Volunddóttir, Yngvadóttir
}'::text[])[round(random()*303+1)] as "lastName",
    round(random() * 50) as "numberOfBattles",
    (timestamp '800-01-10 20:00:00' +
    random() * (timestamp '900-12-31 00:00:00' -
    timestamp '800-01-01 00:00:00'))::date as "birthDate"
from generate_series(200001, 400000, 1) as id
) as data;


insert into drakkar_json ("id", "json")
select json.id, row_to_json(json.*) from
    (select data.drakkar_id::text as "id", data.viking_id  as "chief_id", (select name from viking where id = data.viking_id) as "name"
     from (
              select drakkar_id, (round(random()*400000))::text as viking_id
              from generate_series(1, 1000, 1) as drakkar_id
          ) as data
    ) as json;


insert into viking_in_drakkar_json ("id", "viking_id", "drakkar_id")
select id, round(random()*399999)+1, round(random()*999) + 1
from generate_series(1, 2000000, 1) as id
on conflict do nothing;




drop table viking_in_drakkar;
drop table drakkar;
drop table viking;

drop table viking_in_drakkar_json;
drop table drakkar_json;
drop table viking_json;