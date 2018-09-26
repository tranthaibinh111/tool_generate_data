import uuid

from models import Model


class PublisherModel(Model):
    def __init__(self):
        self.id = uuid.uuid4()
        self.name = None
        self.phone = None
        self.address = None

    def to_tuple(self):
        return(
            self.id,
            self.name,
            self.phone,
            self.address
        )
