package com.yurim.www.repository;


import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.vo.RequestCommentForDetail;

import java.util.HashMap;
import java.util.List;

public interface AppraisalDAO {
	List<AppraisalDTO> findAllComment(String isbn);	//해당 도서의 대한 모든 평가 검색
	int commentCount(String isbn);	//해당 도서의 대한 코멘트 개수 검색
	void writeComment(AppraisalDTO appraisal);	//평가 작성
	Integer starAVG(String isbn);
	Long starCount(String isbn);
	Integer userStar(HashMap<String, String> map);
	void insertStar(HashMap<String, Long> map);
	void updateStar(AppraisalDTO appraisal);
	int deleteStar(HashMap<String, String> map);
}
