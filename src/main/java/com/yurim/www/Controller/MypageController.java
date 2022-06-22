package com.yurim.www.Controller;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.BookShelfDTO;
import com.yurim.www.dto.UserDTO;
import com.yurim.www.service.BookShelfService;
import com.yurim.www.service.MainService;
import com.yurim.www.service.MypageService;
import com.yurim.www.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor // @Autowried
public class MypageController {

	private final UserService userService;
	private final MainService mainService;
	private final MypageService mypageService;

	/**
	 * 회원 정보 조회
	 */
	@GetMapping("/mypage")
	public String memberInfo(Model model, HttpSession session, HttpServletResponse response) {
		BookShelfDTO bookShelf = new BookShelfDTO();

		// 회원 정보 불러오기
		UserDTO authInfo = null;
		authInfo = (UserDTO) session.getAttribute("authInfo");

		// 마이페이지에 보여주기
		if (authInfo != null) {

			Long userNo = authInfo.getUserNo();

			String id = authInfo.getId();
			UserDTO user = userService.selectUserInfoById(id);

			// 프로필, id
			if(user.getStoredPic() == null){
				model.addAttribute("profile", user.getOriginPic());
			}else{
				model.addAttribute("profile", user.getStoredPic());
			}

			if(user.getId().substring(0,5).equals("kakao")){
				model.addAttribute("id", user.getName());
			}else{
				model.addAttribute("id", user.getId());
			}

			// 나의 코멘트
			model.addAttribute("myComments", mypageService.myCommentForMypage(userNo));

			// 나의 평가
			model.addAttribute("myEvaluateList", mypageService.myEvaluateList(userNo));


			// 읽고싶어요, 읽는 중, footer
			model.addAttribute("wantReadList", mainService.wantReadList(userNo));
			model.addAttribute("readingList", mainService.readingList(userNo));
			model.addAttribute("totalCommentCount", mainService.totalCommentCount());


		}


		return "mypage";
	}

//	/**
//	 * 회원 정보 수정 폼
//	 */
//	@GetMapping("/edit")
//	public String infoUpdateForm(CommandLogin loginMember, Model model, HttpSession session,
//			HttpServletResponse response, Errors errors) {
//
//		/**
//		 * 에러시 반환
//		 */
//		if (errors.hasErrors()) {
//			return "user/Mypage";
//		}
//
//		/**
//		 * session에서 데이터를 꺼내 MemberVO객체에 저장
//		 */
//		MemberVO authInfo = null;
//		if (session != null) {
//			session.getAttribute("authInfo");
//		}
//
//		authInfo = (MemberVO) session.getAttribute("authInfo");
//
//		/**
//		 * Long mem_num으로 변환
//		 */
//		Long mem_num = authInfo.getMem_num();
//
//		/**
//		 * 세션 테이블에 다시 저장
//		 */
//		session.setAttribute("authInfo", authInfo);
//
//		MemberVO member = mypageService.memberInfo(mem_num);
//		model.addAttribute("myInfo", member);
//		return "user/infoUpdate";
//	}
//
//	/**
//	 * 회원 정보 수정
//	 */
//	@PostMapping("/infoUpdate")
//	public String infoUpdate(@ModelAttribute("memInfoCmd") MemInfoUpdateCmd memInfoUpdateCmd,
//			HttpServletRequest request, Model model) throws IllegalStateException, IOException {
//
//		MultipartFile multipartFile = memInfoUpdateCmd.getFile();
//
//		System.out.println(memInfoUpdateCmd.getMem_name());
//		System.out.println(memInfoUpdateCmd.getMem_id());
//		System.out.println(memInfoUpdateCmd.getMem_pass());
//		System.out.println(memInfoUpdateCmd.getFile().getOriginalFilename());
//		mypageService.updateMemInfo(memInfoUpdateCmd, multipartFile, request);
//
//		MemberVO profile = mypageService.memberInfo(memInfoUpdateCmd.getMem_num());
//
//		model.addAttribute("profile", profile);
//
//		return "redirect:/MyPage";
//	}
//
//	/**
//	 * 탈퇴 폼
//	 */
//	@GetMapping("/delete")
//	public String infoDeleteForm(CommandLogin loginMember, Model model, HttpSession session,
//			HttpServletResponse response, Errors errors) {
//
//		/**
//		 * 에러시 반환
//		 */
//		if (errors.hasErrors()) {
//			return "user/Mypage";
//		}
//
//		/**
//		 * session에서 데이터를 꺼내 MemberVO객체에 저장
//		 */
//		MemberVO authInfo = null;
//		if (session != null) {
//			session.getAttribute("authInfo");
//		}
//
//		authInfo = (MemberVO) session.getAttribute("authInfo");
//
//		/**
//		 * Long mem_num으로 변환
//		 */
//		Long mem_num = authInfo.getMem_num();
//
//		/**
//		 * 세션 테이블에 다시 저장
//		 */
//		session.setAttribute("authInfo", authInfo);
//
//		MemberVO member = mypageService.memberInfo(mem_num);
//		model.addAttribute("myInfo", member);
//		return "user/infoDelete";
//	}
//
//	/**
//	 * 탈퇴
//	 */
//	@ResponseBody
//	@PostMapping("/infoDelete")
//	public void infoDelete(@RequestBody MemInfoUpdateCmd memInfoUpdateCmd) {
//
//		mypageService.deleteMemInfo(memInfoUpdateCmd.getMem_num());
//	}
//
//	/**
//	 * 비밀번호 확인
//	 */
//	@ResponseBody
//	@PostMapping("/infoUpdatePassCheck")
//	public int PassCheck(@RequestBody PassCheckCmd passCheckCmd, HttpSession session) {
//		MemberVO authInfo = (MemberVO) session.getAttribute("authInfo");
//		if (authInfo.getMem_pass().equals(passCheckCmd.getPassCheck())) {
//			return 1;
//		} else {
//			return 0;
//		}
//	}
//
//	/**
//	 * 보관함
//	 */
//	@GetMapping("/bookShelf")
//	public String BookShelf(CommandLogin loginMember, Model model, HttpSession session, HttpServletResponse response,
//			Errors errors) {
//
//		/**
//		 * 에러시 반환
//		 */
//		if (errors.hasErrors()) {
//			return "main";
//		}
//
//		/**
//		 * session에서 데이터를 꺼내 MemberVO객체에 저장
//		 */
//		MemberVO authInfo = null;
//		if (session != null) {
//			session.getAttribute("authInfo");
//		}
//
//		authInfo = (MemberVO) session.getAttribute("authInfo");
//
//		/**
//		 * Long mem_num으로 변환
//		 */
//		Long mem_num = authInfo.getMem_num();
//
//		/**
//		 * 세션 테이블에 다시 저장
//		 */
//		session.setAttribute("authInfo", authInfo);
//
//		// 한 회원의 '찜' 도서 개수
//		int memLikeCount = mypageService.memLikeCount(mem_num);
//		// 한 회원의 '찜' 도서 isbn 검색
//		List<String> likeIsbn = mypageService.likeIsbn(mem_num);
//
//		// 한 회원의 '보는 중' 도서 개수
//		int memLeadingCount = mypageService.memLeadingCount(mem_num);
//		// 한 회원의 '보는 중' 도서 isbn 검색
//		List<String> leadingIsbn = mypageService.leadingIsbn(mem_num);
//
//		// 한 회원의 '독서 완료' 도서개수
//		int memCommentCount = mypageService.memCommentCount(mem_num);
//		// 한 회원의 '독서 완료' 도서 isbn,평가번호 검색
//		List<CompleteCmd> completeIsbn = mypageService.completeIsbn(mem_num);
//
//		// 한 회원이 작성한 모든 평가 불러오기
//		List<AllCommentCmd> memComment = mypageService.selectMemComment(mem_num);
//
//		model.addAttribute("MyLikeCount", memLikeCount);
//		model.addAttribute("likeIsbn", likeIsbn);
//
//		model.addAttribute("MyLeadingCount", memLeadingCount);
//		model.addAttribute("leadingIsbn", leadingIsbn);
//
//		model.addAttribute("MyCommentCount", memCommentCount);
//		model.addAttribute("MyComment", memComment);
//		model.addAttribute("completeIsbn", completeIsbn);
//
//		return "user/bookShelf";
//	}
}
