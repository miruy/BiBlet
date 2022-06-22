package com.yurim.www.service;

import com.yurim.www.dto.AppraisalDTO;

import java.util.List;

public interface MypageService {
    List<AppraisalDTO> myCommentForMypage(Long userNo);
}
