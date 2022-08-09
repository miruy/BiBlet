package com.yurim.www.service;


import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.UserDTO;
import com.yurim.www.repository.MypageDAO;
import com.yurim.www.vo.RequestSignup;
import com.yurim.www.vo.RequestUpdateUserInfo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService {
    private final MypageDAO mypageDAO;

    //나의 펼가 리스트
    @Override
    public List<AppraisalDTO> myCommentForMypage(Long userNo) {
        return mypageDAO.myCommentForMypage(userNo);
    }

    //나의 평점 리스트 5개 조회
    @Override
    public List<AppraisalDTO> myEvaluateList(Long userNo) {
        return mypageDAO.myEvaluateList(userNo);
    }

    //읽고싶어요 리스트
    @Override
    public List<String> mypage_1(Long userNo){
        return mypageDAO.mypage_1(userNo);
    }

    //읽는 중 리스트
    @Override
    public List<String> mypage_2(Long userNo){
        return mypageDAO.mypage_2(userNo);
    }

    //나의 모든 평점 리스트
    @Override
    public List<AppraisalDTO> mypage_4(Long userNo){
        return mypageDAO.mypage_4(userNo);
    }

    //회원정보 수정
    @Override
    public void updateUserInfo(RequestUpdateUserInfo requestUpdateUserInfo, MultipartFile multipartFile,
                               HttpServletRequest request) throws IllegalStateException, IOException{

        UserDTO newInfo = new UserDTO();

        //사용자가 선택한 프로필 이름 추출
        String orgimagename = multipartFile.getOriginalFilename();

        //사용자가 선택한 프로픨 확장자 추출
        String orgimagenameExtension = orgimagename.substring(orgimagename.lastIndexOf("."));

        //프로젝트 내 폴더에 사진 파일을 저장할 때 uuid값에 orgimagenameExtension(확장자)를 붙혀 저장 (= sjf743ifhrht32 + .png)
        String storedimagename = UUID.randomUUID().toString().replaceAll("-", "") + orgimagenameExtension;

        //파일이 저장될 경로(서버 측)
        String savePath = "/Users/kim-yurim/Desktop/workspace/www/src/main/webapp/images/";

        //파일이 저장될 경로 + 최종 파일명
        String uploadFile = savePath + storedimagename;

        //업로드요청으로 전달받은 파일을 위에서 설정한 특정 경로에 특정 파일명으로 저장
        File file = new File(uploadFile);

        multipartFile.transferTo(file);

        newInfo.setId(requestUpdateUserInfo.getId());
        newInfo.setPass(requestUpdateUserInfo.getNewPass());
        newInfo.setEmail(requestUpdateUserInfo.getEmail());
        newInfo.setUserNo(requestUpdateUserInfo.getUserNo());
        newInfo.setOriginPic(orgimagename);
        newInfo.setStoredPic(storedimagename);

        mypageDAO.updateUserInfo(newInfo);
    }

    //보관함 삭제
    @Override
    public void deleteBookshelf(Long userNo){
        mypageDAO.deleteBookshelf(userNo);
    }

    //평가, 평점 삭제
    @Override
    public int deleteUserAppraisal(Long userNo){
        return mypageDAO.deleteUserAppraisal(userNo);
    }

    //회원 탈퇴
    @Override
    public void deleteUserInfo(Long userNo){
        mypageDAO.deleteUserInfo(userNo);
    }

    //기본 프로필로 돌아가기
    @Override
    public void changedDefaultProfile(Long userNo){
        mypageDAO.changedDefaultProfile(userNo);
    }
}
