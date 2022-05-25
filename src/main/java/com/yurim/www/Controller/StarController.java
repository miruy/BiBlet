package com.yurim.www.Controller;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.dto.UserDTO;
import com.yurim.www.service.AppraisalService;
import com.yurim.www.service.BookShelService;
import com.yurim.www.vo.RequestStar;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class StarController {

    private final AppraisalService appraisalService;
    private final BookShelService bookShelService;

    @ResponseBody
    @PostMapping("/star")
    public ResponseEntity insertStar(@RequestBody RequestStar requestStar, Errors errors,
                                     HttpSession session, HttpServletResponse response) {

        AppraisalDTO appraisal = new AppraisalDTO();
        BookShelfDTO bookShelf = new BookShelfDTO();

        /**
         * 에러시 반환
         */
        if (errors.hasErrors()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        /**
         * session에서 데이터를 꺼내 있는지 확인
         */
        UserDTO authInfo = null;
        if (session == null || session.getAttribute("authInfo") == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        /**
         * 세션에 담긴 로그인 객체를 꺼내 userDTO객체로 저장
         */
        authInfo = (UserDTO) session.getAttribute("authInfo");
        if(authInfo == null){
            return ResponseEntity.ok("로그인 에러");
        }

        /**
         * Long userNo로 변환
         */
        Long userNo = authInfo.getUserNo();

        bookShelf.setUserNo(userNo);
        bookShelf.setIsbn(requestStar.getIsbn());
        bookShelService.insertUserNoAndIsbn(bookShelf);

        bookShelf = bookShelService.selectStatusNoForStar(bookShelf);

        appraisal.setStar(requestStar.getStar());
        appraisal.setStatusNo(bookShelf.getStatusNo());
        appraisalService.insertStar(appraisal);

        String starMsg = null;
        if(appraisal.getStar() == 1){
            starMsg = "싫어요";
        }else if(appraisal.getStar() == 2){
            starMsg = "재미없어요";
        }else if(appraisal.getStar() == 3){
            starMsg = "보통이에요";
        }else if(appraisal.getStar() == 4){
            starMsg = "재미있어요";
        }else if(appraisal.getStar() == 5){
            starMsg = "최고예요!";
        }
        return ResponseEntity.ok(starMsg);
    }
}
