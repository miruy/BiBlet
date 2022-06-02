package com.yurim.www.service;

import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.repository.BookShelfDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BookShelfServiceImpl implements BookShelService{

    private final BookShelfDAO bookShelfDAO;

    @Override
    public void insertUserNoAndIsbn(BookShelfDTO bookShelf){
       bookShelfDAO.insertUserNoAndIsbn(bookShelf);
    }

    @Override
    public Long selectStatusNo(BookShelfDTO bookShelf){
        return bookShelfDAO.selectStatusNo(bookShelf);
    }

    @Override
    public void insertStatus(BookShelfDTO bookShelf){
        bookShelfDAO.insertStatus(bookShelf);
    }

    @Override
    public void deleteStatus(BookShelfDTO bookShelf){
        bookShelfDAO.deleteStatus(bookShelf);
    }
}
