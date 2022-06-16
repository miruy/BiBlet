package com.yurim.www.repository;

import com.yurim.www.dto.BookShelfDTO;

import java.util.HashMap;

public interface BookShelfDAO {
    Long selectStatusNoForStar(BookShelfDTO bookShelf);

    void insertStatus(BookShelfDTO bookShelf);

    void deleteStatus(BookShelfDTO bookShelf);

    Integer selectStatus(HashMap<String, String> map);

    void updateStatus(BookShelfDTO bookShelf);

    Integer selectStatusForComment(BookShelfDTO bookShelf);
    Long selectStatusNoForComment(BookShelfDTO bookShelf);
    Long selectStatusNoForWriteComment(BookShelfDTO bookShelf);

    Integer userStatus(HashMap<String, String> map);
}
