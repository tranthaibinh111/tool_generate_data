-- SQL Server 2016
CREATE TABLE book_stores_authorbook
(
  id uniqueidentifier NOT NULL,
  author_id uniqueidentifier NOT NULL,
  book_id uniqueidentifier NOT NULL,
  PRIMARY KEY(id ASC),
  CONSTRAINT book_stores_authorbook_author_id_book_stores_author_id
    FOREIGN KEY(author_id) REFERENCES book_stores_author(id),
  CONSTRAINT book_stores_authorbook_book_id_book_stores_book_id
    FOREIGN KEY(book_id) REFERENCES book_stores_book(id)
);

-- CockroachDB 2.0.5 standard
CREATE TABLE IF NOT EXISTS book_stores_authorbook
(
  id uuid NOT NULL,
  author_id uuid NOT NULL,
  book_id uuid NOT NULL,
  PRIMARY KEY(id ASC),
  CONSTRAINT book_stores_authorbook_author_id_book_stores_author_id
    FOREIGN KEY(author_id) REFERENCES book_stores_author(id),
  CONSTRAINT book_stores_authorbook_book_id_book_stores_book_id
    FOREIGN KEY(book_id) REFERENCES book_stores_book(id)
);