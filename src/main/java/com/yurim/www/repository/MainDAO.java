package com.yurim.www.repository;

import com.yurim.www.dto.AppraisalDTO;

import java.util.List;

public interface MainDAO {
	List<String> popularList_1to5();
	List<String> popularList_6to10();
	List<AppraisalDTO> latestComments();
	Long totalCommentCount();
}
