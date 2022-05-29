package com.yurim.www.Controller;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.dto.UserDTO;
import com.yurim.www.service.AppraisalService;
import com.yurim.www.service.BookShelService;
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
    private final BookShelService bookShelService;

    @ResponseBody
    @PostMapping("/star")
    public ResponseEntity<?> insertStar(@RequestBody RequestStar requestStar, Errors errors,
                                     HttpSession session, HttpServletResponse response) {

        BookShelfDTO bookShelf = new BookShelfDTO();
        AppraisalDTO appraisal = new AppraisalDTO();

        /**
         * 에러시 반환
         */
        if (errors.hasErrors()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        UserDTO user = userService.selectUserInfoById(requestStar.getId());

        bookShelf.setUserNo(user.getUserNo());
        bookShelf.setIsbn(requestStar.getIsbn());
        bookShelService.insertUserNoAndIsbn(bookShelf);

        bookShelf = bookShelService.selectStatusNoForStar(bookShelf);

        appraisal.setStar(requestStar.getStar());
        appraisal.setStatusNo(bookShelf.getStatusNo());
        appraisalService.insertStar(appraisal);

        String starMsg = null;
        if (appraisal.getStar() == 1) {
            starMsg = "싫어요";
        } else if (appraisal.getStar() == 2) {
            starMsg = "재미없어요";
        } else if (appraisal.getStar() == 3) {
            starMsg = "보통이에요";
        } else if (appraisal.getStar() == 4) {
            starMsg = "재미있어요";
        } else if (appraisal.getStar() == 5) {
            starMsg = "최고예요!";
        }

        int star = appraisal.getStar();

        HashMap<Object, Object> map = new HashMap<>();
        map.put("starMsg", starMsg);
        map.put("star", star);

        return ResponseEntity.ok(map);
    }
}
