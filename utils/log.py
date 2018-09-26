import os

from datetime import datetime


class Log:
    path = None
    folder = None
    name = None

    def __init__(self):
        pass

    @staticmethod
    def write_log(sql, data=None):
        if not Log.path:
            raise Exception("The path is empty")

        if not Log.folder:
            raise Exception("The folder is empty")

        if not Log.name:
            raise Exception("The name is empty")

        if not os.path.exists(Log.folder):
            os.makedirs(Log.folder)

        with open(Log.folder + '\\' + Log.name, 'a+') as f:
            message = 'Time: %s\r\n' % datetime.now().isoformat(' ')
            f.write(message)

            if data:
                if isinstance(data, tuple):
                    message = sql % data + '\r\n'
                else:
                    for item in data:
                        message = sql % item + '\r\n'
            else:
                message = sql

            f.write(message)
