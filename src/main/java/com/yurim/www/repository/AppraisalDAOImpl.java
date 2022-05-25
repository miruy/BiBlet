package com.yurim.www.repository;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.vo.RequestCommentForDetail;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class AppraisalDAOImpl implements AppraisalDAO {

	private final SqlSessionTemplate sqlSessionTemplate;

	// 해당 도서의 대한 모든 평가 호출
	@Override
	public List<AppraisalDTO> findAllComment(String isbn) {
		return sqlSessionTemplate.selectList("findAllComment", isbn);
	}

	// 해당 도서의 대한 평가 개수 호출
	@Override
	public int commentCount(String isbn) {
		return sqlSessionTemplate.selectOne("commentCount", isbn);
	}

	// 독서 상태 삽입 및 해당 독서 상태 바로 호출
	@Override
	public BookShelfDTO insertStatus(BookShelfDTO bookShelf) {
		sqlSessionTemplate.insert("insertStatus", bookShelf);
		return selectStatus(bookShelf);
	}

	// 독서 상태 호출
	@Override
	public BookShelfDTO selectStatus(BookShelfDTO bookShelf) {
		return sqlSessionTemplate.selectOne("selectStatus", bookShelf);
	}

	// 평가 작성
	@Override
	public void writeComment(AppraisalDTO appraisal) {
		sqlSessionTemplate.insert("writeComment", appraisal);
	}

	@Override
	public void insertStar(AppraisalDTO appraisal){
		sqlSessionTemplate.insert("insertStar", appraisal);
	}

	@Override
	public Integer starAVG(String isbn){
		return sqlSessionTemplate.selectOne("starAVG", isbn);
	}

	@Override
	public Long starCount(String isbn){
		return sqlSessionTemplate.selectOne("starCount", isbn);
	}
}
