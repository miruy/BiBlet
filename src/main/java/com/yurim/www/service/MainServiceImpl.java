package com.yurim.www.service;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.repository.MainDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

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
    public Long totalCommentCount() {
        return mainDAO.totalCommentCount();
    }


}
