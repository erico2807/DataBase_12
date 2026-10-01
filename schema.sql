CREATE TABLE IF NOT EXISTS "Company" (
	"id" serial NOT NULL,
	"name" varchar(255),
	"adressID" int,
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "adresse" (
	"id" serial NOT NULL,
	"place" varchar(255),
	"street" varchar(255),
	"house_number" int,
	"zip_code" int,
	"state" varchar(255),
	"country" varchar(255),
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "Person " (
	"id" serial NOT NULL,
	"first_name" varchar(255),
	"last_name" varchar(255),
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "customer" (
	"id" serial NOT NULL,
	"pID" int,
	"email" varchar(255),
	"telNr" int,
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "collaborator" (
	"id" serial NOT NULL,
	"pID" int,
	"roleID" int,
	"companyID" int,
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "Role" (
	"id" serial NOT NULL,
	"right 1" boolean,
	"right 2" boolean,
	"right 3" boolean,
	PRIMARY KEY("id")
);

ALTER TABLE "adresse"
ADD FOREIGN KEY("id") REFERENCES "Company"("adressID")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "collaborator"
ADD FOREIGN KEY("pID") REFERENCES "Person "("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "customer"
ADD FOREIGN KEY("pID") REFERENCES "Person "("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "collaborator"
ADD FOREIGN KEY("roleID") REFERENCES "Role"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "collaborator"
ADD FOREIGN KEY("companyID") REFERENCES "Company"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;