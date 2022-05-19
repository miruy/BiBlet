package com.yurim.www.service;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.vo.RequestCommentForDetail;

import java.util.List;

public interface AppraisalService {
    int commentCount(String isbn); 		//해당 도서의 대한 평가 개수 호출
    List<AppraisalDTO> findAllComment(String isbn); 	//해당 도서의 대한 모든 평가 호출

}
