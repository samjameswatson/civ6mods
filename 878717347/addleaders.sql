
INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_JAYAVARMAN","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_JAYAVARMAN"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_JAYAVARMAN","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_JAYAVARMAN");



INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_JOHN_CURTIN","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_JOHN_CURTIN"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_JOHN_CURTIN","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_JOHN_CURTIN");



INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_MONTEZUMA","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_MONTEZUMA"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_MONTEZUMA","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_MONTEZUMA");


INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_ALEXANDER","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_ALEXANDER"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_ALEXANDER","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_ALEXANDER");


INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_CYRUS","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_CYRUS"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_CYRUS","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_CYRUS");

INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_AMANITORE","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_AMANITORE"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_AMANITORE","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_AMANITORE");

INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_JADWIGA","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_JADWIGA"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_JADWIGA","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_JADWIGA");


INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_CHANDRAGUPTA","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_CHANDRAGUPTA"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_CHANDRAGUPTA","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_CHANDRAGUPTA");


INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_GENGHIS_KHAN","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_GENGHIS_KHAN"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_GENGHIS_KHAN","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_GENGHIS_KHAN");


INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_LAUTARO","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_LAUTARO"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_LAUTARO","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_LAUTARO");


INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_POUNDMAKER","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_POUNDMAKER"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_POUNDMAKER","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_POUNDMAKER");


INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_ROBERT_THE_BRUCE","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_ROBERT_THE_BRUCE"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_ROBERT_THE_BRUCE","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_ROBERT_THE_BRUCE");


INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_SEONDEOK","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_SEONDEOK"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_SEONDEOK","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_SEONDEOK");

INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_SHAKA","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_SHAKA"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_SHAKA","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_SHAKA");


INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_TAMAR","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_TAMAR"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_TAMAR","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_TAMAR");


INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_WILHELMINA","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_WILHELMINA"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_WILHELMINA","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_WILHELMINA");



INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_GITARJA","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_GITARJA"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_GITARJA","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_GITARJA");



INSERT INTO Types (Type,Kind)
SELECT "LEADER_MATTHIAS_CORVINUS","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_MATTHIAS_CORVINUS");


INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_MATTHIAS_CORVINUS","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_MATTHIAS_CORVINUS"); 


INSERT INTO Types (Type,Kind)
SELECT "LEADER_MANSA_MUSA","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_MANSA_MUSA");

INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_MANSA_MUSA","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_MANSA_MUSA"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_PACHACUTI","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_PACHACUTI");

INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_PACHACUTI","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_PACHACUTI"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_DIDO","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_DIDO");

INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_DIDO","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_DIDO"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_SULEIMAN","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_SULEIMAN");

INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_SULEIMAN","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_SULEIMAN"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_KUPE","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_KUPE");

INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_KUPE","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_KUPE"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_LAURIER","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_LAURIER");

INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_LAURIER","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_LAURIER"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_KRISTINA","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_KRISTINA");

INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_KRISTINA","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_KRISTINA"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_ELEANOR_ENGLAND","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_ELEANOR_ENGLAND");

INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_ELEANOR_ENGLAND","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_ELEANOR_ENGLAND"); 

INSERT INTO Types (Type,Kind)
SELECT "LEADER_ELEANOR_FRANCE","KIND_LEADER"
WHERE NOT EXISTS ( SELECT * FROM Types WHERE Type = "LEADER_ELEANOR_FRANCE");

INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) 
SELECT "LEADER_ELEANOR_FRANCE","","LEADER_DEFAULT","4"
WHERE NOT EXISTS ( SELECT * FROM Leaders WHERE LeaderType = "LEADER_ELEANOR_FRANCE"); 






