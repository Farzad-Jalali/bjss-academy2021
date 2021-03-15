

CREATE TABLE bjss."customer" (
  "customer_id" SERIAL PRIMARY KEY,
  "firstname" varchar,
  "surname" varchar(250),
  "address_id" int,
  "date_of_birth" date,
  "Email" varchar(250),
  "created_at" timestamp,
  "SSO_Enabled" boolean,
  "active" boolean
);

CREATE TABLE bjss."address" (
  "address_id" int PRIMARY KEY,
  "first_line" varchar,
  "second_line" varchar,
  "postcode" varchar,
  "country" varchar,
  "phone" int
);

CREATE TABLE bjss."staff" (
  "staff_id" SERIAL PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "address_id" int
);

CREATE TABLE bjss."movie" (
  "movie_id" SERIAL PRIMARY KEY,
  "movie_name" varchar,
  "category_id" int,
  "movie_imbd_id" int,
  "rating" varchar
);

CREATE TABLE bjss."prices" (
  "price_id" SERIAL PRIMARY KEY,
  "price" decimal,
  "rent_time" date,
  "overdue_modifier" float
);

CREATE TABLE bjss."stock" (
  "stock_id" SERIAL PRIMARY KEY,
  "movide_id" int,
  "quantity" int,
  "product_format" varchar(10),
  "still_rentable" bool,
  "price_id" int
);

CREATE TABLE bjss."category" (
  "category_id" SERIAL PRIMARY KEY,
  "category_name" varchar
);

CREATE TABLE bjss."transaction" (
  "transaction_id" SERIAL PRIMARY KEY,
  "movie_id" int,
  "customer_id" int,
  "staff_id" int,
  "payment" float,
  "stock_id" int,
  "date_out" date ,
  "date_due" date,
  "date_returned" date
);

ALTER TABLE bjss."customer" ADD FOREIGN KEY ("address_id") REFERENCES bjss."address" ("address_id");

ALTER TABLE bjss."staff" ADD FOREIGN KEY ("address_id") REFERENCES bjss."address" ("address_id");

ALTER TABLE bjss."movie" ADD FOREIGN KEY ("category_id") REFERENCES bjss."category" ("category_id");

ALTER TABLE bjss."stock" ADD FOREIGN KEY ("price_id") REFERENCES bjss."prices" ("price_id");

ALTER TABLE bjss."transaction" ADD FOREIGN KEY ("movie_id") REFERENCES bjss."movie" ("movie_id");

ALTER TABLE bjss."transaction" ADD FOREIGN KEY ("customer_id") REFERENCES "customer" ("customer_id");

ALTER TABLE bjss."transaction" ADD FOREIGN KEY ("staff_id") REFERENCES "staff" ("staff_id");

ALTER TABLE bjss."transaction" ADD FOREIGN KEY ("stock_id") REFERENCES "stock" ("stock_id");



