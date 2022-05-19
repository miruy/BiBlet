package com.yurim.www.service;

import com.yurim.www.dto.UserDTO;
import com.yurim.www.exception.AlreadyExistEmailException;
import com.yurim.www.exception.AlreadyExistIdException;
import com.yurim.www.exception.AuthstatusException;
import com.yurim.www.exception.IdPasswordNotMatchingException;
import com.yurim.www.repository.UserDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;

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

    @Override
    public String selectKey(String email){
        return userDAO.selectKey(email);
    }

    @Override
    public void updateKey(String email, String authKey) {
        HashMap<String, String> map = new HashMap<>();
        map.put("email", email);
        map.put("authKey", authKey);
        userDAO.updateKey(map);
    }

    @Override
    public void updateStatus(String email, String authKey) {
        HashMap<String, String> map = new HashMap<>();
        map.put("email", email);
        map.put("authKey", authKey);
        userDAO.updateStatus(map);
    }

    @Override
    public UserDTO authenticate(UserDTO userDTO) throws Exception {
        UserDTO user = userDAO.selectUserInfoById(userDTO.getId());

        /**
         * 테이블에 사용자가 없을 때 예외처리
         */
        if (user == null) {
            throw new IdPasswordNotMatchingException();
        }

        /**
         * 패스워드가 같지 않다면 예외 처리
         */
        if (!user.getPass().equals(userDTO.getPass())) {
            throw new IdPasswordNotMatchingException();
        }

        /**
         * 이메일 인증이 되어있지 않다면 예외처리
         */
        if (user.getAuthStatus() == 0) {
            throw new AuthstatusException();
        }
        return user;
    }

    @Override
    public String findIdByEmail(String email, String pass){
        HashMap<String, String> map = new HashMap<>();
        map.put("email", email);
        map.put("pass", pass);
        return userDAO.findIdByEmail(map);
    }
}
