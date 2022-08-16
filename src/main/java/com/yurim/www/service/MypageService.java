package com.yurim.www.service;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.vo.RequestSignup;
import com.yurim.www.vo.RequestUpdateUserInfo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

public interface MypageService {
    List<AppraisalDTO> myCommentForMypage(Long userNo); //나의 펼가 리스트
    List<AppraisalDTO> myEvaluateList(Long userNo); //나의 평점 리스트 6개 조회
    List<AppraisalDTO> wantReadListForMypage(Long userNo); //나의 읽고 싶은 도서 리스트 6개 조회
    List<AppraisalDTO> readingListForMypage(Long userNo); //나의 읽는 중 도서 리스트트 6개 조회
    List<String> wantRead(Long userNo); //읽고싶어요 리스트
    List<String> reading(Long userNo); //읽는 중 리스트
    List<AppraisalDTO> mypage_4(Long userNo);   //나의 모든 평점 리스트
    void updateUserInfo(RequestUpdateUserInfo requestUpdateUserInfo, MultipartFile multipartFile,
                        HttpServletRequest request) throws IllegalStateException, IOException;    //회원정보 수정
    void deleteBookshelf(Long userNo);  //보관함 삭제
    int deleteUserAppraisal(Long userNo);    //평가, 평점 삭제
    void deleteUserInfo(Long userNo);  //회원 탈퇴
    void changedDefaultProfile(Long userNo);    //기본 프로필로 돌아가기
}
