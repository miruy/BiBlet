package com.yurim.www.service;

import com.yurim.www.dto.AppraisalDTO;

import java.util.List;

public interface MainService {
    List<String> popularList();
    List<String> recommendList();
    List<AppraisalDTO> latestComments();
    Long totalCommentCount();
}
