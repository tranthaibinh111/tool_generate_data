from servers import Server


class AuthorBookServer(Server):
    def __init__(self):
        pass

    def delete_all(self):
        self.data.execute_del('DELETE FROM book_stores_authorbook')

        return True

    def auto_generate_data(self):
        data_insert = []

        for i in range(0, 2000):
            for j in range(0, 10):
                author_name = 'Author' + str(i).zfill(4)

                book_from = (1000 * i) + (j * 100)
                book_to = (1000 * i) + (((j + 1) * 100) - 1)
                data = (author_name, book_from, book_to)

                data_insert.append(data)

        sql = """DECLARE @author_id AS UNIQUEIDENTIFIER;

                 SELECT
                          @author_id = AUT.id
                 FROM
                          book_stores_author AS AUT
                 WHERE
                          AUT.name = %s
                 ;

                 INSERT INTO book_stores_authorbook (
                          id
                 ,        author_id
                 ,        book_id
                 )
                 SELECT
                          NEWID()
                 ,        @author_id
                 ,        BOK.id
                 FROM
                          book_stores_book AS BOK
                 WHERE
                          CAST(SUBSTRING(BOK.name, 5, LEN(BOK.name)) AS DECIMAL)
                                  BETWEEN %d AND %d
               """

        sql_cockroach = """
                 INSERT INTO book_stores_authorbook (
                          id
                 ,        author_id
                 ,        book_id
                 )
                 SELECT
                          gen_random_uuid()
                 ,        (SELECT AUT.id FROM book_stores_author AS AUT WHERE AUT.name = %s)
                 ,        BOK.id
                 FROM
                          book_stores_book AS BOK
                 WHERE
                          CAST(SUBSTRING(BOK.name, 5, LENGTH(BOK.name)) AS DECIMAL)
                                  BETWEEN %d AND %d
        """

        for data in data_insert:
            if self.data.get_database_type_name() == "SQLServer":
                # SQLServer
                self.data.execute_insert(sql=sql, data=data)
            else:
                # Cockroach
                self.data.execute_insert(sql=sql_cockroach, data=data)

        return True
