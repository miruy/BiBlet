package com.yurim.www.repository;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class BookShelfDAOImpl implements BookShelfDAO {
	private final SqlSessionTemplate sqlSessionTemplate;

	//평점 확인을 위한 독서상태 조회
	@Override
	public Long selectStatusNoForStar(BookShelfDTO bookShelf){
		return sqlSessionTemplate.selectOne("selectStatusNoForStar", bookShelf);
	}

	//독서상태 등록
	@Override
	public void insertStatus(BookShelfDTO bookShelf){
		sqlSessionTemplate.insert("insertStatus", bookShelf);
	}

	//독서상태 삭제
	@Override
	public void deleteStatus(BookShelfDTO bookShelf){
		sqlSessionTemplate.delete("deleteStatus", bookShelf);
	}

	//독서상태 조회
	@Override
	public Integer selectStatus(HashMap<String, String> map){
		return sqlSessionTemplate.selectOne("selectStatus", map);
	}

	//독서상태 수정
	@Override
	public void updateStatus(BookShelfDTO bookShelf){
		sqlSessionTemplate.update("updateStatus", bookShelf);
	}

	//평가 확인을 위한 독서상태 조회
	@Override
	public Integer selectStatusForComment(BookShelfDTO bookShelf) {
		return sqlSessionTemplate.selectOne("selectStatusForComment", bookShelf);
	}

	//평가 확인을 위한 독서상태 번호 조회
	@Override
	public Long selectStatusNoForComment(BookShelfDTO bookShelf) {
		return sqlSessionTemplate.selectOne("selectStatusNoForComment", bookShelf);
	}

	//평가 작성을 위한 독서상태 번호 조회
	@Override
	public Long selectStatusNoForWriteComment(BookShelfDTO bookShelf){
		return sqlSessionTemplate.selectOne("selectStatusNoForWriteComment", bookShelf);
	}

	//해당 도서의 대한 회원의 독서상태
	@Override
	public Integer userStatus(HashMap<String, String> map){
		return sqlSessionTemplate.selectOne("userStatus", map);
	}

	//해당 도서의 대한 회원의 평가 조회
	@Override
	public List<String> selectMyCommentIsbn(Long userNo){
		return sqlSessionTemplate.selectList("selectMyCommentIsbn", userNo);
	}
}
