import os

from datetime import datetime

from utils import Log
from controllers import (
    AuthorController,
    PublisherController,
    BookController,
    AuthorBookController
)

if __name__ == "__main__":
    print('================================================================================')
    print('=    Chuong trinh tao data cho so sanh SQL Server 2016 va CockroachDB 2.0.5    =')
    print('=    Thanh vien nhom:                                                          =')
    print('=            Tran Thai Binh      CH1702025                                     =')
    print('=            Nguyen Quang Dat    CH1702026                                     =')
    print('================================================================================')
    # Write file log
    Log.path = os.getcwd()
    Log.folder = Log.path + '\log'
    Log.name = 'log%s.txt' % datetime.now().strftime("%Y%m%d%H%M%S")

    # Create class
    author = AuthorController()
    publisher = PublisherController()
    book = BookController()
    author_book = AuthorBookController()

    # Remove all data
    author_book.delete_all()
    book.delete_all()
    publisher.delete_all()
    author.delete_all()

    # Auto generate data
    time_start = datetime.now()
    author.auto_generate_data()
    time_end = datetime.now()
    print("Thoi gian hoan thanh tao data 2k line cho table author: %s" % str(time_end-time_start))

    #time_start = datetime.now()
    publisher.auto_generate_data()
    time_end = datetime.now()
    print("Thoi gian hoan thanh tao data 2k line cho table publisher: %s" % str(time_end - time_start))

    #time_start = datetime.now()
    book.auto_generate_data()
    time_end = datetime.now()
    print("Thoi gian hoan thanh tao data 2tr line cho table book: %s" % str(time_end - time_start))

    time_start = datetime.now()
    author_book.auto_generate_data()
    time_end = datetime.now()
    print("Thoi gian hoan thanh tao data 2tr line cho table author book: %s" % str(time_end - time_start))
