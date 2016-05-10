package trip.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChecklistBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;

	/* üũ����Ʈ ������ ������ */
	@RequestMapping("/checklist.trip")
	public String checklist() {
			
		return "/admin/checklist.jsp";
	}
	
	/* üũ����Ʈ ī�װ� ���� */
	@RequestMapping("/checklistCategory.trip")
	public ModelAndView checklistCategory() {
			
		List list = new ArrayList();
		list = sqlMap.queryForList("ch_category_select", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/admin/checklistCategory.jsp");
	
		return mv;
	}
	
	/* üũ����Ʈ �׸� ���� */
	@RequestMapping("/checklistItem.trip")
	public ModelAndView checklistItem() {
			
		sqlMap.queryForObject("ch_item_select_innerJoin", null);
		
		List list = new ArrayList();
		list = sqlMap.queryForList("ch_item_select", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/admin/checklistItem.jsp");
				
		return mv;
	}
	
	/* ī�װ� �˻� */
	@RequestMapping("/checklistCateSel.trip")
	public ModelAndView checklistCateSel() {
		
		List list = new ArrayList();
		list = sqlMap.queryForList("ch_category_select", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/admin/checklistCategory.jsp");
	
		return mv;
	}

	/* ī�װ� �߰� */
	@RequestMapping("/checklistCateAdd.trip")
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
	@RequestMapping("/checklistCateDel.trip")
	public ModelAndView checklistCateDel(String cl_name) {
		
		sqlMap.delete("ch_category_delete", cl_name);
		
		List list = new ArrayList();
		list = sqlMap.queryForList("ch_category_select", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/admin/checklistCategory.jsp");
				
		return mv;
	}
	
	/* �׸� �˻�*/
	@RequestMapping("/checklistItemSel.trip")
	public ModelAndView checklistItemSel(ChecklistCategoryDTO dto) {
				
		List list = new ArrayList();
		list = sqlMap.queryForList("ch_item_select", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/admin/checklistItem.jsp");
				
		return mv;
	}
	
	/* �׸� �߰� */
	@RequestMapping("/checklistItemAdd.trip")
	public ModelAndView checklistItemAdd(ChecklistCategoryDTO dto) {
	
		sqlMap.insert("ch_item_insert", dto);
		
		List list = new ArrayList();
		list = sqlMap.queryForList("ch_item_select", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/admin/checklistItem.jsp");
				
		return mv;
	}
	
	/* �׸� ���� */
	@RequestMapping("/checklistItemDel.trip")
	public ModelAndView checklistItemDel(String ci_name) {
		
		sqlMap.delete("ch_item_delete", ci_name);
		
		List list = new ArrayList();
		list = sqlMap.queryForList("ch_item_select", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/admin/checklistItem.jsp");
				
		return mv;
	}
	
}
