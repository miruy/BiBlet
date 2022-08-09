package com.yurim.www.repository;

import com.yurim.www.dto.AdministratorDTO;
import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.NoticeDTO;
import com.yurim.www.dto.UserDTO;

import java.util.HashMap;
import java.util.List;

public interface AdministratorDAO {
    void adminSignup(AdministratorDTO admin);   //관리자 회원가입
    int adminEmailChk(String email);    //관리자 이메일 확인
    int adminIdChk(String id);  //관리자 ID 확인
    void updateAdmAuthkey(HashMap <String, String> map);    //관리자 인증키 수정
    void updateAdmStatus(String adm_email); //관리자 인증상태 수정
    AdministratorDTO selectByAdminId(String admId); //관리자 ID 조회


    List<UserDTO> allUserInfo();    //모든 회원 정보 조회
    Long totalUser();   //모든 회원 수
    List<UserDTO> selectUserBySearchValue(UserDTO searchUser);  //회원 검색
    List<UserDTO> searchUserInfoByUserNo(Long userNo);  //회원 번호로 회원 정보 조회
    Long totalCountBySearchValue(UserDTO searchUser);   //검색 회원 수


    List<AppraisalDTO> allStarInfo();   //모든 평점 정보 조회
    Long totalStar();   //모든 평점
    List<AppraisalDTO> selectStarBySearchValue(AppraisalDTO appraisal); //평점 검색
    Long totalStarCountBySearchValue(AppraisalDTO appraisal);   //검색 평점 수


    Long totalComment();    //모든 평가
    List<AppraisalDTO> allCommentInfo();    //모든 평가 정보 조회
    Long totalCommentCountBySearchValue(AppraisalDTO appraisal);    //검색 평가 수
    List<AppraisalDTO> selectCommentBySearchValue(AppraisalDTO appraisal);  //평가 검색


    Long totalAdmin();  //모든 관리자 수
    List<AdministratorDTO> allAdminInfo();  //모든 관리자 정보 조회
    Long totalAdminCountBySearchValue(AdministratorDTO admin);  //검색 관리자 수
    List<AdministratorDTO> selectAdminBySearchValue(AdministratorDTO admin);    //관리자 검색
    AdministratorDTO selectAdminInfoByAdmNo(Long admNo);    //관리자 번호로 관리자 정보 조회


    void deleteUser(Long userNo);   //회원 탈퇴
    void deleteUserAppraisalByAdmin(Long userNo);   //관리자권한으로 평가 삭제
    void deleteUserBookshelfByAdmin(Long userNo);   //보관함 삭제
    void deleteAppraisal(Long appraisalNo); //평가 삭제
    void disabledComment(HashMap<String, Long> map);    //코멘트 활성상태 제어


    List<NoticeDTO> selectAllNotice();  //모든 공지사항 조회
    Long totalNoticeCount();    //모든 공지사항 수
    void deleteNotice(Long noticeNo);   //공지사항 삭제
    void updateFileToNull(Long noticeNo);   //첨부파일만 삭제
}
