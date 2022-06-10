package com.yurim.www.service;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.vo.RequestCommentForDetail;

import java.util.HashMap;
import java.util.List;

public interface AppraisalService {
    int commentCount(String isbn); 		//해당 도서의 대한 평가 개수 검색
    List<AppraisalDTO> findAllComment(String isbn); 	//해당 도서의 대한 모든 평가 검색
    void writeComment(AppraisalDTO appraisal);	//평가 작성
    Integer starAVG(String isbn);
    Long starCount(String isbn);
    Integer userStar(Long userNo, String isbn);

    void insertStar(Long statusNo, int star);
    void updateStar(AppraisalDTO appraisal);
    int deleteStar(Long userNo, String isbn, int star);
    List<AppraisalDTO> selectMyComment(BookShelfDTO bookShelf);
    void updateComment(AppraisalDTO appraisal);
    List<AppraisalDTO> findAllStar(String isbn);
    String selectKakaoNameById(String id);
    void deleteComment(Long userNo, String isbn);
}
