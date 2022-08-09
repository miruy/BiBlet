package com.yurim.www.service;

import com.yurim.www.dto.AdministratorDTO;
import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.NoticeDTO;
import com.yurim.www.dto.UserDTO;
import com.yurim.www.exception.*;
import com.yurim.www.repository.AdministratorDAO;
import com.yurim.www.repository.UserDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
@RequiredArgsConstructor
public class AdministratorServiceImpl implements AdministratorService{
    private final AdministratorDAO administratorDAO;

    //관리자 회원가입
    @Override
    public void adminSignup(AdministratorDTO admin) {

        //이메일 중복 확인
        int emailChkResult = administratorDAO.adminEmailChk(admin.getAdmEmail());
        if(emailChkResult > 0) {
            throw new AlreadyExistEmailException();
        }

        //아이디 중복 확인
        int idChkResult = administratorDAO.adminIdChk(admin.getAdmId());
        if(idChkResult == 1) {
            throw new AlreadyExistIdException();
        }

        // 보안코드 일치 여부
        if(!admin.getSecuritycode().equals("ABCDE")) {
            throw new SecurityCodeNotMatchingException();
        }

        administratorDAO.adminSignup(admin);
    }

    //관리자 인증키 수정
    @Override
    public void updateAdmAuthkey(String email, String authKey){
        HashMap<String, String> map = new HashMap<>();
        map.put("admEmail", email);
        map.put("admAuthkey", authKey);
        administratorDAO.updateAdmAuthkey(map);
    }

    //관리자 인증상태 수정
    @Override
    public void updateAdmStatus(String adm_email) {
        administratorDAO.updateAdmStatus(adm_email);
    }

    //관리자 인증 확인
    @Override
    public AdministratorDTO adminAuthenticate(AdministratorDTO admin) throws Exception {

        //테이블에서 관리자 정보 추출
        AdministratorDTO adminInfo = administratorDAO.selectByAdminId(admin.getAdmId());

        //관리자 정보가 없으면 예외처리
        if (adminInfo == null) {
            throw new IdPasswordNotMatchingException();
        }

        //관리자 비밀번호가 틀리면 예외처리
        if (!adminInfo.getAdmPass().equals(admin.getAdmPass())) {
            throw new IdPasswordNotMatchingException();
        }

        //이메일 인증이 되어있지 않다면 예외처리
        if (adminInfo.getAdmAuthstatus() == 0) {
            throw new AuthstatusException();
        }

        return adminInfo;
    }

    //모든 회원 정보 조회
    @Override
    public List<UserDTO> allUserInfo(){
        return administratorDAO.allUserInfo();
    }

    //모든 회원 수
    @Override
    public Long totalUser(){
        return administratorDAO.totalUser();
    }

    //회원 검색
    @Override
    public List<UserDTO> selectUserBySearchValue(UserDTO searchUser){
        return administratorDAO.selectUserBySearchValue(searchUser);
    }

    //회원 번호로 회원 정보 조회
    @Override
    public List<UserDTO> searchUserInfoByUserNo(Long userNo){
        return administratorDAO.searchUserInfoByUserNo(userNo);
    }

    //검색 회원 수
    @Override
    public Long totalCountBySearchValue(UserDTO searchUser){
        return administratorDAO.totalCountBySearchValue(searchUser);
    }

    //모든 평점 정보 조회
    @Override
    public List<AppraisalDTO> allStarInfo(){
        return administratorDAO.allStarInfo();
    }

    //모든 평점
    @Override
    public Long totalStar(){
        return administratorDAO.totalStar();
    }

    //평점 검색
    @Override
    public List<AppraisalDTO> selectStarBySearchValue(AppraisalDTO appraisal){
        return administratorDAO.selectStarBySearchValue(appraisal);
    }

    //검색 평점 수
    @Override
    public Long totalStarCountBySearchValue(AppraisalDTO appraisal){
        return administratorDAO.totalStarCountBySearchValue(appraisal);
    }

    //모든 평가 수
    @Override
    public Long totalComment(){
        return administratorDAO.totalComment();
    }

    //모든 평가 정보 조회
    @Override
    public List<AppraisalDTO> allCommentInfo(){
        return administratorDAO.allCommentInfo();
    }

    //검색 평가 수
    @Override
    public Long totalCommentCountBySearchValue(AppraisalDTO appraisal){
        return administratorDAO.totalCommentCountBySearchValue(appraisal);
    }

    //평가 검색
    @Override
    public List<AppraisalDTO> selectCommentBySearchValue(AppraisalDTO appraisal){
        return administratorDAO.selectCommentBySearchValue(appraisal);
    }

    //모든 관리자 수
    @Override
    public Long totalAdmin(){
        return administratorDAO.totalAdmin();
    }

    //모든 관리자 정보 조회
    @Override
    public List<AdministratorDTO> allAdminInfo(){
        return administratorDAO.allAdminInfo();
    }

    //검색 관리자 수
    @Override
    public Long totalAdminCountBySearchValue(AdministratorDTO admin){
        return administratorDAO.totalAdminCountBySearchValue(admin);
    }

    //관리자 검색
    @Override
    public List<AdministratorDTO> selectAdminBySearchValue(AdministratorDTO admin){
        return administratorDAO.selectAdminBySearchValue(admin);
    }

    //관리자 번호로 관리자 정보 조회
    @Override
    public AdministratorDTO selectAdminInfoByAdmNo(Long admNo){
        return administratorDAO.selectAdminInfoByAdmNo(admNo);
    }

    //회원 탈퇴
    @Override
    public void deleteUser(Long userNo){
        administratorDAO.deleteUserAppraisalByAdmin(userNo);
        administratorDAO.deleteUserBookshelfByAdmin(userNo);
        administratorDAO.deleteUser(userNo);
    }

    //평가 삭제
    @Override
    public void deleteAppraisal(Long appraisalNo){
        administratorDAO.deleteAppraisal(appraisalNo);
    }

    //코멘트 활성상태 제어
    @Override
    public void disabledComment(int active, Long appraisalNo){
        HashMap<String, Long> map = new HashMap<>();
        Long activeL = (long) active;
        map.put("active", activeL);
        map.put("appraisalNo", appraisalNo);
        administratorDAO.disabledComment(map);
    }

    //모든 공지사항 조회
    @Override
    public List<NoticeDTO> selectAllNotice(){
        return administratorDAO.selectAllNotice();
    }

    //모든 공지사항 수
    @Override
    public Long totalNoticeCount(){
        return administratorDAO.totalNoticeCount();
    }

    //공지사항 삭제
    @Override
    public void deleteNotice(Long noticeNo){
       administratorDAO.deleteNotice(noticeNo);
    }

    //첨부파일만 삭제
    @Override
    public void updateFileToNull(Long noticeNo){
        administratorDAO.updateFileToNull(noticeNo);
    }
}
