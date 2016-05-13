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

	/* 체크리스트 관리자 페이지 */
	@RequestMapping("/checklist.trip")
	public String checklist() {
			
		return "/admin/checklist.jsp";
	}
	
	/* 체크리스트 카테고리 관리 */
	@RequestMapping("/checklistCategory.trip")
	public ModelAndView checklistCategory() {
			
		List list = new ArrayList();
		list = sqlMap.queryForList("ch_category_select", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/admin/checklistCategory.jsp");
	
		return mv;
	}
	
	/* 체크리스트 항목 관리 */
	@RequestMapping("/checklistItem.trip")
	public ModelAndView checklistItem(int cl_num) {
		
		List list = sqlMap.queryForList("ch_item_select", cl_num);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("cl_num",cl_num);
		mv.setViewName("/admin/checklistItem.jsp");
				
		return mv;
	}
	
	/* 카테고리 검색 */
	@RequestMapping("/checklistCateSel.trip")
	public ModelAndView checklistCateSel() {
		
		List list = new ArrayList();
		list = sqlMap.queryForList("ch_category_select", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/admin/checklistCategory.jsp");
	
		return mv;
	}

	/* 카테고리 추가 */
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
	
	/* 카테고리 삭제 */
	@RequestMapping("/checklistCateDel.trip")
	public String checklistCateDel(int cl_num) {
		
		sqlMap.delete("ch_category_delete", cl_num);
		
		return "/checklistCategory.trip";
	}
	
	/* 항목 검색*/
	@RequestMapping("/checklistItemSel.trip")
	public ModelAndView checklistItemSel(ChecklistCategoryDTO dto) {
				
		List list = new ArrayList();
		list = sqlMap.queryForList("ch_item_select_innerJoin", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/admin/checklistItem.jsp");
				
		return mv;
	}
	
	/* 항목 추가 */
	@RequestMapping("/checklistItemAdd.trip")
	public String checklistItemAdd(ChecklistItemDTO dto) {
	
		sqlMap.insert("ch_item_insert", dto);
		
		return "redirect:/checklistItem.trip?cl_num="+dto.getCl_num();
	}
	
	/* 항목 삭제 */
	@RequestMapping("/checklistItemDel.trip")
	public String checklistItemDel(ChecklistItemDTO dto) {
		System.out.println(dto.getCl_num());
		System.out.println(dto.getCi_num());
		sqlMap.delete("ch_item_delete", dto);
		
		return "redirect:/checklistItem.trip?cl_num="+dto.getCl_num();
	}
	
}
