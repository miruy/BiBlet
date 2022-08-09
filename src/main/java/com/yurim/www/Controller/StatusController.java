package com.yurim.www.Controller;

import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.dto.UserDTO;
import com.yurim.www.service.BookShelfService;
import com.yurim.www.service.UserService;
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
    private final BookShelfService bookShelService;

    //독서상태(읽고싶어요, 읽는중) 등록
    @ResponseBody
    @PostMapping("/insertOrUpdate")
    public ResponseEntity insertStatus(@RequestBody RequestStatus requestStatus, Errors errors, HttpSession session) {
        BookShelfDTO bookShelf = new BookShelfDTO();

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
        }else if(result != requestStatus.getStatus()){
            bookShelf.setBeforeStatus(result);
            bookShelService.updateStatus(bookShelf);
        }
        return ResponseEntity.ok(requestStatus.getStatus());
    }

    //독서상태 삭제
    @ResponseBody
    @PostMapping("/delete")
    public ResponseEntity deleteStatus(@RequestBody RequestStatus requestStatus, Errors errors, HttpSession session) {

        BookShelfDTO bookShelf = new BookShelfDTO();

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
