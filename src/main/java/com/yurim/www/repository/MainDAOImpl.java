package com.yurim.www.repository;

import com.yurim.www.dto.AppraisalDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class MainDAOImpl implements MainDAO {
	private final SqlSessionTemplate sqlSessionTemplate;

	//인기도서 TOP10
	@Override
	public List<String> popularList() {
		return sqlSessionTemplate.selectList("popularList");
	}

	//추천도서 TOP10
	@Override
	public List<String> recommendList() {
		return sqlSessionTemplate.selectList("recommendList");
	}

	//최근 코멘트 5개
	@Override
	public List<AppraisalDTO> latestComments() {
		return sqlSessionTemplate.selectList("latestComments");
	}

	//최근 평점 5개
	@Override
	public List<Integer> latestStar(HashMap<String, String> map){
		return sqlSessionTemplate.selectList("latestStar", map);
	}

	//총 평가 수
	@Override
	public Long totalCommentCount() {
		return sqlSessionTemplate.selectOne("totalCommentCount");
	}

	//해당 회원이 작성한 평가 수
	@Override
	public Long userCommentCount(Long userNo){
		return sqlSessionTemplate.selectOne("userCommentCount", userNo);
	}

	//해당 회원이 등록한 평점 수
	@Override
	public Long userStarCount(Long userNo){
		return sqlSessionTemplate.selectOne("userStarCount", userNo);
	}

	//읽고싶어요 리스트
	@Override
	public List<String> wantReadList(Long userNo){
		return sqlSessionTemplate.selectList("wantReadList", userNo);
	}

	//읽고 중 리스트
	@Override
	public List<String> readingList(Long userNo){
		return sqlSessionTemplate.selectList("readingList", userNo);
	}
}
