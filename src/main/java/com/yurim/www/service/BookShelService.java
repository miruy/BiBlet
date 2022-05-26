package com.yurim.www.service;

import com.yurim.www.dto.BookShelfDTO;

public interface BookShelService {
    void insertUserNoAndIsbn(BookShelfDTO bookShelf);
    BookShelfDTO selectStatusNoForStar(BookShelfDTO bookShelf);
    void insertWant(BookShelfDTO bookShelf);
}
