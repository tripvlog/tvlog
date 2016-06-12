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
	
	/* ******* ������ ���� ������ ���� ******* */
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
	/* ******* ������ ���� ������  ��******* */
	
	

	/* ******* üũ����Ʈ ������ ������ ���� ******* */
	/* üũ����Ʈ ī�װ� ���� */
	@RequestMapping("/admin/checklistCategory.trip")
	public ModelAndView checklistCategory() {
			
		List list = new ArrayList();
		list = sqlMap.queryForList("ch_category_select", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/admin/checklistCategory.jsp");
	
		return mv;
	}
	
	/* üũ����Ʈ �׸� ���� */
	@RequestMapping("/admin/checklistItem.trip")
	public ModelAndView checklistItem(int cl_num) {
		
		List list = sqlMap.queryForList("ch_item_select", cl_num);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("cl_num",cl_num);
		mv.setViewName("/admin/checklistItem.jsp");
				
		return mv;
	}
	
	/* ī�װ� �˻� */
	@RequestMapping("/admin/checklistCateSel.trip")
	public ModelAndView checklistCateSel() {
		
		List list = new ArrayList();
		list = sqlMap.queryForList("ch_category_select", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/admin/checklistCategory.jsp");
	
		return mv;
	}

	/* ī�װ� �߰� */
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
	
	/* ī�װ� ���� */
	@RequestMapping("/admin/checklistCateDel.trip")
	public String checklistCateDel(int cl_num) {
		
		sqlMap.delete("ch_category_delete", cl_num);
		
		return "/admin/checklistCategory.trip";
	}
	
	/* �׸� �˻�*/
	@RequestMapping("/admin/checklistItemSel.trip")
	public ModelAndView checklistItemSel(ChecklistCategoryDTO dto) {
				
		List list = new ArrayList();
		list = sqlMap.queryForList("ch_item_select_innerJoin", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/admin/checklistItem.jsp");
				
		return mv;
	}
	
	/* �׸� �߰� */
	@RequestMapping("/admin/checklistItemAdd.trip")
	public String checklistItemAdd(ChecklistItemDTO dto) {
	
		sqlMap.insert("ch_item_insert", dto);
		
		return "redirect:/admin/checklistItem.trip?cl_num="+dto.getCl_num();
	}
	
	/* �׸� ���� */
	@RequestMapping("/admin/checklistItemDel.trip")
	public String checklistItemDel(ChecklistItemDTO dto) {
		System.out.println(dto.getCl_num());
		System.out.println(dto.getCi_num());
		sqlMap.delete("ch_item_delete", dto);
		
		return "redirect:/admin/checklistItem.trip?cl_num="+dto.getCl_num();
	}
	/* ****** üũ����Ʈ ������ ������ �� ****** */
	
	
	
	/* ******* ȸ�� ������ ������ ���� ******* */
	/* ȸ�� ��ü �˻� */
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
	/* ȸ�� ���� */
	@RequestMapping("/admin/memberDeleteManagement.trip")
	public String memberDeleteManagement(String id) {
		sqlMap.delete("admin.memberDeleteList", id);
		return "redirect:/admin/memberManagement.trip";
	}
	/* ******* ȸ�� ������ ������ �� ******* */
	
	
	
	/* ******* ���� ������ ������ ����  ******* */
	/* ���� ��ü �˻� */
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
	/* ���� �ö�� ���� �˻� */
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
	/* ���� ���� */
	@RequestMapping("/admin/scheduleDeleteManagement.trip")
	public String scheduleDeleteManagement(int s_num) {
		sqlMap.delete("admin.scheduleDeleteList", s_num);
		sqlMap.delete("admin.scheduleDetailDeleteList", s_num);
		return "redirect:/admin/scheduleManagement.trip";
	}
	/* ******* ���� ������ ������ �� ******* */
	
	
	
	/* ******* �ϱ� ������ ������ ����  ******* */
	/* �ϱ� ��ü �˻� */
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
	/* ���� �ö�� �ϱ� �˻� */
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
	/* �ϱ� ���� */
	@RequestMapping("/admin/diaryDeleteManagement.trip")
	public String diaryDeleteManagement(int diary_num) {
		sqlMap.delete("admin.diaryDeleteList", diary_num);
		return "redirect:/admin/diaryManagement.trip";
	}
	/* ******* �ϱ� ������ ������ �� ******* */
	
	
	
	/* *******��� ������ ������ ���� ******* */
	/* ��� ��ü �˻� */
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
	/* ���� �ö�� ��� �˻� */
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
	/* ��� ���� */
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
	/* *******��� ������ ������ ��******* */
	
	
	
	/* ******* ����Ʈ ������ ������ ���� management ******* */
	/* ����Ʈ ��ü �˻� */
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
	/* ���� �ö�� ����Ʈ �˻� */
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
	/* ����Ʈ ���� */
	@RequestMapping("/admin/postDeleteManagement.trip")
	public String postDeleteManagement(int no) {
		sqlMap.delete("admin.postDeleteList", no);
		return "redirect:/admin/postManagement.trip";
	}
	/* *******����Ʈ ������ ������ ��******* */
}
