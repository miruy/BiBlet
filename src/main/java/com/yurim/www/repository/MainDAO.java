package com.yurim.www.repository;

import com.yurim.www.dto.AppraisalDTO;

import java.util.List;

public interface MainDAO {
	List<String> popularList();
	List<String> recommendList();
	List<AppraisalDTO> latestComments();
	Long totalCommentCount();
}
