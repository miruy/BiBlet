package com.yurim.www.service;

import com.yurim.www.dto.AppraisalDTO;

import java.util.List;

public interface MainService {
    List<String> popularList_1to5();
    List<String> popularList_6to10();
    List<AppraisalDTO> latestComments();
    Long totalCommentCount();
}
