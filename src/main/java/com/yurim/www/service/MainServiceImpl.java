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
	public List<String> popularList_1to5() {
		return mainDAO.popularList_1to5();
	}

	@Override
	public List<String> popularList_6to10() {
		return mainDAO.popularList_6to10();
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
