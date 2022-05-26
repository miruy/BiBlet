package com.yurim.www.repository;

import com.yurim.www.dto.BookShelfDTO;

public interface BookShelfDAO {
    void insertUserNoAndIsbn(BookShelfDTO bookShelf);
    BookShelfDTO selectStatusNoForStar(BookShelfDTO bookShelf);
    void insertStatus(BookShelfDTO bookShelf);
    void deleteStatus(BookShelfDTO bookShelf);
}
