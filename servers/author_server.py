import random

from datetime import datetime

from models import AuthorModel
from servers import Server


class AuthorServer(Server):
    def __init__(self):
        pass

    def delete_all(self):
        self.data.execute_del('DELETE FROM book_stores_author')

        return True

    def auto_generate_data(self):
        data_insert = []

        for i in range(0, 2000):
            data = AuthorModel()

            data.name = 'Author' + str(i).zfill(4)
            data.date_of_birth = datetime(year=random.randrange(1900, 2000),
                                          month=random.randrange(1, 12),
                                          day=random.randrange(1, 28))
            data.email = data.name + '@gmail.com'
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

            data_insert.append(data.to_tuple())

        sql = """INSERT INTO book_stores_author (
                          id
                 ,        name
                 ,        date_of_birth
                 ,        email
                 ,        phone
                 ) VALUES (
                          %s
                 ,        %s
                 ,        %s
                 ,        %s
                 ,        %s
                 )
               """

        self.data.execute_insert(sql=sql, data=data_insert)

        return True
