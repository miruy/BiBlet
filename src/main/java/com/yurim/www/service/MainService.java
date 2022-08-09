package com.yurim.www.service;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.UserDTO;

import java.util.List;

public interface MainService {
    List<String> popularList(); //인기도서 TOP10
    List<String> recommendList();   //추천도서 TOP10
    List<AppraisalDTO> latestComments();    //최근 코멘트 5개
    List<Integer> latestStar(Long userNo, String isbn); //최근 평점 5개
    Long totalCommentCount();   //총 평가 수
    Long userCommentCount(Long userNo); //해당 회원이 작성한 평가 수
    Long userStarCount(Long userNo);    //해당 회원이 등록한 평점 수
    List<String> wantReadList(Long userNo); //읽고싶어요 리스트
    List<String> readingList(Long userNo);  //읽는 중 리스트
}
