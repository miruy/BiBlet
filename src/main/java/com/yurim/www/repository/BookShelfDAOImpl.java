package com.yurim.www.repository;

import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository
@RequiredArgsConstructor
public class BookShelfDAOImpl implements BookShelfDAO {

	private final SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertBookShelfForStar(BookShelfDTO bookShelf){
		sqlSessionTemplate.insert("insertBookShelfForStar", bookShelf);
	}

	@Override
	public Long selectStatusNoForStar(BookShelfDTO bookShelf){
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

	@Override
	public Integer selectStatus(HashMap<String, String> map){
		return sqlSessionTemplate.selectOne("selectStatus", map);
	}

	@Override
	public void updateStatus(BookShelfDTO bookShelf){
		sqlSessionTemplate.update("updateStatus", bookShelf);
	}
}
