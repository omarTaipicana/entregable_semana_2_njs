CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "age" int
);

CREATE TABLE "post" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "content" varchar NOT NULL,
  "author" int
);

CREATE TABLE "categories" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "comments" (
  "id" SERIAL PRIMARY KEY,
  "comment" varchar,
  "post_id" int,
  "author" int
);

CREATE TABLE "rel_post_category" (
  "post_id" int,
  "category_id" int
);

ALTER TABLE "post" ADD FOREIGN KEY ("author") REFERENCES "users" ("id");

ALTER TABLE "rel_post_category" ADD FOREIGN KEY ("post_id") REFERENCES "post" ("id");

ALTER TABLE "rel_post_category" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("author") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("post_id") REFERENCES "post" ("id");

insert into users  ("name","email","password","age")
values 
('Fernando','fernando@gmail.com','fer1234',31),
('Omar','omar@gmail.com','omar1234',32),
('Andrea','andhyyp@gmail.com','andriu1234',36);

insert into categories  ("name") values ('Evento'),('Deporte'),('Economía'),('Musica');


insert into post  ("title","description","content" ,"author")values 
('Cierre de curso','Culminacion del primer curso virtual','el 14 de septiembre culmina el primer curso virtual',3),
('Concierto de Bajo Sueños','Gira de Bajo Sueños','este viernes sera el magnifico concierto de la mejor banda deRock ecuatoriano',1);

insert into comments  ("comment","post_id","author") values 
('Excelente evento, muy bien organizado',1,2),
('Que gusto saber que se presentara la banda, no me perdere el concierto',2,2);

insert into rel_post_category  ("post_id", "category_id") values (1,1),(2,4);

-- https://dbdiagram.io/d/6361ff38c9abfc61116fb23d