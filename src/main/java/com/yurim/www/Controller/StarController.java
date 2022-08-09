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
    private final BookShelfService bookShelService;

    //평점(별점) 등록
    @ResponseBody
    @PostMapping("/star")
    public ResponseEntity<?> updateStar(@RequestBody RequestStar requestStar, Errors errors, HttpSession session, HttpServletResponse response) {

        BookShelfDTO bookShelf = new BookShelfDTO();
        AppraisalDTO appraisal = new AppraisalDTO();

        if (errors.hasErrors()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");

        Long userNo = authInfo.getUserNo();
        Integer userStar = appraisalService.userStar(userNo, requestStar.getIsbn());
        Integer userStatus = bookShelService.userStatus(userNo, requestStar.getIsbn());

        //별점 및 독서상태가 미등록 또는 별점 없이 독서상태만 작성된 상태
        if (userStatus == null || userStatus == 0 || userStatus == 1) {
            //insert
            bookShelf.setUserNo(userNo);
            bookShelf.setIsbn(requestStar.getIsbn());
            bookShelf.setStatus(2);

            bookShelService.insertStatus(bookShelf);

            Long statusNo = bookShelService.selectStatusNoForStar(bookShelf);

            appraisalService.insertStar(statusNo, requestStar.getStar(), userNo, requestStar.getIsbn());
        }

        //별점 없이 코멘트만 작성된 상태
        else if (userStatus == 2) {
            //update
            if (userStar == null || userStar != requestStar.getStar()) {

                appraisal.setStar(requestStar.getStar());
                appraisal.setIsbn(requestStar.getIsbn());
                appraisal.setUserNo(userNo);

                appraisalService.updateStar(appraisal);
            }

            //delete(별 점수만 지워야됨)
            if (userStar == requestStar.getStar()) {
                appraisalService.deleteStar(userNo, requestStar.getIsbn(), requestStar.getStar());
                return ResponseEntity.ok(1);
            }
        }

        //별점 상태 문구
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