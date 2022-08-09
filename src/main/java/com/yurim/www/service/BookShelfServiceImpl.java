package com.yurim.www.service;

import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.repository.BookShelfDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
@RequiredArgsConstructor
public class BookShelfServiceImpl implements BookShelfService {
    private final BookShelfDAO bookShelfDAO;

    //평점 확인을 위한 독서상태 조회
    @Override
    public Long selectStatusNoForStar(BookShelfDTO bookShelf){
        return bookShelfDAO.selectStatusNoForStar(bookShelf);
    }

    //독서상태 등록
    @Override
    public void insertStatus(BookShelfDTO bookShelf){
        bookShelfDAO.insertStatus(bookShelf);
    }

    //독서상태 삭제
    @Override
    public void deleteStatus(BookShelfDTO bookShelf){
        bookShelfDAO.deleteStatus(bookShelf);
    }

    //독서상태 조회
    @Override
    public Integer selectStatus(String isbn, Long userNo){
        HashMap<String, String> map = new HashMap<>();
        String userNoS = String.valueOf(userNo);

        map.put("userNo", userNoS);
        map.put("isbn", isbn);

        return bookShelfDAO.selectStatus(map);
    }

    //독서상태 수정
    @Override
    public void updateStatus(BookShelfDTO bookShelf){
        bookShelfDAO.updateStatus(bookShelf);
    }

    //평가 확인을 위한 독서상태 조
    @Override
    public Integer selectStatusForComment(BookShelfDTO bookShelf){
        return bookShelfDAO.selectStatusForComment(bookShelf);
    }

    //평가 확인을 위한 독서상태 번호 조회
    @Override
    public void selectStatusNoForComment(BookShelfDTO bookShelf){
        Long statusNo = bookShelfDAO.selectStatusNoForComment(bookShelf);
        bookShelf.setStatusNo(statusNo);
    }

    //평가 작성을 위한 독서상태 번호 조회
    @Override
    public Long selectStatusNoForWriteComment(BookShelfDTO bookShelf){
        return bookShelfDAO.selectStatusNoForWriteComment(bookShelf);
    }

    //해당 도서의 대한 회원의 독서상태
    @Override
    public Integer userStatus(Long userNo, String isbn){
        HashMap<String, String> map = new HashMap<>();
        String userNoS = String.valueOf(userNo);

        map.put("userNo", userNoS);
        map.put("isbn", isbn);

        return bookShelfDAO.userStatus(map);
    }

    //해당 도서의 대한 회원의 평가 조회
    @Override
    public List<String> selectMyCommentIsbn(Long userNo){
        return bookShelfDAO.selectMyCommentIsbn(userNo);
    }
}
