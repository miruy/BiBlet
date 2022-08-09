package com.yurim.www.repository;

import com.yurim.www.dto.AdministratorDTO;
import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.NoticeDTO;
import com.yurim.www.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class AdministratorDAOImpl implements AdministratorDAO {
    private final SqlSessionTemplate sqlSessionTemplate;

    //관리자 회원가입
    @Override
    public void adminSignup(AdministratorDTO admin) {
        sqlSessionTemplate.insert("adminSignup", admin);
    }

    //관리자 이메일 확인
    @Override
    public int adminEmailChk(String email) {
        int emailChkResult = sqlSessionTemplate.selectOne("adminEmailChk", email);
        return emailChkResult;
    }

    //관리자 ID 확인
    @Override
    public int adminIdChk(String id) {
        int idChkResult = sqlSessionTemplate.selectOne("adminIdChk", id);
        return idChkResult;
    }

    //관리자 인증키 수정
    @Override
    public void updateAdmAuthkey(HashMap<String, String> map) {
        sqlSessionTemplate.update("updateAdmAuthkey", map);
    }

    //관리자 인증상태 수정
    @Override
    public void updateAdmStatus(String adm_email) {
        sqlSessionTemplate.update("updateAdmStatus", adm_email);
    }

    //관리자 ID 조회
    @Override
    public AdministratorDTO selectByAdminId(String admId) {
        return sqlSessionTemplate.selectOne("selectByAdminId", admId);
    }

    //모든 회원 정보 조회
    @Override
    public List<UserDTO> allUserInfo() {
        return sqlSessionTemplate.selectList("allUserInfo");
    }

    //모든 회원 수
    @Override
    public Long totalUser() {
        return sqlSessionTemplate.selectOne("totalUser");
    }

    //회원 검색
    @Override
    public List<UserDTO> selectUserBySearchValue(UserDTO searchUser) {
        return sqlSessionTemplate.selectList("selectUserBySearchValue", searchUser);
    }

    //회원 번호로 회원 정보 조회
    @Override
    public List<UserDTO> searchUserInfoByUserNo(Long userNo) {
        return sqlSessionTemplate.selectList("searchUserInfoByUserNo", userNo);
    }

    //검색 회원 수
    @Override
    public Long totalCountBySearchValue(UserDTO searchUser) {
        return sqlSessionTemplate.selectOne("totalCountBySearchValue", searchUser);
    }

    //모든 평점 정보 조회
    @Override
    public List<AppraisalDTO> allStarInfo() {
        return sqlSessionTemplate.selectList("allStarInfo");
    }

    //모든 평점
    @Override
    public Long totalStar() {
        return sqlSessionTemplate.selectOne("totalStar");
    }

    //평점 검색
    @Override
    public List<AppraisalDTO> selectStarBySearchValue(AppraisalDTO appraisal) {
        return sqlSessionTemplate.selectList("selectStarBySearchValue", appraisal);
    }

    //검색 평점 수
    @Override
    public Long totalStarCountBySearchValue(AppraisalDTO appraisal) {
        return sqlSessionTemplate.selectOne("totalStarCountBySearchValue", appraisal);
    }

    //모든 평가
    @Override
    public Long totalComment(){
        return sqlSessionTemplate.selectOne("totalComment");
    }

    //모든 평가 정보 조회
    @Override
    public List<AppraisalDTO> allCommentInfo() {
        return sqlSessionTemplate.selectList("allCommentInfo");
    }

    //검색 평가 수
    @Override
    public Long totalCommentCountBySearchValue(AppraisalDTO appraisal) {
        return sqlSessionTemplate.selectOne("totalCommentCountBySearchValue", appraisal);
    }

    //평가 검색
    @Override
    public List<AppraisalDTO> selectCommentBySearchValue(AppraisalDTO appraisal) {
        return sqlSessionTemplate.selectList("selectCommentBySearchValue", appraisal);
    }

    //모든 관리자 수
    @Override
    public Long totalAdmin(){
        return sqlSessionTemplate.selectOne("totalAdmin");
    }

    //모든 관리자 정보 조회
    @Override
    public List<AdministratorDTO> allAdminInfo() {
        return sqlSessionTemplate.selectList("allAdminInfo");
    }

    //검색 관리자 수
    @Override
    public Long totalAdminCountBySearchValue(AdministratorDTO admin) {
        return sqlSessionTemplate.selectOne("totalAdminCountBySearchValue", admin);
    }

    //관리자 검색
    @Override
    public List<AdministratorDTO> selectAdminBySearchValue(AdministratorDTO admin) {
        return sqlSessionTemplate.selectList("selectAdminBySearchValue", admin);
    }

    //관리자 번호로 관리자 정보 조회
    @Override
    public AdministratorDTO selectAdminInfoByAdmNo(Long admNo){
        return sqlSessionTemplate.selectOne("selectAdminInfoByAdmNo", admNo);
    }

    //회원 탈퇴
    @Override
    public void deleteUser(Long userNo){
        sqlSessionTemplate.delete("deleteUser", userNo);
    }

    //관리자권한으로 평가 삭제
    @Override
    public void deleteUserAppraisalByAdmin(Long userNo){
        sqlSessionTemplate.delete("deleteUserAppraisalByAdmin", userNo);
    }

    //보관함 삭제
    @Override
    public void deleteUserBookshelfByAdmin(Long userNo){
        sqlSessionTemplate.delete("deleteUserBookshelfByAdmin", userNo);
    }

    //평가 삭제
    @Override
    public void deleteAppraisal(Long appraisalNo){
        sqlSessionTemplate.delete("deleteAppraisal", appraisalNo);
    }

    //코멘트 활성상태 제어
    @Override
    public void disabledComment(HashMap<String, Long> map){
        sqlSessionTemplate.delete("disabledComment", map);
    }

    //모든 공지사항 조회
    @Override
    public List<NoticeDTO> selectAllNotice(){
        return sqlSessionTemplate.selectList("selectAllNotice");
    }

    //모든 공지사항 수
    @Override
    public Long totalNoticeCount(){
        return sqlSessionTemplate.selectOne("totalNoticeCount");
    }

    //공지사항 삭제
    @Override
    public void deleteNotice(Long noticeNo){
        sqlSessionTemplate.delete("deleteNotice", noticeNo);
    }

    //첨부파일만 삭제
    @Override
    public void updateFileToNull(Long noticeNo){
        sqlSessionTemplate.update("updateFileToNull", noticeNo);
    }
}


