package com.yurim.www.Controller;

import com.yurim.www.dto.AppraisalDTO;
import com.yurim.www.dto.UserDTO;
import com.yurim.www.service.AdministratorService;
import com.yurim.www.service.UserService;
import com.yurim.www.vo.RequestAdmSearch;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdministratorController {

    private final AdministratorService administratorService;
    private final UserService userService;

    @GetMapping("/supervise_user")
    public String userManagement(Model model) {

        // 회원 관리 탭
        model.addAttribute("users", administratorService.allUserInfo());
        model.addAttribute("totalUsers", administratorService.totalUser());

        return "admin/supervise_user";
    }

    @PostMapping("/supervise_user")
    public String userSearch(@ModelAttribute("requestAdmSearch") RequestAdmSearch requestAdmSearch, Model model) {

        UserDTO searchUser = new UserDTO();

        if (requestAdmSearch.getOption() == null) {
            searchUser.setOption("선택");
            searchUser.setKeyword(requestAdmSearch.getKeyword());
        } else {
            searchUser.setOption(requestAdmSearch.getOption());
            searchUser.setKeyword(requestAdmSearch.getKeyword());
        }

        model.addAttribute("searchList", administratorService.selectUserBySearchValue(searchUser));
        model.addAttribute("searchUserCount", administratorService.totalCountBySearchValue(searchUser));

        return "admin/search_user";

    }

    @GetMapping("/supervise_appraisal")
    public String starManagement(Model model) {

        // 평가 관리 탭
        model.addAttribute("stars", administratorService.allStarInfo());
        model.addAttribute("totalStar", administratorService.totalStar());

        return "admin/supervise_appraisal";
    }


    @PostMapping("/supervise_appraisal")
    public String starSearch(@ModelAttribute("requestAdmSearch") RequestAdmSearch requestAdmSearch, Model model) {

        AppraisalDTO appraisal = new AppraisalDTO();

        if(requestAdmSearch.getReturnIsbn().equals("")){
            if (requestAdmSearch.getOption() == null) {
                appraisal.setOption("선택");
                appraisal.setKeyword(requestAdmSearch.getKeyword());
            } else {
                appraisal.setOption(requestAdmSearch.getOption());
                appraisal.setKeyword(requestAdmSearch.getKeyword());
            }
        }else if(!requestAdmSearch.getReturnIsbn().equals("")) {
            appraisal.setOption("kakao");
            appraisal.setKeyword(requestAdmSearch.getReturnIsbn());
        }

        model.addAttribute("searchStarList", administratorService.selectStarBySearchValue(appraisal));
        model.addAttribute("searchStarCount", administratorService.totalStarCountBySearchValue(appraisal));

        return "admin/search_appraisal";

    }

    @GetMapping("/supervise_comment")
    public String commentManagement(Model model) {

        // 코멘트 관리 탭
        model.addAttribute("comments", administratorService.allCommentInfo());
        model.addAttribute("totalComment", administratorService.totalComment());

        return "admin/supervise_comment";
    }

    @PostMapping("/supervise_comment")
    public String commentSearch(@ModelAttribute("requestAdmSearch") RequestAdmSearch requestAdmSearch, Model model) {

        AppraisalDTO appraisal = new AppraisalDTO();

        if(requestAdmSearch.getReturnIsbn().equals("")){
            if (requestAdmSearch.getOption() == null) {
                appraisal.setOption("선택");
                appraisal.setKeyword(requestAdmSearch.getKeyword());
            } else {
                appraisal.setOption(requestAdmSearch.getOption());
                appraisal.setKeyword(requestAdmSearch.getKeyword());
            }
        }else if(!requestAdmSearch.getReturnIsbn().equals("")) {
            appraisal.setOption("kakao");
            appraisal.setKeyword(requestAdmSearch.getReturnIsbn());
        }

        model.addAttribute("searchCommentList", administratorService.selectCommentBySearchValue(appraisal));
        model.addAttribute("searchCommentCount", administratorService.totalCommentCountBySearchValue(appraisal));

        return "admin/search_comment";

    }

//    @ResponseBody
//    @PostMapping("/returnIsbnForStarManagement")
//    private String returnIsbnForStarManagement(@RequestParam String isbn, Model model) {
//        System.out.println("returnIsbnForStarManagement : " + isbn);
////        model.addAttribute("isbnt", isbn);
//
//        return "admin/search_2";
//    }


//    @ResponseBody
//    @PostMapping(value = "/adminSearch", produces = "application/json; charset=UTF-8")
//    private String adminSearch(@RequestBody RequestAdmSearch requestAdmSearch, Errors errors,
//                                    HttpSession session, HttpServletResponse response, Model model) throws ParseException {
//
//        UserDTO searchUser = new UserDTO();
//        JSONObject jo = new JSONObject();
//        JSONArray ja = new JSONArray();
//
//        searchUser.setOption(requestAdmSearch.getOption());
//        searchUser.setKeyword(requestAdmSearch.getKeyword());
//
//        List<UserDTO> searchList = administratorService.selectUserBySearchValue(searchUser);
//
//        for (int i = 0; i < searchList.size(); i++) {
//
//            JSONObject jso = new JSONObject();
//
//            jso.put("userNo", searchList.get(i).getUserNo());
//            jso.put("name", searchList.get(i).getName());
//            jso.put("profile", searchList.get(i).getStoredPic());
//            jso.put("id", searchList.get(i).getId());
//            jso.put("pass", searchList.get(i).getPass());
//            jso.put("email", searchList.get(i).getEmail());
//
//            String regDate = searchList.get(i).getRegDate().format(DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss"));
//
//			jso.put("regDate", regDate);
//            jso.put("authStatus", searchList.get(i).getAuthStatus());
//            jso.put("option", searchUser.getOption());
//
//            ja.add(jso);
//
//        }
//
//        jo.put("item", ja);
//
//        return jo.toString();
//    }
//
//    @PostMapping(value = "/searchReturn", produces = "application/json; charset=UTF-8")
//    public String searchReturn(@RequestBody RequestSignup requestSignup, HttpSession session, HttpServletResponse response, Model model){
//        System.out.println("searchReturn : " + requestSignup.getUserNo());
//
//       UserDTO searchReturn = userService.selectUserInfoByUserNo(requestSignup.getUserNo());
//
//        model.addAttribute("searchReturn", requestSignup.getUserNo());
//        return "admin/supervise";
//    }

//	@ResponseBody
//	@PostMapping("/admin_search")
//	public String adminSearch(@RequestBody RequestAdmSearchValue requestAdmSearchValue, HttpServletResponse response, Model model) throws Exception {
//
//		System.out.println("여기는 어드민 검색 창");
//		System.out.println(requestAdmSearchValue.getSearchValue());

//		//회원검색
//		List<MemberVO> searchList = admPageService.searchMember(member);
//		model.addAttribute("searchList", searchList);
//
//		int memcount = admPageService.countMember();
//		model.addAttribute("memcount", memcount);
//
//		//평가 정보 전달
//		List<CommandListAppr> apprList = admPageService.listOfAppraisal();
//		model.addAttribute("apprList", apprList);
//
//		int starcount = admPageService.countStar();
//		model.addAttribute("starcount", starcount);

//		return "admin/supervise";
//	}

//	@ResponseBody
//	@PostMapping(value = "/commentPage", produces = "application/json; charset=UTF-8")
//	public String searchAdmInfo(@RequestBody CommandListAppr appr) {
//		//System.out.println("0:"+appr.getCoKeyword());
//		if("".equals(appr.getCoOption())||appr.getCoOption()==null) {
//			//System.out.println("1:"+appr.getCoKeyword());
//			appr.setCoOption("mem_id");
//			appr.setCoKeyword(null);
//			List<CommandListAppr> searchApprList=admPageService.searchComments(appr);
//
//			JSONObject jo=new JSONObject();
//
//			JSONArray ja=new JSONArray();
//			for (int i=0;i<searchApprList.size();i++) {
//				JSONObject jso=new JSONObject();
//				jso.put("bookcomment",searchApprList.get(i).getBook_comment());
//				jso.put("isbn", searchApprList.get(i).getIsbn());
//				jso.put("mem_id", searchApprList.get(i).getMem_id());
//				jso.put("appraisal_num",searchApprList.get(i).getAppraisal_num());
//				ja.put(jso);
//			}
//			jo.put("item",ja);
//			return jo.toString();
//		}else {
//		List<CommandListAppr> searchApprList=admPageService.searchComments(appr);
//
//		JSONObject jo=new JSONObject();
//
//		JSONArray ja=new JSONArray();
//		for (int i=0;i<searchApprList.size();i++) {
//			JSONObject jso=new JSONObject();
//			jso.put("bookcomment",searchApprList.get(i).getBook_comment());
//			jso.put("isbn", searchApprList.get(i).getIsbn());
//			jso.put("mem_id", searchApprList.get(i).getMem_id());
//			jso.put("appraisal_num",searchApprList.get(i).getAppraisal_num());
//			ja.put(jso);
//		}
//		jo.put("item",ja);
//
//
//		return jo.toString();
//
//		}
//
//	}
//
//	@ResponseBody
//	@PostMapping(value = "/admInfoPage", produces = "application/json; charset=UTF-8")
//	public String searchComment(@RequestBody AdministratorVO admin) {
//
//		if ("".equals(admin.getAdmOption()) || admin.getAdmOption() == null) {
//			admin.setAdmOption("adm_num");
//			admin.setAdmKeyword(null);
//
//			List<AdministratorVO> searchAdmList = admPageService.searchAdmin(admin);
//
//			JSONObject jo=new JSONObject();
//
//			JSONArray ja=new JSONArray();
//			for (int i=0;i<searchAdmList.size();i++) {
//				JSONObject jso=new JSONObject();
//				jso.put("adm_num",searchAdmList.get(i).getAdm_num());
//				jso.put("adm_name", searchAdmList.get(i).getAdm_name());
//				jso.put("adm_id", searchAdmList.get(i).getAdm_id());
//				jso.put("adm_regdate",searchAdmList.get(i).getAdm_regdate());
//				jso.put("adm_email",searchAdmList.get(i).getAdm_email());
//				jso.put("adm_authstatus",searchAdmList.get(i).getAdm_authstatus());
//				ja.put(jso);
//			}
//			jo.put("item",ja);
//			return jo.toString();
//		}else {
//			List<AdministratorVO> searchAdmList = admPageService.searchAdmin(admin);
//
//			JSONObject jo=new JSONObject();
//
//			JSONArray ja=new JSONArray();
//			for (int i=0;i<searchAdmList.size();i++) {
//				JSONObject jso=new JSONObject();
//				jso.put("adm_num",searchAdmList.get(i).getAdm_num());
//				jso.put("adm_name", searchAdmList.get(i).getAdm_name());
//				jso.put("adm_id", searchAdmList.get(i).getAdm_id());
//				jso.put("adm_regdate",searchAdmList.get(i).getAdm_regdate());
//				jso.put("adm_email",searchAdmList.get(i).getAdm_email());
//				jso.put("adm_authstatus",searchAdmList.get(i).getAdm_authstatus());
//				ja.put(jso);
//			}
//			jo.put("item",ja);
//			return jo.toString();
//		}
//
//	}
//
//
//
//	@GetMapping("/adminPage/deleteMember/{mem_num}")
//	public String delete(@PathVariable int mem_num, Model model) {
//		model.addAttribute("mem_num", mem_num);
//		return "admin/deleteMember";
//	}
//
//	@GetMapping("/adminPage/deleteComment/{appraisal_num}")
//	public String deleteComment(@PathVariable int appraisal_num,Model model) {
//		model.addAttribute("appraisal_num",appraisal_num);
//		return "admin/deleteComment";
//	}
//
//	@PostMapping(value = "/adminpage/deleteMember")
//	public String delete(Long mem_num, String adm_pass, String adm_email, Model model) {
//		int rowCount;
//		MemberVO member = new MemberVO();
//		member.setMem_num(mem_num);
//		AdministratorVO admin = new AdministratorVO();
//		admin.setAdm_email(adm_email);
//		admin.setAdm_pass(adm_pass);
//
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("MEM_NUM", member.getMem_num());// sqlmapper에 이름과 map의 key값이 같아야함
//		map.put("ADM_EMAIL", admin.getAdm_email());
//		map.put("ADM_PASS", admin.getAdm_pass());
//
//
//		rowCount = admPageService.delete(map);
//
//		if (rowCount == 0) {
//			model.addAttribute("mem_num", mem_num);
//			model.addAttribute("msg", "관리자 비밀번호가 일치하지 않습니다.");
//			return "/deleteMember";
//		} else {
//			return "redirect:/adminPage";
//		}
//	}
//
//
//	@PostMapping("/adminpage/deleteComment")
//	public String deleteComment(int appraisal_num, String adm_pass, String adm_email, Model model) {
//		int rowCount;
//		CommandListAppr appr= new CommandListAppr();
//		appr.setAppraisal_num(appraisal_num);
//		AdministratorVO admin = new AdministratorVO();
//		admin.setAdm_email(adm_email);
//		admin.setAdm_pass(adm_pass);
//
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("APPRAISAL_NUM", appr.getAppraisal_num());// sqlmapper에 이름과 map의 key값이 같아야함
//		map.put("ADM_EMAIL", admin.getAdm_email());
//		map.put("ADM_PASS", admin.getAdm_pass());
//
//
//		rowCount = admPageService.deleteComment(map);
//
//		if (rowCount == 0) {
//			model.addAttribute("appraisal_num", appraisal_num);
//			model.addAttribute("msg", "관리자 비밀번호가 일치하지 않습니다.");
//			return "/deleteComment";
//		} else {
//			return "redirect:/adminPage";
//		}
//	}
}
