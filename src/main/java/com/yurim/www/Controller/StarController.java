package com.yurim.www.Controller;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.dto.UserDTO;
import com.yurim.www.service.AppraisalService;
import com.yurim.www.service.BookShelfService;
import com.yurim.www.service.UserService;
import com.yurim.www.vo.RequestStar;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
@RequiredArgsConstructor
public class StarController {

    private final AppraisalService appraisalService;
    private final UserService userService;
    private final BookShelfService bookShelService;

    @ResponseBody
    @PostMapping("/star")
    public ResponseEntity<?> updateStar(@RequestBody RequestStar requestStar, Errors errors,
                                     HttpSession session, HttpServletResponse response) {

        BookShelfDTO bookShelf = new BookShelfDTO();
        AppraisalDTO appraisal = new AppraisalDTO();

        /**
         * 에러시 반환
         */
        if (errors.hasErrors()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        Long userNo = authInfo.getUserNo();
        Integer userStar = appraisalService.userStar(userNo, requestStar.getIsbn());

        if(userStar == null){

            bookShelf.setUserNo(userNo);
            bookShelf.setIsbn(requestStar.getIsbn());
            bookShelf.setStatus(2);

            bookShelService.insertStatus(bookShelf);

            Long statusNo = bookShelService.selectStatusNoForStar(bookShelf);

            appraisalService.insertStar(statusNo, requestStar.getStar());

        }else if(userStar == requestStar.getStar()){

           int result =  appraisalService.deleteStar(userNo, requestStar.getIsbn(), requestStar.getStar());
            return ResponseEntity.ok(result);

        }else if(userStar != requestStar.getStar()){

            appraisal.setStar(requestStar.getStar());
            appraisal.setIsbn(requestStar.getIsbn());
            appraisal.setUserNo(userNo);

            appraisalService.updateStar(appraisal);

        }


        String starMsg = null;
        if (requestStar.getStar() == 1) {
            starMsg = "싫어요";
        } else if (requestStar.getStar() == 2) {
            starMsg = "재미없어요";
        } else if (requestStar.getStar() == 3) {
            starMsg = "보통이에요";
        } else if (requestStar.getStar() == 4) {
            starMsg = "재미있어요";
        } else if (requestStar.getStar() == 5) {
            starMsg = "최고예요!";
        }

        int star = requestStar.getStar();

        HashMap<Object, Object> map = new HashMap<>();
        map.put("starMsg", starMsg);
        map.put("star", star);

        return ResponseEntity.ok(map);
    }
}
