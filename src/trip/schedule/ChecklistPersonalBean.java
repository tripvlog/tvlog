package trip.schedule;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChecklistPersonalBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/checklistPersonal.trip")
	public ModelAndView checklist() {
		
		List list = new ArrayList();
		list = sqlMap.queryForList("ch_select", null);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/schedule/leftGroup/checklist.jsp");
	
		return mv;
	}
	
	

}
