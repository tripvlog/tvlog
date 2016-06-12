package trip.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AdminBean {


	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	/* ******* 관리자 메인 페이지 시작 ******* */
	@RequestMapping("/admin/adminMain.trip")
	public String adminMain(HttpServletRequest request , HttpSession session){
		int postAllCount = (Integer)sqlMap.queryForObject("admin.postAllCount", null);
		int postDayCount = (Integer)sqlMap.queryForObject("admin.postDayCount", null);
		int bandAllCount = (Integer)sqlMap.queryForObject("admin.bandAllCount", null);
		int bandDayCount = (Integer)sqlMap.queryForObject("admin.bandDayCount", null);
		int scheduleAllCount = (Integer)sqlMap.queryForObject("admin.scheduleAllCount", null);
		int scheduleDayCount = (Integer)sqlMap.queryForObject("admin.scheduleDayCount", null);
		int memberAllCount = (Integer)sqlMap.queryForObject("admin.memberAllCount", null);
		int diaryAllCount = (Integer)sqlMap.queryForObject("admin.diaryAllCount", null);
		int diaryDayCount = (Integer)sqlMap.queryForObject("admin.diaryDayCount", null);
		request.setAttribute("postAllCount", postAllCount);
		request.setAttribute("postDayCount", postDayCount);
		request.setAttribute("bandAllCount", bandAllCount);
		request.setAttribute("bandDayCount", bandDayCount);
		request.setAttribute("scheduleAllCount", scheduleAllCount);
		request.setAttribute("scheduleDayCount", scheduleDayCount);
		request.setAttribute("memberAllCount", memberAllCount);
		request.setAttribute("diaryAllCount", diaryAllCount);
		request.setAttribute("diaryDayCount", diaryDayCount);
		return "/admin/main.jsp";
	}
	/* ******* 관리자 메인 페이지  끝******* */
	
	

	/* ******* 체크리스트 관리자 페이지 시작 ******* */
	/* 체크리스트 카테고리 관리 */
	@RequestMapping("/admin/checklistCategory.trip")
	public ModelAndView checklistCategory() {
			
		List list = new ArrayList();
		list = sqlMap.queryForList("ch_category_select", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/admin/checklistCategory.jsp");
	
		return mv;
	}
	
	/* 체크리스트 항목 관리 */
	@RequestMapping("/admin/checklistItem.trip")
	public ModelAndView checklistItem(int cl_num) {
		
		List list = sqlMap.queryForList("ch_item_select", cl_num);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("cl_num",cl_num);
		mv.setViewName("/admin/checklistItem.jsp");
				
		return mv;
	}
	
	/* 카테고리 검색 */
	@RequestMapping("/admin/checklistCateSel.trip")
	public ModelAndView checklistCateSel() {
		
		List list = new ArrayList();
		list = sqlMap.queryForList("ch_category_select", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/admin/checklistCategory.jsp");
	
		return mv;
	}

	/* 카테고리 추가 */
	@RequestMapping("/admin/checklistCateAdd.trip")
	public ModelAndView checklistCateAdd(ChecklistCategoryDTO dto) {
		
		sqlMap.insert("ch_category_insert", dto);
		
		List list = new ArrayList();
		list = sqlMap.queryForList("ch_category_select", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/admin/checklistCategory.jsp");
				
		return mv;
	}
	
	/* 카테고리 삭제 */
	@RequestMapping("/admin/checklistCateDel.trip")
	public String checklistCateDel(int cl_num) {
		
		sqlMap.delete("ch_category_delete", cl_num);
		
		return "/admin/checklistCategory.trip";
	}
	
	/* 항목 검색*/
	@RequestMapping("/admin/checklistItemSel.trip")
	public ModelAndView checklistItemSel(ChecklistCategoryDTO dto) {
				
		List list = new ArrayList();
		list = sqlMap.queryForList("ch_item_select_innerJoin", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/admin/checklistItem.jsp");
				
		return mv;
	}
	
	/* 항목 추가 */
	@RequestMapping("/admin/checklistItemAdd.trip")
	public String checklistItemAdd(ChecklistItemDTO dto) {
	
		sqlMap.insert("ch_item_insert", dto);
		
		return "redirect:/admin/checklistItem.trip?cl_num="+dto.getCl_num();
	}
	
	/* 항목 삭제 */
	@RequestMapping("/admin/checklistItemDel.trip")
	public String checklistItemDel(ChecklistItemDTO dto) {
		System.out.println(dto.getCl_num());
		System.out.println(dto.getCi_num());
		sqlMap.delete("ch_item_delete", dto);
		
		return "redirect:/admin/checklistItem.trip?cl_num="+dto.getCl_num();
	}
	/* ****** 체크리스트 관리자 페이지 끝 ****** */
	
	
	
	/* ******* 회원 관리자 페이지 시작 ******* */
	/* 회원 전체 검색 */
	@RequestMapping("/admin/memberManagement.trip")
	public ModelAndView memberManagement() {
		List list = new ArrayList();
		list = sqlMap.queryForList("admin.memberSelectList", null);
		int memberAllCount = (Integer)sqlMap.queryForObject("admin.memberAllCount", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("memberAllCount", memberAllCount);
		mv.setViewName("/admin/memberManagement.jsp");
				
		return mv;
	}
	/* 회원 삭제 */
	@RequestMapping("/admin/memberDeleteManagement.trip")
	public String memberDeleteManagement(String id) {
		sqlMap.delete("admin.memberDeleteList", id);
		return "redirect:/admin/memberManagement.trip";
	}
	/* ******* 회원 관리자 페이지 끝 ******* */
	
	
	
	/* ******* 일정 관리자 페이지 시작  ******* */
	/* 일정 전체 검색 */
	@RequestMapping("/admin/scheduleManagement.trip")
	public ModelAndView scheduleManagement() {
		List list = new ArrayList();
		list = sqlMap.queryForList("admin.scheduleSelectList", null);
		int scheduleAllCount = (Integer)sqlMap.queryForObject("admin.scheduleAllCount", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("scheduleAllCount", scheduleAllCount);
		mv.setViewName("/admin/scheduleManagement.jsp");
				
		return mv;
	}
	/* 오늘 올라온 일정 검색 */
	@RequestMapping("/admin/scheduleDayManagement.trip")
	public ModelAndView scheduleDayManagement() {
		List list = new ArrayList();
		list = sqlMap.queryForList("admin.scheduleDaySelectList", null);
		int scheduleDayCount = (Integer)sqlMap.queryForObject("admin.scheduleDayCount", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("scheduleDayCount", scheduleDayCount);
		mv.setViewName("/admin/scheduleDayManagement.jsp");
				
		return mv;
	}
	/* 일정 삭제 */
	@RequestMapping("/admin/scheduleDeleteManagement.trip")
	public String scheduleDeleteManagement(int s_num) {
		sqlMap.delete("admin.scheduleDeleteList", s_num);
		sqlMap.delete("admin.scheduleDetailDeleteList", s_num);
		return "redirect:/admin/scheduleManagement.trip";
	}
	/* ******* 일정 관리자 페이지 끝 ******* */
	
	
	
	/* ******* 일기 관리자 페이지 시작  ******* */
	/* 일기 전체 검색 */
	@RequestMapping("/admin/diaryManagement.trip")
	public ModelAndView diaryManagement() {
		List list = new ArrayList();
		list = sqlMap.queryForList("admin.diarySelectList", null);
		int diaryAllCount = (Integer)sqlMap.queryForObject("admin.diaryAllCount", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("diaryAllCount", diaryAllCount);
		mv.setViewName("/admin/diaryManagement.jsp");
				
		return mv;
	}
	/* 오늘 올라온 일기 검색 */
	@RequestMapping("/admin/diaryDayManagement.trip")
	public ModelAndView diaryDayManagement() {
		List list = new ArrayList();
		list = sqlMap.queryForList("admin.diaryDaySelectList", null);
		int diaryDayCount = (Integer)sqlMap.queryForObject("admin.diaryDayCount", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("diaryDayCount", diaryDayCount);
		mv.setViewName("/admin/diaryDayManagement.jsp");
				
		return mv;
	}
	/* 일기 삭제 */
	@RequestMapping("/admin/diaryDeleteManagement.trip")
	public String diaryDeleteManagement(int diary_num) {
		sqlMap.delete("admin.diaryDeleteList", diary_num);
		return "redirect:/admin/diaryManagement.trip";
	}
	/* ******* 일기 관리자 페이지 끝 ******* */
	
	
	
	/* *******밴드 관리자 페이지 시작 ******* */
	/* 밴드 전체 검색 */
	@RequestMapping("/admin/bandManagement.trip")
	public ModelAndView bandManagement() {
		List list = new ArrayList();
		list = sqlMap.queryForList("admin.bandSelectList", null);
		int bandAllCount = (Integer)sqlMap.queryForObject("admin.bandAllCount", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("bandAllCount", bandAllCount);
		mv.setViewName("/admin/bandManagement.jsp");
				
		return mv;
	}
	/* 오늘 올라온 밴드 검색 */
	@RequestMapping("/admin/bandDayManagement.trip")
	public ModelAndView bandDayManagement() {
		List list = new ArrayList();
		list = sqlMap.queryForList("admin.bandDaySelectList", null);
		int bandDayCount = (Integer)sqlMap.queryForObject("admin.bandDayCount", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("bandDayCount", bandDayCount);
		mv.setViewName("/admin/bandDayManagement.jsp");
				
		return mv;
	}
	/* 밴드 삭제 */
	@RequestMapping("/admin/bandDeleteManagement.trip")
	public String bandDeleteManagement(int band_id) {
		sqlMap.delete("admin.bandDeleteList", band_id);
		sqlMap.delete("admin.delete_band", band_id);
		sqlMap.delete("admin.delete_band_seq", band_id);
		sqlMap.delete("admin.delete_band_comment", band_id);
		sqlMap.delete("admin.delete_band_member", band_id);
		sqlMap.delete("admin.delete_band_member_seq", band_id);
		sqlMap.delete("admin.delete_band_imgs", band_id);
		return "redirect:/admin/bandManagement.trip";
	}
	/* *******밴드 관리자 페이지 끝******* */
	
	
	
	/* ******* 포스트 관리자 페이지 시작 management ******* */
	/* 포스트 전체 검색 */
	@RequestMapping("/admin/postManagement.trip")
	public ModelAndView postManagement() {
		List list = new ArrayList();
		list = sqlMap.queryForList("admin.postSelectList", null);
		int postAllCount = (Integer)sqlMap.queryForObject("admin.postAllCount", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("postAllCount", postAllCount);
		mv.setViewName("/admin/postManagement.jsp");
				
		return mv;
	}
	/* 오늘 올라온 포스트 검색 */
	@RequestMapping("/admin/postDayManagement.trip")
	public ModelAndView postDayManagement() {
		List list = new ArrayList();
		list = sqlMap.queryForList("admin.postDaySelectList", null);
		int postDayCount = (Integer)sqlMap.queryForObject("admin.postDayCount", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("postDayCount", postDayCount);
		mv.setViewName("/admin/postDayManagement.jsp");
				
		return mv;
	}
	/* 포스트 삭제 */
	@RequestMapping("/admin/postDeleteManagement.trip")
	public String postDeleteManagement(int no) {
		sqlMap.delete("admin.postDeleteList", no);
		return "redirect:/admin/postManagement.trip";
	}
	/* *******포스트 관리자 페이지 끝******* */
}
