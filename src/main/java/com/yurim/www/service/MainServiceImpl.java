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

    //인기도서 TOP10
    @Override
    public List<String> popularList() {
        return mainDAO.popularList();
    }

    //추천도서 TOP10
    @Override
    public List<String> recommendList() {
        return mainDAO.recommendList();
    }

    //최근 코멘트 5개
    @Override
    public List<AppraisalDTO> latestComments() {
        return mainDAO.latestComments();
    }

    //최근 평점 5개
    @Override
    public List<Integer> latestStar(Long userNo, String isbn) {
        HashMap<String, String> map = new HashMap<>();
        String userNoS = String.valueOf(userNo);
        map.put("userNo", userNoS);
        map.put("isbn", isbn);
        return mainDAO.latestStar(map);
    }

    //총 평가 수
    @Override
    public Long totalCommentCount() {
        return mainDAO.totalCommentCount();
    }

    //해당 회원이 작성한 평가 수
    @Override
    public Long userCommentCount(Long userNo) {
        return mainDAO.userCommentCount(userNo);
    }

    //해당 회원이 등록한 평점 수
    @Override
    public Long userStarCount(Long userNo) {
        return mainDAO.userCommentCount(userNo);
    }

    //읽고싶어요 리스트
    @Override
    public List<String> wantReadList(Long userNo) {
        return mainDAO.wantReadList(userNo);
    }

    //읽는 중 리스트
    @Override
    public List<String> readingList(Long userNo) {
        return mainDAO.readingList(userNo);
    }
}
