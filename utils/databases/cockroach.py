import psycopg2

from numbers import Number

from .database import DataBase
from utils import Log


class Cockroach(DataBase):
    __database_type = 'Cockroach'
    __server = 'localhost'
    __port = '26257'
    __database = 'advanced_sql'
    __user = 'root'
    __password = ''

    def __init__(self):
        pass

    def get_database_type_name(self):
        return self.__database_type

    def execute_insert(self, sql, data=None):
        con = psycopg2.connect(database=self.__database, user=self.__user, host=self.__server, port=self.__port)

        try:
            cursor = con.cursor()

            if data:
                if isinstance(data, tuple):
                    data_inline = Cockroach.convert_sql_inline(data)
                    Log.write_log(sql, data_inline)
                    cursor.execute(sql % data_inline)
                    con.commit()
                else:
                    for items in [data[i:i + 100] for i in range(0, len(data), 100)]:
                        Log.write_log(sql, items)

                        for item in items:
                            item_inline = Cockroach.convert_sql_inline(item)
                            cursor.execute(sql % item_inline)
                        con.commit()
            else:
                Log.write_log(sql)
                cursor.execute(sql)
                con.commit()

        except Exception as e:
            print(e)
            raise
        finally:
            cursor.close()
            con.close()

    def execute_del(self, sql):
        con = psycopg2.connect(database=self.__database, user=self.__user, host=self.__server, port=self.__port)

        try:
            cursor = con.cursor()
            Log.write_log(sql)
            cursor.execute(sql)

            con.commit()

        except Exception as e:
            print(e)
            raise
        finally:
            cursor.close()
            con.close()

    @staticmethod
    def convert_sql_inline(value):
        result = []

        for item in value:
            if isinstance(item, Number):
                result.append(item)
            else:
                result.append("'%s'" % item)

        return tuple(result)


