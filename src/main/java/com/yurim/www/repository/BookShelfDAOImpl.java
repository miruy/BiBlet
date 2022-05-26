package com.yurim.www.repository;

import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class BookShelfDAOImpl implements BookShelfDAO {

	private final SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertUserNoAndIsbn(BookShelfDTO bookShelf){
		sqlSessionTemplate.insert("insertUserNoAndIsbn", bookShelf);
	}

	@Override
	public BookShelfDTO selectStatusNoForStar(BookShelfDTO bookShelf){
		return sqlSessionTemplate.selectOne("selectStatusNoForStar", bookShelf);
	}

	@Override
	public void insertStatus(BookShelfDTO bookShelf){
		sqlSessionTemplate.insert("insertStatus", bookShelf);
	}

	@Override
	public void deleteStatus(BookShelfDTO bookShelf){
		sqlSessionTemplate.delete("deleteStatus", bookShelf);
	}
}
