package com.yurim.www.service;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.vo.RequestCommentForDetail;

import java.util.List;

public interface AppraisalService {
    int commentCount(String isbn); 		//해당 도서의 대한 평가 개수 검색
    List<AppraisalDTO> findAllComment(String isbn); 	//해당 도서의 대한 모든 평가 검색
    void writeComment(AppraisalDTO appraisal);	//평가 작성
    void insertDefaultStar(Long statusNo);
    void updateStar(AppraisalDTO appraisal);
    Integer starAVG(String isbn);
    Long starCount(String isbn);
    Integer userStar(Long userNo, String isbn);


}
