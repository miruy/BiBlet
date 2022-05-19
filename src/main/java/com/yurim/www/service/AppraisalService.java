package com.yurim.www.service;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.vo.RequestCommentForDetail;

import java.util.List;

public interface AppraisalService {
//    void writeComment(AppraisalDTO appraisalDTO);	//평가 작성

//    BookShelfVO insertBookShelf(BookShelfVO bookShelf); 	//독서 상태 삽입
//    BookShelfVO selectBookShelf(BookShelfVO bookShelf);		//독서 상태 호출
//
    int commentCount(String isbn); 		//해당 도서의 대한 평가 개수 호출
    List<RequestCommentForDetail> findAllComment(String isbn); 	//해당 도서의 대한 모든 평가 호출
//    void updateComment(UpdateCmd updateComment); 	//평가 수정
//    void deleteComment(DeleteCmd deleteCmd);	//평가 삭제
//
//    CommentCmd getComment(Long appraisal_num);
//    String getMemPass(Long appraisal_num);
}
