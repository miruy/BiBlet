package com.yurim.www.service;

import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.repository.BookShelfDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
@RequiredArgsConstructor
public class BookShelfServiceImpl implements BookShelfService {

    private final BookShelfDAO bookShelfDAO;

    @Override
    public Long selectStatusNoForStar(BookShelfDTO bookShelf){
        return bookShelfDAO.selectStatusNoForStar(bookShelf);
    }

    @Override
    public void insertStatus(BookShelfDTO bookShelf){
        bookShelfDAO.insertStatus(bookShelf);
    }

    @Override
    public void deleteStatus(BookShelfDTO bookShelf){
        bookShelfDAO.deleteStatus(bookShelf);
    }

    @Override
    public Integer selectStatus(String isbn, Long userNo){
        HashMap<String, String> map = new HashMap<>();
        String userNoS = String.valueOf(userNo);

        map.put("userNo", userNoS);
        map.put("isbn", isbn);

        return bookShelfDAO.selectStatus(map);
    }

    @Override
    public void updateStatus(BookShelfDTO bookShelf){
        bookShelfDAO.updateStatus(bookShelf);
    }

    @Override
    public Long selectStatusNoForComment(BookShelfDTO bookShelf){
        return bookShelfDAO.selectStatusNoForComment(bookShelf);
    }

    @Override
    public Integer userStatus(Long userNo, String isbn){
        HashMap<String, String> map = new HashMap<>();
        String userNoS = String.valueOf(userNo);

        map.put("userNo", userNoS);
        map.put("isbn", isbn);

        return bookShelfDAO.userStatus(map);
    }
}
