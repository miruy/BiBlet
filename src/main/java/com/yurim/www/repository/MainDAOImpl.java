package com.yurim.www.repository;

import com.yurim.www.dto.AppraisalDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class MainDAOImpl implements MainDAO {

	private final SqlSessionTemplate sqlSessionTemplate;

	// 인기 도서 리스트
	@Override
	public List<String> popularList_1to5() {
		return sqlSessionTemplate.selectList("popularList_1to5");
	}

	@Override
	public List<String> popularList_6to10() {
		return sqlSessionTemplate.selectList("popularList_6to10");
	}

	// 최근 코멘트
	@Override
	public List<AppraisalDTO> latestComments() {
		return sqlSessionTemplate.selectList("latestComments");
	}

	// 모든 평가 불러오기
	@Override
	public Long totalCommentCount() {
		return sqlSessionTemplate.selectOne("totalCommentCount");
	}

}
