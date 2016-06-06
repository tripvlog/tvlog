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

import trip.member.LoginDTO;

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
	/* üũ����Ʈ ������ ������ */
	@RequestMapping("/admin/checklist.trip")
	public String checklist() {
			
		return "/admin/checklist.jsp";
	}
	
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
	/* ******* ȸ�� ������ ������ �� ******* */
	
	
	
	/* ******* ���� ������ ������ ����  ******* */
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
	/* ******* ���� ������ ������ �� ******* */
	
	
	
	/* ******* �ϱ� ������ ������ ����  ******* */
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
	/* ******* �ϱ� ������ ������ �� ******* */
	
	
	
	/* *******��� ������ ������ ���� ******* */
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
	/* *******��� ������ ������ ��******* */
	
	
	
	/* ******* ����Ʈ ������ ������ ���� management ******* */
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
	/* *******����Ʈ ������ ������ ��******* */
}
