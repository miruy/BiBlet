package com.yurim.www.service;

import com.yurim.www.dto.AdministratorDTO;
import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.UserDTO;

import java.util.List;

public interface AdministratorService {
    void adminSignup(AdministratorDTO admin);
    void updateAdmAuthkey(String email, String authKey);
    void updateAdmStatus(String adm_email);
    AdministratorDTO adminAuthenticate(AdministratorDTO admin) throws Exception;
    List<UserDTO> searchUserInfoByUserNo(Long userNo);


    List<UserDTO> allUserInfo();
    Long totalUser();
    List<UserDTO> selectUserBySearchValue(UserDTO searchUser);
    Long totalCountBySearchValue(UserDTO searchUser);


    List<AppraisalDTO> allStarInfo();
    Long totalStar();
    List<AppraisalDTO> selectStarBySearchValue(AppraisalDTO appraisal);
    Long totalStarCountBySearchValue(AppraisalDTO appraisal);


    Long totalComment();
    List<AppraisalDTO> allCommentInfo();
    Long totalCommentCountBySearchValue(AppraisalDTO appraisal);
    List<AppraisalDTO> selectCommentBySearchValue(AppraisalDTO appraisal);


    Long totalAdmin();
    List<AdministratorDTO> allAdminInfo();
    Long totalAdminCountBySearchValue(AdministratorDTO admin);
    List<AdministratorDTO> selectAdminBySearchValue(AdministratorDTO admin);


    AdministratorDTO selectAdminInfoByAdmNo(Long admNo);
    void deleteUser(Long userNo);
    void deleteAppraisal(Long appraisalNo);
    void disabledComment(int active, Long appraisalNo);
}
