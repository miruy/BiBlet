package com.yurim.www.repository;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.UserDTO;

import java.util.List;

public interface MypageDAO {
    List<AppraisalDTO> myCommentForMypage(Long userNo); //나의 펼가 리스트
    List<AppraisalDTO> myEvaluateList(Long userNo); //나의 평점 리스트 5개 조회
    List<String> mypage_1(Long userNo); //읽고싶어요 리스트
    List<String> mypage_2(Long userNo); //읽는 중 리스트
    List<AppraisalDTO> mypage_4(Long userNo);   //나의 모든 평점 리스트
    void updateUserInfo(UserDTO newInfo);   //회원정보 수정
    void deleteUserInfo(Long userNo);   //회원 탈퇴
    void deleteBookshelf(Long userNo);  //보관함 삭제
    int deleteUserAppraisal(Long userNo);   //평가, 평점 삭제
    void changedDefaultProfile(Long userNo);    //기본 프로필로 돌아가기
}
