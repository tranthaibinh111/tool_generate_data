from abc import ABCMeta, abstractmethod

from utils import database


class Server:
    __metaclass__ = ABCMeta

    data = database

    def __init__(self):
        pass

    @abstractmethod
    def auto_generate_data(self):
        pass
