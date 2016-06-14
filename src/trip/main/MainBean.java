package trip.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import trip.post.boardVO;
import trip.post.pagingAction;

@Controller
public class MainBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/main/main.trip")
	public String main(HttpServletRequest request){
		List postList = sqlMap.queryForList("post.mainList", null);
		List bandList = sqlMap.queryForList("main_band", null);
		List location = sqlMap.queryForList("diary_cluster", null);
		request.setAttribute("postList", postList);
		request.setAttribute("bandList", bandList);
 		request.setAttribute("location", location);
		
		return "/main/main.jsp";
	}
	
	// 여행 일정 찾기
	@RequestMapping("/main/findSchedule.trip")
	public String findSchedule(HttpServletRequest request, HttpSession session){
		List scheduleList = null;
		scheduleList = sqlMap.queryForList("schedule.scheduleRangeList", null);
		request.setAttribute("scheduleCount", scheduleList.size());
		request.setAttribute("scheduleList", scheduleList);
		return "/main/findSchedule.jsp";
	}
	
	// 명소 찾기
	@RequestMapping("/main/findPlace.trip")
	public String findPlace(HttpServletRequest request){
		List scheduleList = sqlMap.queryForList("schedule.schedulePlace",null);
		request.setAttribute("scheduleList", scheduleList);
		request.setAttribute("count", scheduleList.size());
		return "/main/findPlace.jsp";
	}
	
	// 커뮤니티
	@RequestMapping("/main/community.trip")
	public ModelAndView community(HttpServletRequest request, boardVO dto, HttpSession session){
		String id = (String)session.getAttribute("memId");
		
		List diary_select_1range = new ArrayList(); 
		diary_select_1range = sqlMap.queryForList("diary_select_1range", null);     
		int myDiaryListCount = (Integer)sqlMap.queryForObject("myDiaryListCount", id);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("myDiaryListCount", diary_select_1range.size());
		mv.addObject("diary_select_1range", diary_select_1range);
		mv.setViewName("/main/community.jsp");
		return mv;
	}	
	
	@RequestMapping("/diary/myDiaryDelete.trip")
	public String delete(HttpServletRequest request){
		int diary_num = Integer.parseInt(request.getParameter("num"));
		sqlMap.delete("diary_delete", diary_num);
		return "/member/myDiary.trip";
	}
}
