-- SQL Server 2016
CREATE TABLE book_stores_author
(
  id uniqueidentifier NOT NULL,
  name character varying(50) NOT NULL,
  date_of_birth date,
  email character varying(254) NOT NULL,
  phone character varying(128),
  PRIMARY KEY (id),
  UNIQUE (email)
);


-- CockroachDB 2.0.5 standard
CREATE TABLE IF NOT EXISTS book_stores_author
(
  id uuid NOT NULL,
  name character varying(50) NOT NULL,
  date_of_birth date,
  email character varying(254) NOT NULL,
  phone character varying(128),
  PRIMARY KEY (id),
  UNIQUE (email)
);
