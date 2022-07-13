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

    @Override
    public void adminSignup(AdministratorDTO admin) {

        /**
         * 이메일 중복 확인
         */
        int emailChkResult = administratorDAO.adminEmailChk(admin.getAdmEmail());
        if(emailChkResult > 0) {
            throw new AlreadyExistEmailException();
        }


        /**
         * 아이디 중복 확인
         */
        int idChkResult = administratorDAO.adminIdChk(admin.getAdmId());
        if(idChkResult == 1) {
            throw new AlreadyExistIdException();
        }

        /**
         * 보안코드 일치 여부
         */

        if(!admin.getSecuritycode().equals("ABCDE")) {
            throw new SecurityCodeNotMatchingException();
        }

        administratorDAO.adminSignup(admin);
    }

    @Override
    public void updateAdmAuthkey(String email, String authKey){
        HashMap<String, String> map = new HashMap<>();
        map.put("admEmail", email);
        map.put("admAuthkey", authKey);
        administratorDAO.updateAdmAuthkey(map);
    }

    @Override
    public void updateAdmStatus(String adm_email) {
        administratorDAO.updateAdmStatus(adm_email);
    }

    @Override
    public AdministratorDTO adminAuthenticate(AdministratorDTO admin) throws Exception {
        /**
         * 테이블에서 관리자 정보 추출
         */
        AdministratorDTO adminInfo = administratorDAO.selectByAdminId(admin.getAdmId());

        /**
         * 관리자 정보가 없으면 예외처리
         */
        if (adminInfo == null) {
            throw new IdPasswordNotMatchingException();
        }

        /**
         * 관리자 비밀번호가 틀리면 예외처리
         */
        if (!adminInfo.getAdmPass().equals(admin.getAdmPass())) {
            throw new IdPasswordNotMatchingException();
        }

        /**
         * 이메일 인증이 되어있지 않다면 예외처리
         */
        if (adminInfo.getAdmAuthstatus() == 0) {
            throw new AuthstatusException();
        }

        return adminInfo;
    }

    @Override
    public List<UserDTO> allUserInfo(){
        return administratorDAO.allUserInfo();
    }

    @Override
    public Long totalUser(){
        return administratorDAO.totalUser();
    }

    @Override
    public List<UserDTO> selectUserBySearchValue(UserDTO searchUser){
        return administratorDAO.selectUserBySearchValue(searchUser);
    }

    @Override
    public List<UserDTO> searchUserInfoByUserNo(Long userNo){
        return administratorDAO.searchUserInfoByUserNo(userNo);
    }

    @Override
    public Long totalCountBySearchValue(UserDTO searchUser){
        return administratorDAO.totalCountBySearchValue(searchUser);
    }

    @Override
    public List<AppraisalDTO> allStarInfo(){
        return administratorDAO.allStarInfo();
    }
    @Override
    public Long totalStar(){
        return administratorDAO.totalStar();
    }

    @Override
    public List<AppraisalDTO> selectStarBySearchValue(AppraisalDTO appraisal){
        return administratorDAO.selectStarBySearchValue(appraisal);
    }

    @Override
    public Long totalStarCountBySearchValue(AppraisalDTO appraisal){
        return administratorDAO.totalStarCountBySearchValue(appraisal);
    }

    @Override
    public Long totalComment(){
        return administratorDAO.totalComment();
    }

    @Override
    public List<AppraisalDTO> allCommentInfo(){
        return administratorDAO.allCommentInfo();
    }

    @Override
    public Long totalCommentCountBySearchValue(AppraisalDTO appraisal){
        return administratorDAO.totalCommentCountBySearchValue(appraisal);
    }

    @Override
    public List<AppraisalDTO> selectCommentBySearchValue(AppraisalDTO appraisal){
        return administratorDAO.selectCommentBySearchValue(appraisal);
    }

    @Override
    public Long totalAdmin(){
        return administratorDAO.totalAdmin();
    }

    @Override
    public List<AdministratorDTO> allAdminInfo(){
        return administratorDAO.allAdminInfo();
    }

    @Override
    public Long totalAdminCountBySearchValue(AdministratorDTO admin){
        return administratorDAO.totalAdminCountBySearchValue(admin);
    }

    @Override
    public List<AdministratorDTO> selectAdminBySearchValue(AdministratorDTO admin){
        return administratorDAO.selectAdminBySearchValue(admin);
    }

    @Override
    public AdministratorDTO selectAdminInfoByAdmNo(Long admNo){
        return administratorDAO.selectAdminInfoByAdmNo(admNo);
    }

    @Override
    public void deleteUser(Long userNo){
        administratorDAO.deleteUser(userNo);
    }

    @Override
    public void deleteAppraisal(Long appraisalNo){
        administratorDAO.deleteAppraisal(appraisalNo);
    }

    @Override
    public void disabledComment(int active, Long appraisalNo){
        HashMap<String, Long> map = new HashMap<>();
        Long activeL = (long) active;
        map.put("active", activeL);
        map.put("appraisalNo", appraisalNo);
        administratorDAO.disabledComment(map);
    }

    @Override
    public List<NoticeDTO> selectAllNotice(){
        return administratorDAO.selectAllNotice();
    }

    @Override
    public Long totalNoticeCount(){
        return administratorDAO.totalNoticeCount();
    }

    @Override
    public void deleteNotice(Long noticeNo){
       administratorDAO.deleteNotice(noticeNo);
    }
}
