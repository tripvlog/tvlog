package trip.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String findSchedule(){
		return "/main/findSchedule.jsp";
	}
	
	// 명소 찾기
	@RequestMapping("/main/findPlace.trip")
	public String findPlace(){
		return "/main/findPlace.jsp";
	}
	
	// 커뮤니티
	@RequestMapping("/main/community.trip")
	public String community(){
		return "/main/community.jsp";
	}	
}
