package com.yurim.www.service;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.vo.RequestCommentForDetail;

import java.util.HashMap;
import java.util.List;

public interface AppraisalService {
    List<AppraisalDTO> findAllComment(String isbn); //해당 도서의 대한 모든 평가 조회
    List<AppraisalDTO> findAllStar(String isbn);    //해당 도서의 대한 모든 평점 조회
    int commentCount(String isbn);  //해당 도서의 대한 평가 개수 조회
    void writeComment(AppraisalDTO appraisal);	//평가 작성
    Integer starAVG(String isbn);	//평균 평점 조회
    Long starCount(String isbn);	//평점 개수
    Integer userStar(Long userNo, String isbn); //해당 도서의 대한 회원의 평점
    void insertStar(Long statusNo, int star, Long userNo, String isbn);	//평점 등록
    void updateStar(AppraisalDTO appraisal);	//평점 수정
    void deleteStar(Long userNo, String isbn, int star);;	//평점 삭제
    List<AppraisalDTO> selectMyComment(BookShelfDTO bookShelf);	//해당 도서의 대한 회원의 평가
    void updateComment(AppraisalDTO appraisal);	//평가 수정
    String selectKakaoNameById(String id);	//ID로 카카오 로그인 회원 이름 조회
    void deleteComment(Long userNo, String isbn);	//평가 삭제
}
