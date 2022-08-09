package com.yurim.www.repository;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.BookShelfDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class AppraisalDAOImpl implements AppraisalDAO {

	private final SqlSessionTemplate sqlSessionTemplate;

	//해당 도서의 대한 모든 평가 조회
	@Override
	public List<AppraisalDTO> findAllComment(String isbn) {
		return sqlSessionTemplate.selectList("findAllComment", isbn);
	}

	//해당 도서의 대한 모든 평점 조회
	@Override
	public List<AppraisalDTO> findAllStar(String isbn){
		return sqlSessionTemplate.selectList("findAllStar", isbn);
	}

	//해당 도서의 대한 평가 개수 조회
	@Override
	public int commentCount(String isbn) {
		return sqlSessionTemplate.selectOne("commentCount", isbn);
	}

	//평가 작성
	@Override
	public void writeComment(AppraisalDTO appraisal) {
		sqlSessionTemplate.insert("writeComment", appraisal);
	}

	//평균 평점 조회
	@Override
	public Integer starAVG(String isbn){
		return sqlSessionTemplate.selectOne("starAVG", isbn);
	}

	//평점 개수
	@Override
	public Long starCount(String isbn){
		return sqlSessionTemplate.selectOne("starCount", isbn);
	}

	//해당 도서의 대한 회원의 평점
	@Override
	public Integer userStar(HashMap<String, String> map){
		return sqlSessionTemplate.selectOne("userStar", map);
	}

	//평점 등록
	@Override
	public void insertStar(HashMap<String, Long> map){
		sqlSessionTemplate.insert("insertStar", map);
	}

	//평점 수정
	@Override
	public void updateStar(AppraisalDTO appraisal){
		sqlSessionTemplate.update("updateStar", appraisal);
	}

	//평점 삭제
	@Override
	public void deleteStar(HashMap<String, String> map){
		sqlSessionTemplate.delete("deleteStar", map);
	}

	//해당 도서의 대한 회원의 평가
	@Override
	public List<AppraisalDTO> selectMyComment(BookShelfDTO bookShelf){
		return sqlSessionTemplate.selectList("selectMyComment", bookShelf);
	}

	//평가 수정
	@Override
	public void updateComment(AppraisalDTO appraisal){
		sqlSessionTemplate.update("updateComment", appraisal);
	}

	//ID로 카카오 로그인 회원 이름 조회
	@Override
	public String selectKakaoNameById(String id){
		return sqlSessionTemplate.selectOne("selectKakaoNameById", id);
	}

	//평가 삭제
	@Override
	public void deleteComment(HashMap<String, String> map){
		sqlSessionTemplate.delete("deleteComment", map);
	}
}
