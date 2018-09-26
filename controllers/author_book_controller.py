from controller import Controller
from servers import AuthorBookServer


class AuthorBookController(Controller):
    __server = AuthorBookServer()

    def __init__(self):
        pass

    def delete_all(self):
        result = self.__server.delete_all()

        if result:
            print("Delete All DataBase Author Book: OK!")
        else:
            print("Delete All DataBase Author Book: ERROR :(")

    def auto_generate_data(self):
        result = self.__server.auto_generate_data()

        if result:
            print("Create DataBase AuthorBook: OK!")
        else:
            print("Create DataBase AuthorBook: ERROR :(")
