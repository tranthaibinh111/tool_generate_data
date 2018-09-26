from controller import Controller
from servers import BookServer


class BookController(Controller):
    __server = BookServer()

    def __init__(self):
        pass

    def delete_all(self):
        result = self.__server.delete_all()

        if result:
            print("Delete All DataBase Book: OK!")
        else:
            print("Delete All DataBase Book: ERROR :(")

    def auto_generate_data(self):
        result = self.__server.auto_generate_data()

        if result:
            print("Create DataBase Book: OK!")
        else:
            print("Create DataBase Book: ERROR :(")
