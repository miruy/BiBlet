package com.yurim.www.service;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.BookShelfDTO;
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

	// 독서 상태 삽입
	@Override
	public BookShelfDTO insertStatus(BookShelfDTO bookShelf) {
		return appraisalDAO.insertStatus(bookShelf);
	}

	// 독서 상태 호출
	@Override
	public BookShelfDTO selectStatus(BookShelfDTO bookShelf) {
		return appraisalDAO.selectStatus(bookShelf);
	}

	// 평가 작성
	@Override
	public void writeComment(AppraisalDTO appraisal) {
		appraisalDAO.writeComment(appraisal);
	}

	@Override
	public void insertStar(AppraisalDTO appraisal){
		appraisalDAO.insertStar(appraisal);
	}

	@Override
	public int starAVG(String isbn){
		return appraisalDAO.starAVG(isbn);
	}

	@Override
	public Long starCount(String isbn){
		return appraisalDAO.starCount(isbn);
	}
}
