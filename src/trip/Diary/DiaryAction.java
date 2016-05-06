package trip.Diary;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DiaryAction {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("diary.trip")
	public String diaryForm(){
		
		return "/diary/form.jsp";
	}
	
	
	@RequestMapping("diaryPro.trip")
	public String diaryPro(HttpServletRequest request){
		
		System.out.println(" ==================== diaryPro start ======================= ");
		System.out.println(request.getParameter("d_title") + " is title value");
		System.out.println(request.getParameter("d_content") + " is content value");
		System.out.println(" ==================== diaryPro end ======================= ");
		return "redirect:diary.trip";
	}
	
	@RequestMapping("map.trip")
	public String map(){ return "/diary/map.jsp"; }
	
}
