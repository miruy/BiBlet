package com.yurim.www.repository;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.UserDTO;

import java.util.List;

public interface MypageDAO {
    List<AppraisalDTO> myCommentForMypage(Long userNo);
    List<AppraisalDTO> myEvaluateList(Long userNo);
    List<String> mypage_1(Long userNo);
    List<String> mypage_2(Long userNo);
    List<AppraisalDTO> mypage_4(Long userNo);
    void updateUserInfo(UserDTO newInfo);
    void deleteUserInfo(Long userNo);
    void deleteBookshelf(Long userNo);
    int deleteUserAppraisal(Long userNo);
    void changedDefaultProfile(Long userNo);
}
