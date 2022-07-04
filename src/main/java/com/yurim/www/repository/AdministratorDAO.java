package com.yurim.www.repository;

import com.yurim.www.dto.AdministratorDTO;
import com.yurim.www.dto.UserDTO;

import java.util.HashMap;
import java.util.List;

public interface AdministratorDAO {
    void adminSignup(AdministratorDTO admin);
    int adminEmailChk(String email);
    int adminIdChk(String id);
    void updateAdmAuthkey(HashMap <String, String> map);
    void updateAdmStatus(String adm_email);
    AdministratorDTO selectByAdminId(String admId);
    List<UserDTO> allUserInfo();
    Long totalCount();
    List<UserDTO> selectUserBySearchValue(UserDTO searchUser);
    List<UserDTO> searchUserInfoByUserNo(Long userNo);
    Long totalCountBySearchValue(UserDTO searchUser);
}
