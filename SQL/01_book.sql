-- SQL Server 2016
CREATE TABLE book_stores_book
(
  id uniqueidentifier NOT NULL,
  name character varying(255) NOT NULL,
  page_number integer NOT NULL,
  price decimal(12,0) NOT NULL,
  publisher_id uniqueidentifier NOT NULL,
  PRIMARY KEY (id ASC),
  CONSTRAINT book_stores_book_publisher_id_book_stores_publisher_id
    FOREIGN KEY(publisher_id) REFERENCES book_stores_publisher(id)
);


-- CockroachDB 2.0.5 standard
CREATE TABLE IF NOT EXISTS book_stores_book
(
  id uuid NOT NULL,
  name character varying(255) NOT NULL,
  page_number integer NOT NULL,
  price numeric(12,0) NOT NULL,
  publisher_id uuid NOT NULL,
  PRIMARY KEY (id ASC),
  CONSTRAINT book_stores_book_publisher_id_book_stores_publisher_id
    FOREIGN KEY(publisher_id) REFERENCES book_stores_publisher(id)
);

