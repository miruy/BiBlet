package com.yurim.www.repository;

import com.yurim.www.dto.BookShelfDTO;

import java.util.HashMap;

public interface BookShelfDAO {
    void insertBookShelfForStar(BookShelfDTO bookShelf);
    Long selectStatusNoForStar(BookShelfDTO bookShelf);
    void insertStatus(BookShelfDTO bookShelf);
    void deleteStatus(BookShelfDTO bookShelf);
    Integer selectStatus(HashMap<String, String> map);
    void updateStatus(BookShelfDTO bookShelf);
}
