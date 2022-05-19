package com.yurim.www.service;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.repository.AppraisalDAO;
import com.yurim.www.vo.RequestCommentForDetail;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AppraisalServiceImpl implements AppraisalService {

	private final AppraisalDAO appraisalDAO;

	// 해당 도서의 대한 모든 평가 호출
	@Override
	public List<AppraisalDTO> findAllComment(String isbn) {
		return appraisalDAO.findAllComment(isbn);
	}

	// 해당 도서의 대한 평가 개수 호출
	@Override
	public int commentCount(String isbn) {
		return appraisalDAO.commentCount(isbn);
	}

	
}
