CREATE TABLE IF NOT EXISTS "Company" (
	"id" serial NOT NULL,
	"name" varchar(255),
	"adressID" int,
	"createdAt" timestamp,
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
	"createdAt" timestamp,
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "Person " (
	"id" serial NOT NULL,
	"first_name" varchar(255),
	"last_name" varchar(255),
	"createdAt" timestamp,
	"lastupdatedAt" timestamp,
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
	"authId" int,
	"CalenderId" int,
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "Role" (
	"id" serial NOT NULL,
	"right 1" boolean,
	"right 2" boolean,
	"right 3" boolean,
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "Product" (
	"id" serial NOT NULL,
	"PNr" int,
	"CategoryID" int,
	"title" varchar(255),
	"description" text(65535),
	"time" int,
	"price" decimal,
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "Category" (
	"id" serial NOT NULL,
	"name" varchar(255),
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "appointment" (
	"id" serial NOT NULL,
	"customerID" int,
	"itemId_1" int,
	"itemId_2" int,
	"itemId_3" int,
	"beginningTime" timestamp,
	"endTime" timestamp,
	"createdAt" timestamp,
	"lastupdatedAt" timestamp,
	"confirmed" boolean,
	"confirmedAt" boolean,
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "authentication" (
	"id" serial NOT NULL,
	"email" varchar(255),
	"hash" text(65535),
	"confirmed" boolean,
	"lastconfirm" timestamp,
	PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "Calender" (
	"id" serial NOT NULL,
	"aId" int,
	"comId" int,
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
ALTER TABLE "Product"
ADD FOREIGN KEY("CategoryID") REFERENCES "Category"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "appointment"
ADD FOREIGN KEY("itemId_1") REFERENCES "Product"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "appointment"
ADD FOREIGN KEY("customerID") REFERENCES "customer"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "authentication"
ADD FOREIGN KEY("id") REFERENCES "collaborator"("authId")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "collaborator"
ADD FOREIGN KEY("CalenderId") REFERENCES "Calender"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Calender"
ADD FOREIGN KEY("aId") REFERENCES "appointment"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Calender"
ADD FOREIGN KEY("comId") REFERENCES "Company"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "appointment"
ADD FOREIGN KEY("itemId_2") REFERENCES "Product"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "appointment"
ADD FOREIGN KEY("itemId_3") REFERENCES "Product"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;