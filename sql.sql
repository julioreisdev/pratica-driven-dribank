--CREATE DATABASE dribank;
CREATE TABLE states (
	id serial PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE cities (
	id serial PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	"stateId" INTEGER NOT NULL REFERENCES states(id)
);

CREATE TABLE customers (
	id serial PRIMARY KEY,
	"fullName" VARCHAR(50) NOT NULL,
	cpf VARCHAR(11) NOT NULL UNIQUE,
	email TEXT NOT NULL UNIQUE,
	password TEXT NOT NULL
);

CREATE TABLE customerAddresess (
	id serial PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES customers(id),
	street TEXT NOT NULL,
	number INTEGER NOT NULL,
	complement TEXT NOT NULL,
	"potalCode" VARCHAR(8) NOT NULL,
	"cityId" INTEGER NOT NULL REFERENCES cities(id)
);

CREATE TABLE customerPhones (
	id serial PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES customers(id),
	number TEXT NOT NULL,
	type VARCHAR(6) NOT NULL
);

CREATE TABLE bankAccount (
	id serial PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES customers(id),
	"accountNumber" VARCHAR(10) NOT NULL UNIQUE,
	agency VARCHAR(10) NOT NULL,
	"openDate" DATE NOT NULL DEFAULT NOW(),
	"closeDate" DATE
);

CREATE TABLE transactions (
	id serial PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES bankAccount(id),
	amount INTEGER NOT NULL,
	type VARCHAR(10) NOT NULL,
	time TIMESTAMP NOT NULL DEFAULT NOW(),
	description TEXT,
	cancelled BOOLEAN NOT NULL
);

CREATE TABLE creditCards (
	id serial PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES bankAccount(id),
	name VARCHAR(50) NOT NULL,
	number INTEGER NOT NULL UNIQUE,
	"securityCode" TEXT NOT NULL UNIQUE,
	"expirationMonth" DATE NOT NULL,
	"expirationYear" DATE NOT NULL,
	password TEXT NOT NULL,
	limite INTEGER NOT NULL
);