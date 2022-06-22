package com.yurim.www.repository;

import com.yurim.www.dto.AppraisalDTO;

import java.util.List;

public interface MypageDAO {
    List<AppraisalDTO> myCommentForMypage(Long userNo);
}
