package com.yurim.www.repository;

import com.yurim.www.dto.AdministratorDTO;
import com.yurim.www.dto.UserDTO;

import java.util.HashMap;

public interface AdministratorDAO {
    void adminSignup(AdministratorDTO admin);
    int adminEmailChk(String email);
    int adminIdChk(String id);
    void updateAdmAuthkey(HashMap <String, String> map);
    void updateAdmStatus(String adm_email);
    AdministratorDTO selectByAdminId(String admId);
}
