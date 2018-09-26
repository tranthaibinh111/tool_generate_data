from abc import ABCMeta, abstractmethod


class Model:
    __metaclass__ = ABCMeta

    def __init__(self):
        pass

    @abstractmethod
    def to_tuple(self):
        pass
