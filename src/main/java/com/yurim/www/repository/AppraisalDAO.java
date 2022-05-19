package com.yurim.www.repository;


import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.vo.RequestCommentForDetail;

import java.util.List;

public interface AppraisalDAO {
	List<AppraisalDTO> findAllComment(String isbn);	//해당 도서의 대한 모든 평가 호출
	int commentCount(String isbn);	//해당 도서의 대한 코멘트 개수 호출
}
