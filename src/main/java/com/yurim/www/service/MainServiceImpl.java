package com.yurim.www.service;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.repository.MainDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MainServiceImpl implements MainService {

    private final MainDAO mainDAO;

    @Override
    public List<String> popularList() {
        return mainDAO.popularList();
    }

    @Override
    public List<String> recommendList() {
        return mainDAO.recommendList();
    }

    @Override
    public List<AppraisalDTO> latestComments() {
        return mainDAO.latestComments();
    }

    @Override
    public List<Integer> latestStar(Long userNo, String isbn) {
        HashMap<String, String> map = new HashMap<>();
        String userNoS = String.valueOf(userNo);
        map.put("userNo", userNoS);
        map.put("isbn", isbn);
        return mainDAO.latestStar(map);
    }

    @Override
    public Long totalCommentCount() {
        return mainDAO.totalCommentCount();
    }

    @Override
    public Long userCommentCount(Long userNo) {
        return mainDAO.userCommentCount(userNo);
    }

    @Override
    public Long userStarCount(Long userNo) {
        return mainDAO.userCommentCount(userNo);
    }

    @Override
    public List<String> wantReadList(Long userNo) {
        return mainDAO.wantReadList(userNo);
    }

    @Override
    public List<String> readingList(Long userNo) {
        return mainDAO.readingList(userNo);
    }
}
