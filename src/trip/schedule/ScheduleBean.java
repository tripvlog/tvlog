package trip.schedule;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//schedule
@Controller
public class ScheduleBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/schedule/index.trip")
	public String index(){
		return "/schedule/index.jsp";
	}

	@RequestMapping("/schedule/schedule-detail.trip")
	public String detail(HttpServletRequest request,ScheduleDTO dto){
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		//dto.setS_writer(id);   //로그인 연결후 사용 
		dto.setS_writer("guest");
		
		sqlMap.insert("schedule.scheduleInsert", dto);
		
		request.setAttribute("dto", dto);
		
		return "/schedule/schedule-detail.jsp";
	}

}





