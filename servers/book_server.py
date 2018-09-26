import random

from datetime import datetime

from models import BookModel
from servers import Server


class BookServer(Server):
    def __init__(self):
        pass

    def delete_all(self):
        self.data.execute_del('DELETE FROM book_stores_book')

        return True

    def auto_generate_data(self):
        data_insert = []

        for i in range(0, 2000):
            for j in range(0, 1000):
                data = BookModel()

                data.name = 'Book' + str((i*1000) + j).zfill(7)
                data.page_number = random.randrange(100, 1000)
                data.price = random.randrange(50000, 900000)

                data_insert.append(data.to_tuple('Publisher' + str(i).zfill(4)))

        sql = """INSERT INTO book_stores_book (
                          id
                 ,        name
                 ,        page_number
                 ,        price
                 ,        publisher_id
                 )
                 SELECT
                          %s
                 ,        %s
                 ,        %d
                 ,        %d
                 ,        PBS.id
                 FROM
                          book_stores_publisher AS PBS
                 WHERE
                          PBS.name = %s
               """

        self.data.execute_insert(sql=sql, data=data_insert)

        return True
