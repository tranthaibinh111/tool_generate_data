import uuid

from models import Model


class AuthorModel(Model):
    def __init__(self):
        self.id = uuid.uuid4()
        self.name = None
        self.date_of_birth = None
        self.email = None
        self.phone = None

    def to_tuple(self):
        return (
            self.id,
            self.name,
            self.date_of_birth,
            self.email,
            self.phone
        )
