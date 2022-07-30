--CREATE DATABASE "pratica_Modelagem";
CREATE TABLE "states" (
	id SERIAL PRIMARY KEY,
	name  VARCHAR(50) NOT NULL
);

CREATE TABLE "cities" (
	id SERIAL PRIMARY KEY,
	name  VARCHAR(50) NOT NULL,
	"stateId" INTEGER NOT NULL REFERENCES "states"("id")
);


CREATE TABLE "customers" (
	id SERIAL PRIMARY KEY,
	"fullName"  VARCHAR(80) NOT NULL,
	"cpf" VARCHAR(10) UNIQUE NOT NULL,
	"email" VARCHAR(10) UNIQUE NOT NULL,
	"password" TEXT NOT NULL
);

CREATE TABLE "customerAddresses" (
	id SERIAL PRIMARY KEY,
	"customersId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"cityId" INTEGER NOT NULL REFERENCES "cities"("id"),
	street VARCHAR(50) NOT NULL,
	"number" INTEGER NOT NULL,
	"complement" VARCHAR(50),
	postalCode INTEGER
	
);

CREATE TABLE "customerPhones" (
	id SERIAL PRIMARY KEY,
	"customersId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"number" INTEGER NOT NULL,
	"type" VARCHAR(50)

	
);

CREATE TABLE "banckAccount" (
	id SERIAL PRIMARY KEY,
	"customersId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"accountNumber" INTEGER NOT NULL,
	"agency" INTEGER NOT NULL,
	"openDate" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
	"closeDate" TIMESTAMP WITHOUT TIME ZONE NOT NULL

	
);


CREATE TABLE "trasactions" (
	id SERIAL PRIMARY KEY,
	"banckAccountId" INTEGER NOT NULL REFERENCES "banckAccount"("id"),
	"amount" INTEGER NOT NULL DEFAULT 0,
	"type" VARCHAR(50) NOT NULL,
	"time" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
	"description" TEXT NOT NULL, 
	"cancelled" BOOLEAN NOT NULL DEFAULT FALSE

	
);


CREATE TABLE "creditCard" (
	id SERIAL PRIMARY KEY,
	"banckAccountId" INTEGER NOT NULL REFERENCES "banckAccount"("id"),
	"name"  VARCHAR(50) NOT NULL,
	"number" INTEGER NOT NULL,
	"securityCode" INTEGER NOT NULL,
	"exrationMonth" INTEGER NOT NULL,
	"exrationYear" INTEGER NOT NULL,
	"password" TEXT NOT NULL,
	"limit" INTEGER NOT NULL

	
);
