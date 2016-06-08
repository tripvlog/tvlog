package trip.schedule;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

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

	@RequestMapping("/schedule/schedule-new.trip")
	public String detail(HttpServletRequest request,ScheduleDTO dto){
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		dto.setS_writer(id); 
		sqlMap.insert("schedule.scheduleInsert", dto);
		dto = (ScheduleDTO)sqlMap.queryForObject("schedule.scheduleMax", null);
		if(dto.getS_startday() != null){
			dto.setS_startday(dto.getS_startday().split(" ")[0]);
		}
		request.setAttribute("dto", dto);
		return "/schedule/schedule-update.jsp";
	}
	
	//----- 상세일정 등록 부분 ( 교통)
	@RequestMapping("/schedule/schedule-detail-transport.trip")
	public String transport(HttpServletRequest request,ScheduleDetailDTO dto){
		sqlMap.insert("schedule.scheduleDetailInsert", dto);
		
		request.setAttribute("dto",dto);
		return "/schedule/schedule-detail-transport.jsp";
	}
	//----- 상세일정 등록 부분 ( 위치)	
	@RequestMapping("/schedule/schedule-detail-Map.trip")
	public String map(HttpServletRequest request,ScheduleDetailDTO dto){
		sqlMap.insert("schedule.scheduleDetailInsert", dto);
		
		request.setAttribute("dto",dto);
		return "/schedule/schedule-detail-transport.jsp";
	}
	
	
	
	
	@RequestMapping("/schedule/schedule-detail-main.trip")
	public String detail_main(HttpServletRequest request){
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		int s_num = 1;		// 일정번호 임의지정 ... 일정선택후 상세일정진입시. 일정번호 대입된다. 
		
		List list = sqlMap.queryForList("schedule.scheduleDetailList", s_num);

		request.setAttribute("detaillist", list);
		
		return "/schedule/schedule-detail.jsp";
	}
	
	@RequestMapping("/schedule/schedule-list.trip")
	public String schedulelist(HttpServletRequest request, HttpSession session){
		String s_writer = (String)session.getAttribute("memId");
		int count = (Integer)sqlMap.queryForObject("schedule.scheduleCount", s_writer);
		List scheduleList = null;
		if(count > 0){
			scheduleList = sqlMap.queryForList("schedule.scheduleList", s_writer);
			request.setAttribute("scheduleList", scheduleList);
		}
		request.setAttribute("scheduleCount", count);
		
		return "/schedule/schedule-list.jsp";
	}
	
	@RequestMapping("/schedule/schedule-update.trip")
	public String scheduleUpdate(HttpServletRequest request,ScheduleDTO dto, HttpSession session){
		String s_writer = (String)session.getAttribute("memId");
		dto.setS_writer(s_writer);
		sqlMap.update("schedule.scheduleUpdate", dto);
		
		return "redirect:/schedule/schedule-list.trip";
	}
	
	@RequestMapping("/schedule/schedule-content.trip")
	public String scheduleContent(HttpServletRequest request,ScheduleDTO dto, HttpSession session){
		String s_writer = (String)session.getAttribute("memId");
		dto.setS_writer(s_writer);
		int s_num = dto.getS_num();
		dto = (ScheduleDTO)sqlMap.queryForObject("schedule.scheduleContent",s_num);
		
		List list = sqlMap.queryForList("schedule.scheduleDetailList", s_num);
		
		request.setAttribute("dto", dto);
		request.setAttribute("detaillist", list);
		
		return "/schedule/schedule-content.jsp";
	}
	
	@RequestMapping("/schedule/schedule-detailUpdate.trip")
	public String scheduledetailUpdate(HttpServletRequest request,ScheduleDTO dto, HttpSession session){
		String s_writer = (String)session.getAttribute("memId");
		dto.setS_writer(s_writer);
		int s_num = dto.getS_num();
		dto = (ScheduleDTO)sqlMap.queryForObject("schedule.scheduleContent",s_num);
		if(dto.getS_startday() != null){
			dto.setS_startday(dto.getS_startday().split(" ")[0]);
		}
		
		List list = sqlMap.queryForList("schedule.scheduleDetailList", s_num);
			
		request.setAttribute("dto", dto);
		request.setAttribute("detaillist", list);
		
		return "/schedule/schedule-update.jsp";
	}
	
	@RequestMapping("/schedule/schedule-detail-updatepopup.trip")
	public String detailpopup(HttpServletRequest request,int sd_num){
		ScheduleDetailDTO dto = (ScheduleDetailDTO)sqlMap.queryForObject("schedule.scheduleDetailpopup", sd_num);
		
		request.setAttribute("dto",dto);
		return "/schedule/schedule-detail-updatepopup.jsp";
	}
	
	@RequestMapping("/schedule/schedule-detail-scheduleUpdate.trip")
	public String detailUpdate(HttpServletRequest request,ScheduleDetailDTO dto){
		System.out.println("asfasdfdfaasf");
		sqlMap.update("schedule.scheduleDetailUpdate", dto);
		
		request.setAttribute("dto",dto);
		return "/schedule/schedule-detail-transport.jsp";
	}

}





