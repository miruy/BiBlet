package com.yurim.www.service;


import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.repository.MypageDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService {

    private final MypageDAO mypageDAO;

    @Override
    public List<AppraisalDTO> myCommentForMypage(Long userNo) {
        return mypageDAO.myCommentForMypage(userNo);
    }

    @Override
    public List<AppraisalDTO> myEvaluateList(Long userNo) {
        return mypageDAO.myEvaluateList(userNo);
    }
}
