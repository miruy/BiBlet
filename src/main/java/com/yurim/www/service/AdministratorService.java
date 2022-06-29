package com.yurim.www.service;

import com.yurim.www.dto.AdministratorDTO;
import com.yurim.www.dto.UserDTO;

public interface AdministratorService {
    void adminSignup(AdministratorDTO admin);
    void updateAdmAuthkey(String email, String authKey);
    void updateAdmStatus(String adm_email);
    AdministratorDTO adminAuthenticate(AdministratorDTO admin) throws Exception;
}
