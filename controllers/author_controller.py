from controller import Controller
from servers import AuthorServer


class AuthorController(Controller):
    __server = AuthorServer()

    def __init__(self):
        pass

    def delete_all(self):
        result = self.__server.delete_all()

        if result:
            print("Delete All DataBase Author: OK!")
        else:
            print("Delete All DataBase Author: ERROR :(")

    def auto_generate_data(self):
        result = self.__server.auto_generate_data()

        if result:
            print("Create DataBase Author: OK!")
        else:
            print("Create DataBase Author: ERROR :(")
