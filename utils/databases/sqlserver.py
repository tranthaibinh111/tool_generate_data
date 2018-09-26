import pymssql

from .database import DataBase
from utils import Log


class SQLServer(DataBase):
    __database_type = 'SQLServer'
    __server = 'DESKTOP-CVHEGS0'
    __database = 'advanced_sql'
    __user = 'sa'
    __password = 'Abc123456'

    def __init__(self):
        pass

    def get_database_type_name(self):
        return self.__database_type

    def execute_insert(self, sql, data=None):
        con = pymssql.connect(self.__server, self.__user, self.__password, self.__database)

        try:
            cursor = con.cursor()

            if data:
                if isinstance(data, tuple):
                    Log.write_log(sql, data)
                    cursor.execute(sql, data)
                    con.commit()
                else:
                    for items in [data[i:i+100] for i in range(0, len(data), 100)]:
                        Log.write_log(sql, items)
                        cursor.executemany(sql, items)
                        con.commit()
            else:
                Log.write_log(sql)
                cursor.execute(sql)
                con.commit()

        except Exception as e:
            print(e)
            raise
        finally:
            con.close()

    def execute_del(self, sql):
        con = pymssql.connect(self.__server, self.__user, self.__password, self.__database)

        try:
            cursor = con.cursor()
            Log.write_log(sql)
            cursor.execute(sql)

            con.commit()

        except Exception as e:
            print(e)
            raise
        finally:
            con.close()
