import uuid

from models import Model


class BookModel(Model):
    def __init__(self):
        self.id = uuid.uuid4()
        self.name = None
        self.page_number = 0
        self.price = 0

    def to_tuple(self, publisher_id):
        return (
            self.id,
            self.name,
            self.page_number,
            self.price,
            publisher_id
        )
