package com.yurim.www.Controller;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.dto.UserDTO;
import com.yurim.www.service.AppraisalService;
import com.yurim.www.service.BookShelService;
import com.yurim.www.vo.RequestStar;
import com.yurim.www.vo.RequestStatus;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class StatusController {
    private final BookShelService bookShelService;

    @ResponseBody
    @PostMapping("/want")
    public ResponseEntity insertStar(@RequestBody RequestStatus requestStatus, Errors errors,
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
        bookShelf.setIsbn(requestStatus.getIsbn());
        bookShelf.setStatus(requestStatus.getStatus());
        bookShelService.insertWant(bookShelf);


        return ResponseEntity.ok(1);
    }
}
