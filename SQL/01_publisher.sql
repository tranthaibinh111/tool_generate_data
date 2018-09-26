-- SQL Server 2016
CREATE TABLE book_stores_publisher
(
  id uniqueidentifier NOT NULL,
  name character varying(100) NOT NULL,
  phone character varying(128),
  address character varying(255) NOT NULL,
  PRIMARY KEY (id ASC)
);

-- CockroachDB 2.0.5 standard
CREATE TABLE IF NOT EXISTS book_stores_publisher
(
  id uuid NOT NULL,
  name character varying(100) NOT NULL,
  phone character varying(128),
  address character varying(255) NOT NULL,
  PRIMARY KEY (id ASC)
);
