from controller import Controller
from servers import PublisherServer


class PublisherController(Controller):
    __server = PublisherServer()

    def __init__(self):
        pass

    def delete_all(self):
        result = self.__server.delete_all()

        if result:
            print("Delete All DataBase Publisher: OK!")
        else:
            print("Delete All DataBase Publisher: ERROR :(")

    def auto_generate_data(self):
        result = self.__server.auto_generate_data()

        if result:
            print("Create DataBase Publisher: OK!")
        else:
            print("Create DataBase Publisher: ERROR :(")
