package com.yurim.www.Controller;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.dto.UserDTO;
import com.yurim.www.service.AppraisalService;
import com.yurim.www.service.BookShelService;
import com.yurim.www.service.UserService;
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
    private final UserService userService;

    @ResponseBody
    @PostMapping("/insertOrUpdate")
    public ResponseEntity insertStatus(@RequestBody RequestStatus requestStatus, Errors errors,
                                     HttpSession session, HttpServletResponse response) {

        BookShelfDTO bookShelf = new BookShelfDTO();

        /**
         * 에러시 반환
         */
        if (errors.hasErrors()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");
        Long userNo = authInfo.getUserNo();

        bookShelf.setUserNo(userNo);
        bookShelf.setIsbn(requestStatus.getIsbn());
        bookShelf.setStatus(requestStatus.getStatus());

        Integer result = bookShelService.selectStatus(requestStatus.getIsbn(), userNo);

        if(result == null){
            bookShelService.insertStatus(bookShelf);
        }else if(result != null){
            bookShelService.updateStatus(bookShelf);
        }
        return ResponseEntity.ok(requestStatus.getStatus());
    }

    @ResponseBody
    @PostMapping("/delete")
    public ResponseEntity deleteStatus(@RequestBody RequestStatus requestStatus, Errors errors,
                                     HttpSession session, HttpServletResponse response) {

        BookShelfDTO bookShelf = new BookShelfDTO();
/**
 * 에러시 반환
 */
        if (errors.hasErrors()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        UserDTO authInfo = null;
        authInfo = (UserDTO) session.getAttribute("authInfo");
        Long userNo = authInfo.getUserNo();

        bookShelf.setUserNo(userNo);
        bookShelf.setIsbn(requestStatus.getIsbn());
        bookShelf.setStatus(requestStatus.getStatus());
        bookShelService.deleteStatus(bookShelf);

        return ResponseEntity.ok(2);
    }
}
