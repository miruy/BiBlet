package com.yurim.www.service;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.repository.AppraisalDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
@RequiredArgsConstructor
public class AppraisalServiceImpl implements AppraisalService {
    private final AppraisalDAO appraisalDAO;

    //해당 도서의 대한 모든 평가 조회
    @Override
    public List<AppraisalDTO> findAllComment(String isbn) {
        return appraisalDAO.findAllComment(isbn);
    }

    //해당 도서의 대한 모든 평점 조회
    @Override
    public List<AppraisalDTO> findAllStar(String isbn){
        return appraisalDAO.findAllStar(isbn);
    }

    //해당 도서의 대한 평가 개수 조회
    @Override
    public int commentCount(String isbn) {
        return appraisalDAO.commentCount(isbn);
    }

    //평가 작성
    @Override
    public void writeComment(AppraisalDTO appraisal) {
        appraisalDAO.writeComment(appraisal);
    }

    //평균 평점 조회
    @Override
    public Integer starAVG(String isbn) {
        return appraisalDAO.starAVG(isbn);
    }

    //평점 개수
    @Override
    public Long starCount(String isbn) {
        return appraisalDAO.starCount(isbn);
    }

    //해당 도서의 대한 회원의 평점
    @Override
    public Integer userStar(Long userNo, String isbn) {
        HashMap<String, String> map = new HashMap<>();
        String userNoS = String.valueOf(userNo);
        map.put("userNo", userNoS);
        map.put("isbn", isbn);
        return appraisalDAO.userStar(map);
    }

    //평점 등록
    @Override
    public void insertStar(Long statusNo, int star, Long userNo, String isbn) {
        HashMap<String, Long> map = new HashMap<>();
        Long starL = (long) star;
        Long isbnL = Long.parseLong(isbn);
        map.put("statusNo", statusNo);
        map.put("star", starL);
        map.put("userNo", userNo);
        map.put("isbn", isbnL);
        appraisalDAO.insertStar(map);
    }

    //평점 수정
    @Override
    public void updateStar(AppraisalDTO appraisal) {
        appraisalDAO.updateStar(appraisal);
    }

    //평점 삭제
    @Override
    public void deleteStar(Long userNo, String isbn, int star) {
        HashMap<String, String> map = new HashMap<>();
        String userNoS = String.valueOf(userNo);
        String starS = String.valueOf(star);

        map.put("userNo", userNoS);
        map.put("isbn", isbn);
        map.put("star", starS);

        appraisalDAO.deleteStar(map);
    }

    //해당 도서의 대한 회원의 평가
    @Override
    public List<AppraisalDTO> selectMyComment(BookShelfDTO bookShelf) {
        return appraisalDAO.selectMyComment(bookShelf);
    }

    //평가 수정
    @Override
    public void updateComment(AppraisalDTO appraisal) {
        appraisalDAO.updateComment(appraisal);
    }

    //ID로 카카오 로그인 회원 이름 조회
    @Override
    public String selectKakaoNameById(String id){
        return appraisalDAO.selectKakaoNameById(id);
    }

    //평가 삭제
    @Override
    public void deleteComment(Long userNo, String isbn){
        HashMap<String, String> map = new HashMap<>();
        String userNoS = String.valueOf(userNo);

        map.put("userNo", userNoS);
        map.put("isbn", isbn);

        appraisalDAO.deleteComment(map);
    }
}
