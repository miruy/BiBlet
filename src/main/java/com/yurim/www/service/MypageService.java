package com.yurim.www.service;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.vo.RequestSignup;
import com.yurim.www.vo.RequestUpdateUserInfo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

public interface MypageService {
    List<AppraisalDTO> myCommentForMypage(Long userNo);
    List<AppraisalDTO> myEvaluateList(Long userNo);
    List<String> mypage_1(Long userNo);
    List<String> mypage_2(Long userNo);
    List<AppraisalDTO> mypage_4(Long userNo);
    void updateUserInfo(RequestUpdateUserInfo requestUpdateUserInfo, MultipartFile multipartFile, HttpServletRequest request) throws IllegalStateException, IOException;
    void deleteBookshelf(Long userNo);
    int deleteUserAppraisal(Long userNo);
    void deleteUserInfo(Long userNo);
    void changedDefaultProfile(Long userNo);
}
