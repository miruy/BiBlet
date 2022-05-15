package com.yurim.www.service;

import com.yurim.www.dto.UserDTO;
import com.yurim.www.exception.AlreadyExistEmailException;
import com.yurim.www.exception.AlreadyExistIdException;
import com.yurim.www.repository.UserDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
    private final UserDAO userDAO;
    @Override
    public void userSignup(UserDTO userDTO) {

        /**
         * 이메일 중복 확인
         */
        int emailChkResult = userDAO.userEmailChk(userDTO.getEmail());
        if(emailChkResult > 0) {
            throw new AlreadyExistEmailException();
        }


        /**
         * 아이디 중복 확인
         */
        int idChkResult = userDAO.userIdChk(userDTO.getId());
        if(idChkResult == 1) {
            throw new AlreadyExistIdException();
        }

        String defaultPic = "profile.png";
        userDTO.setOriginPic(defaultPic);

        userDAO.userSignup(userDTO);
    }
}
