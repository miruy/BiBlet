package com.yurim.www.service;

import com.yurim.www.dto.BookShelfDTO;

import java.util.List;

public interface BookShelfService {
    Long selectStatusNoForStar(BookShelfDTO bookShelf); //평점 확인을 위한 독서상태 조회
    void insertStatus(BookShelfDTO bookShelf);  //독서상태 등록
    void deleteStatus(BookShelfDTO bookShelf);   //독서상태 삭제
    Integer selectStatus(String isbn, Long userNo); //독서상태 조회
    void updateStatus(BookShelfDTO bookShelf);  //독서상태 수정
    Integer selectStatusForComment(BookShelfDTO bookShelf); //평가 확인을 위한 독서상태 조회
    void selectStatusNoForComment(BookShelfDTO bookShelf);  //평가 확인을 위한 독서상태 번호 조회
    Long selectStatusNoForWriteComment(BookShelfDTO bookShelf); //평가 작성을 위한 독서상태 번호 조회
    Integer userStatus(Long userNo, String isbn);    //해당 도서의 대한 회원의 독서상태
    List<String> selectMyCommentIsbn(Long userNo);  //해당 도서의 대한 회원의 평가 조회
}
