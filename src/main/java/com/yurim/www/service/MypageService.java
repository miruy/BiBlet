package com.yurim.www.service;

import com.yurim.www.dto.AppraisalDTO;

import java.util.List;

public interface MypageService {
    List<AppraisalDTO> myCommentForMypage(Long userNo);
    List<AppraisalDTO> myEvaluateList(Long userNo);
    List<String> mypage_1(Long userNo);
    List<String> mypage_2(Long userNo);
    List<AppraisalDTO> mypage_4(Long userNo);
}
