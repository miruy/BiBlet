package com.yurim.www.repository;


import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.vo.RequestCommentForDetail;

import java.util.List;

public interface AppraisalDAO {
	List<AppraisalDTO> findAllComment(String isbn);	//해당 도서의 대한 모든 평가 검색
	int commentCount(String isbn);	//해당 도서의 대한 코멘트 개수 검색
	BookShelfDTO insertStatus(BookShelfDTO bookShelf);	//독서 상태 삽입
	BookShelfDTO selectStatus(BookShelfDTO bookShelf);	//독서 상태 검색
	void writeComment(AppraisalDTO appraisal);	//평가 작성
	void insertStar(AppraisalDTO appraisal);
	Integer starAVG(String isbn);
	Long starCount(String isbn);
}
