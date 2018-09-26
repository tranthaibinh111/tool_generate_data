import random

from datetime import datetime

from models import PublisherModel
from servers import Server


class PublisherServer(Server):
    def __init__(self):
        pass

    def delete_all(self):
        self.data.execute_del('DELETE FROM book_stores_publisher')

        return True

    def auto_generate_data(self):
        data_insert = []

        for i in range(0, 2000):
            data = PublisherModel()

            data.name = 'Publisher' + str(i).zfill(4)
            data.phone = '0' \
                         + str(random.randrange(8, 9)) \
                         + str(random.choice([0, 1, 2, 3, 4, 6, 7, 8, 9])) \
                         + str(random.randrange(0, 9)) \
                         + str(random.randrange(0, 9)) \
                         + str(random.randrange(0, 9)) \
                         + str(random.randrange(0, 9)) \
                         + str(random.randrange(0, 9)) \
                         + str(random.randrange(0, 9)) \
                         + str(random.randrange(0, 9))
            data.address = 'Publisher address ' + str(i).zfill(4)

            data_insert.append(data.to_tuple())

        sql = """INSERT INTO book_stores_publisher (
                          id
                 ,        name
                 ,        phone
                 ,        address
                 ) VALUES (
                          %s
                 ,        %s
                 ,        %s
                 ,        %s
                 )
               """

        self.data.execute_insert(sql=sql, data=data_insert)

        return True
