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

	@RequestMapping("/checklistCateSel.trip")
	public ModelAndView checklistCateSel() {
		
		List list = new ArrayList();
		list = sqlMap.queryForList("ch_category_select", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/admin/check.trip");
	
		return mv;
	}
	
	@RequestMapping("/checklistCateAdd.trip")
	public String checklistCateAdd(ChecklistCategoryDTO dto) {
		sqlMap.insert("ch_category_insert", dto);
		return "/admin/checklist.trip";
	}
	
	@RequestMapping("/checklistCateDel.trip")
	public String checklistCateDel(ChecklistCategoryDTO dto, HttpServletRequest request){
		sqlMap.delete("ch_category_delete", dto.getCl_num());
		return "/admin/checklist.trip";
	}
	
	@RequestMapping("/checklistItemSel.trip")
	public ModelAndView checklistItemSel() {
		
		List list = new ArrayList();
		list = sqlMap.queryForList("ch_item_select", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/admin/checklist.trip");
	
		return mv;
	}
	
	@RequestMapping("/checklistItemAdd.trip")
	public String checklistItemAdd(ChecklistItemDTO dto) {
		//sqlMap.insert("ch_item_insert", dto);
		return "/admin/checklist.trip";
	}
	
	@RequestMapping("/checklistItemDel.trip")
	public String checklistItemDel(ChecklistItemDTO dto) {
		sqlMap.delete("ch_item_delete", dto.getCi_num());
		return "/admin/checklist.trip";
	}
}
