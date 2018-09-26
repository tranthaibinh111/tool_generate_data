/*
 * Cac cau lenh thuc thi test toc do
 *
 */
SET STATISTICS IO, TIME ON;
GO

-- SELECT voi table khong co dieu kien where
SELECT
    *
FROM
    book_stores_author;
GO

SELECT
    *
FROM
    book_stores_book;
GO

SELECT
    *
FROM
    book_stores_authorbook;
GO


-- SELECT voi table co dieu kien where
SELECT
    *
FROM
    book_stores_author
WHERE
    name BETWEEN 'Author0000' AND 'Author0099';
GO

SELECT
    *
FROM
    book_stores_book
WHERE
    name BETWEEN 'Book0000000' AND 'Book0000099';
GO


-- SELECT table left join voi dieu kien where
SELECT
    *
FROM
    book_stores_book BOK
LEFT JOIN book_stores_publisher PSH
    ON BOK.publisher_id = PSH.id
WHERE
    BOK.name BETWEEN 'Book0000000' AND 'Book0000099';
GO

SELECT
    *
FROM
    book_stores_authorbook ATB
LEFT JOIN book_stores_book BOK
    ON ATB.book_id = BOK.id
LEFT JOIN book_stores_author AUT
    ON ATB.author_id = AUT.id
WHERE
    BOK.name BETWEEN 'Book0000000' AND 'Book0000099';
GO


-- SELECT table inner join voi dieu kien where
SELECT
    *
FROM
    book_stores_book BOK
INNER JOIN book_stores_publisher PSH
    ON BOK.publisher_id = PSH.id
WHERE
    BOK.name BETWEEN 'Book0000000' AND 'Book0000099';
GO

SELECT
    *
FROM
    book_stores_authorbook ATB
INNER JOIN book_stores_book BOK
    ON ATB.book_id = BOK.id
INNER JOIN book_stores_author AUT
    ON ATB.author_id = AUT.id
WHERE
    BOK.name BETWEEN 'Book0000000' AND 'Book0000099';
GO


-- INSERT table  100Line
INSERT INTO book_stores_author (
    id
,   name
,   date_of_birth
,   email
,   phone
)
SELECT
    NEWID()
,   'Author' + CAST(2000 + CAST(SUBSTRING(AUT.name, 7, LEN(AUT.name)) AS DECIMAL) AS NVARCHAR(4))
,   date_of_birth
,   CAST(2000 + CAST(SUBSTRING(AUT.name, 7, LEN(AUT.name)) AS DECIMAL) AS NVARCHAR(4)) + email
,   phone
FROM
    book_stores_author AUT
WHERE
    AUT.name BETWEEN 'Author0000' AND 'Author0099'
ORDER BY
    CAST(SUBSTRING(AUT.name, 7, LEN(AUT.name)) AS DECIMAL);
GO

INSERT INTO book_stores_publisher (
    id
,   name
,   phone
,   address
)
SELECT
    NEWID()
,   CONCAT('Publisher', CAST(2000 + CAST(SUBSTRING(PBS.name, 10, LEN(PBS.name)) AS DECIMAL) AS NVARCHAR(4)))
,   phone
,   address
FROM
    book_stores_publisher PBS
WHERE
    PBS.name BETWEEN 'Publisher0000' AND 'Publisher0099'
ORDER BY
    CAST(SUBSTRING(PBS.name, 10, LEN(PBS.name)) AS DECIMAL);
GO

INSERT INTO book_stores_book (
    id
,   name
,   page_number
,   price
,   publisher_id
)
SELECT
    NEWID()
,   'Book' + CAST(SUBSTRING(PBS.name, 10, LEN(PBS.name)) AS NVARCHAR(4))
,   100
,   500000
,   PBS.id
FROM
    book_stores_publisher PBS
WHERE
    PBS.name BETWEEN 'Publisher2000' AND 'Publisher2099'
ORDER BY
    CAST(SUBSTRING(PBS.name, 10, LEN(PBS.name)) AS DECIMAL);
GO

INSERT INTO book_stores_authorbook (
    id
,   author_id
,   book_id
)
SELECT
    NEWID()
,   AUT.id
,   (SELECT id FROM book_stores_book WHERE name = 'Book0001999')
FROM
    book_stores_author AUT
WHERE
    AUT.name BETWEEN 'Author2000' AND 'Author2099'
ORDER BY
    CAST(SUBSTRING(AUT.name, 7, LEN(AUT.name)) AS DECIMAL);
GO


-- INSERT table  1000Line
INSERT INTO book_stores_author (
    id
,   name
,   date_of_birth
,   email
,   phone
)
SELECT
    NEWID()
,   'Author' + CAST(2100 + CAST(SUBSTRING(AUT.name, 7, LEN(AUT.name)) AS DECIMAL) AS NVARCHAR(4))
,   date_of_birth
,   CAST(2100 + CAST(SUBSTRING(AUT.name, 7, LEN(AUT.name)) AS DECIMAL) AS NVARCHAR(4)) + email
,   phone
FROM
    book_stores_author AUT
WHERE
    AUT.name BETWEEN 'Author0000' AND 'Author0999'
ORDER BY
    CAST(SUBSTRING(AUT.name, 7, LEN(AUT.name)) AS DECIMAL);
GO

INSERT INTO book_stores_publisher (
    id
,   name
,   phone
,   address
)
SELECT
    NEWID()
,   CONCAT('Publisher', CAST(2100 + CAST(SUBSTRING(PBS.name, 10, LEN(PBS.name)) AS DECIMAL) AS NVARCHAR(4)))
,   phone
,   address
FROM
    book_stores_publisher PBS
WHERE
    PBS.name BETWEEN 'Publisher0000' AND 'Publisher0999'
ORDER BY
    CAST(SUBSTRING(PBS.name, 10, LEN(PBS.name)) AS DECIMAL);
GO

INSERT INTO book_stores_book (
    id
,   name
,   page_number
,   price
,   publisher_id
)
SELECT
    NEWID()
,   'Book' + CAST(SUBSTRING(PBS.name, 10, LEN(PBS.name)) AS NVARCHAR(4))
,   100
,   500000
,   PBS.id
FROM
    book_stores_publisher PBS
WHERE
    PBS.name BETWEEN 'Publisher2100' AND 'Publisher3099'
ORDER BY
    CAST(SUBSTRING(PBS.name, 10, LEN(PBS.name)) AS DECIMAL);
GO

INSERT INTO book_stores_authorbook (
    id
,   author_id
,   book_id
)
SELECT
    NEWID()
,   AUT.id
,   (SELECT id FROM book_stores_book WHERE name = 'Book0001999')
FROM
    book_stores_author AUT
WHERE
    AUT.name BETWEEN 'Author2100' AND 'Author3099'
ORDER BY
    CAST(SUBSTRING(AUT.name, 7, LEN(AUT.name)) AS DECIMAL);
GO


-- INSERT table  3000Line
INSERT INTO book_stores_author (
    id
,   name
,   date_of_birth
,   email
,   phone
)
SELECT
    NEWID()
,   'Author' + CAST(3100 + CAST(SUBSTRING(AUT.name, 7, LEN(AUT.name)) AS DECIMAL) AS NVARCHAR(4))
,   date_of_birth
,   CAST(3100 + CAST(SUBSTRING(AUT.name, 7, LEN(AUT.name)) AS DECIMAL) AS NVARCHAR(4)) + email
,   phone
FROM
    book_stores_author AUT
WHERE
    AUT.name BETWEEN 'Author0000' AND 'Author2999'
ORDER BY
    CAST(SUBSTRING(AUT.name, 7, LEN(AUT.name)) AS DECIMAL);
GO

INSERT INTO book_stores_publisher (
    id
,   name
,   phone
,   address
)
SELECT
    NEWID()
,   CONCAT('Publisher', CAST(3100 + CAST(SUBSTRING(PBS.name, 10, LEN(PBS.name)) AS DECIMAL) AS NVARCHAR(4)))
,   phone
,   address
FROM
    book_stores_publisher PBS
WHERE
    PBS.name BETWEEN 'Publisher0000' AND 'Publisher2999'
ORDER BY
    CAST(SUBSTRING(PBS.name, 10, LEN(PBS.name)) AS DECIMAL);
GO

INSERT INTO book_stores_book (
    id
,   name
,   page_number
,   price
,   publisher_id
)
SELECT
    NEWID()
,   'Book' + CAST(SUBSTRING(PBS.name, 10, LEN(PBS.name)) AS NVARCHAR(4))
,   100
,   500000
,   PBS.id
FROM
    book_stores_publisher PBS
WHERE
    PBS.name BETWEEN 'Publisher3100' AND 'Publisher6099'
ORDER BY
    CAST(SUBSTRING(PBS.name, 10, LEN(PBS.name)) AS DECIMAL);
GO

INSERT INTO book_stores_authorbook (
    id
,   author_id
,   book_id
)
SELECT
    NEWID()
,   AUT.id
,   (SELECT id FROM book_stores_book WHERE name = 'Book0001999')
FROM
    book_stores_author AUT
WHERE
    AUT.name BETWEEN 'Author3100' AND 'Author6099'
ORDER BY
    CAST(SUBSTRING(AUT.name, 7, LEN(AUT.name)) AS DECIMAL);
GO


-- UPDATE table 100Line
UPDATE book_stores_author
SET phone = '0988284955'
WHERE
    name BETWEEN 'Author6000' AND 'Author6099';
GO

UPDATE book_stores_book
SET page_number = 12345
WHERE
    name BETWEEN 'Book6000' AND 'Book6099';
GO

UPDATE book_stores_authorbook
SET book_id = (SELECT id FROM book_stores_book WHERE name = 'Book0000001')
FROM book_stores_authorbook ATB
INNER JOIN book_stores_author AUT
    ON ATB.author_id = AUT.id
WHERE
    name BETWEEN 'Author6000' AND 'Author6099';
GO

-- UPDATE table 1000Line
UPDATE book_stores_author
SET phone = '0988284955'
WHERE
    name BETWEEN 'Author5000' AND 'Author5999';
GO

UPDATE book_stores_book
SET page_number = 12345
WHERE
    name BETWEEN 'Book5000' AND 'Book5999';
GO

UPDATE book_stores_authorbook
SET book_id = (SELECT id FROM book_stores_book WHERE name = 'Book0000001')
FROM book_stores_authorbook ATB
INNER JOIN book_stores_author AUT
    ON ATB.author_id = AUT.id
WHERE
    name BETWEEN 'Author5000' AND 'Author5999';
GO


-- UPDATE table 3000Line
UPDATE book_stores_author
SET phone = '0988284955'
WHERE
    name BETWEEN 'Author2000' AND 'Author4999';
GO

UPDATE book_stores_author
SET phone = '0988284955'
WHERE
    name BETWEEN 'Author2000' AND 'Author4999';
GO

UPDATE book_stores_authorbook
SET book_id = (SELECT id FROM book_stores_book WHERE name = 'Book0000001')
FROM book_stores_authorbook ATB
INNER JOIN book_stores_author AUT
    ON ATB.author_id = AUT.id
WHERE
    name BETWEEN 'Author2000' AND 'Author4999';
GO


-- DELETE table 100Line
DELETE FROM book_stores_authorbook
WHERE
    EXISTS(
        SELECT
            'NULL' DUMMY
        FROM
            book_stores_author AUT
        WHERE
            author_id = AUT.id
        AND AUT.name BETWEEN 'Author6000' AND 'Author6099'
    );
GO

DELETE FROM book_stores_book
WHERE
    name BETWEEN 'Book6000' AND 'Book6099';
GO

DELETE FROM book_stores_author
WHERE
    name BETWEEN 'Author6000' AND 'Author6099';
GO

-- DELETE table 1000Line
DELETE FROM book_stores_authorbook
WHERE
    EXISTS(
        SELECT
            'NULL' DUMMY
        FROM
            book_stores_author AUT
        WHERE
            author_id = AUT.id
        AND AUT.name BETWEEN 'Author5000' AND 'Author5999'
    );
GO

DELETE FROM book_stores_book
WHERE
    name BETWEEN 'Book5000' AND 'Book5999';
GO

DELETE FROM book_stores_author
WHERE
    name BETWEEN 'Author5000' AND 'Author5999';
GO

-- DELETE table 3000Line
DELETE FROM book_stores_authorbook
WHERE
    EXISTS(
        SELECT
            'NULL' DUMMY
        FROM
            book_stores_author AUT
        WHERE
            author_id = AUT.id
        AND AUT.name BETWEEN 'Author2000' AND 'Author4999'
    );
GO

DELETE FROM book_stores_book
WHERE
    name BETWEEN 'Book2000' AND 'Book4999';
GO

DELETE FROM book_stores_author
WHERE
    name BETWEEN 'Author2000' AND 'Author4999';
GO