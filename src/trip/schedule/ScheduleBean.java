package trip.schedule;

import java.io.File;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import trip.member.LoginDTO;
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
	public String map(MultipartHttpServletRequest request,ScheduleDetailDTO dto)throws Exception{
		sqlMap.insert("schedule.scheduleDetailInsert", dto);
		
		MultipartFile mf = request.getFile("placeImg");
		int sd_num=0;
		if(mf != null){
			sd_num = (Integer)sqlMap.queryForObject("schedule.scheduleDetailMax",null);
			String orgName = mf.getOriginalFilename();
			String ext = orgName.substring(orgName.lastIndexOf(".")+1);
			String path = request.getRealPath("//img//schedule//");
			String saveName = "place"+sd_num+"."+ext;
			dto.setSd_orgfile(saveName);
			dto.setSd_num(sd_num);
			File save = new File(path+"//"+saveName);		
			mf.transferTo(save);
			
			sqlMap.update("schedule.scheduleDetailPlaceImg", dto);
		}
		
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
		LoginDTO dto = (LoginDTO)sqlMap.queryForObject("modify", s_writer);
		int count = (Integer)sqlMap.queryForObject("schedule.scheduleCount", s_writer);
		List scheduleList = null;
		if(count > 0){
			scheduleList = sqlMap.queryForList("schedule.scheduleList", s_writer);
			request.setAttribute("scheduleList", scheduleList);
		}
		request.setAttribute("scheduleCount", count);
		request.setAttribute("member", dto);
		
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
	
	@RequestMapping("/schedule/schedule-map.trip")
	public String scheduleContentMap(HttpServletRequest request,ScheduleDTO dto, HttpSession session){
		String s_writer = (String)session.getAttribute("memId");
		dto.setS_writer(s_writer);
		int s_num = dto.getS_num();
		dto = (ScheduleDTO)sqlMap.queryForObject("schedule.scheduleContent",s_num);
		
		List list = sqlMap.queryForList("schedule.scheduleDetailMap", s_num);
		
		request.setAttribute("dto", dto);
		request.setAttribute("detaillist", list);
		request.setAttribute("count", list.size());
		
		return "/schedule/schedule-map.jsp";
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
		sqlMap.update("schedule.scheduleDetailUpdate", dto);
		
		request.setAttribute("dto",dto);
		return "/schedule/schedule-detail-transport.jsp";
	}
	
	@RequestMapping("/schedule/schedule-search.trip")
	public String search(HttpServletRequest request,String keyword){
		List scheduleList = null;
		
		scheduleList = sqlMap.queryForList("schedule.scheduleSearch", keyword);
		
		request.setAttribute("scheduleList", scheduleList);
		request.setAttribute("scheduleCount", scheduleList.size());
		return "/main/findSchedule.jsp";
	}
	
	@RequestMapping("/schedule/place-search.trip")
	public String placesearch(HttpServletRequest request,String keyword){
		List place = null;
		
		place = sqlMap.queryForList("schedule.placeSearch", keyword);
		
		request.setAttribute("place", place);
		request.setAttribute("placeCount", place.size());
		System.out.println(place.size());
		return "/schedule/placeSearch.jsp";
	}
	
	@RequestMapping("/schedule/schedule-del.trip")
	public String scheduleDel(HttpServletRequest request, int s_num){
		sqlMap.delete("schedule.scheduleDelete",s_num);
		sqlMap.delete("schedule.scheduleDetailDelete",s_num);
		return "redirect:/schedule/schedule-list.trip";
	}

	@RequestMapping("/schedule/schedule-imgCh.trip")
	public String imgChange(MultipartHttpServletRequest request) throws Exception{
		MultipartFile mf = request.getFile("scheduleImg");
		String orgName = mf.getOriginalFilename();
		String ext = orgName.substring(orgName.lastIndexOf(".")+1);
		int s_num = Integer.parseInt(request.getParameter("s_num"));
		String img = request.getParameter("s_mainimg");
		String path = request.getRealPath("//img//schedule//");
		String saveName = "schedule"+s_num+"."+ext;
		File save = new File(path+("//schedule"+s_num+"."+ext));
		File imgFile = new File(path+"//"+img);
		if(img.equals("schedule-img.png")){
			mf.transferTo(save);
		}else{
			imgFile.delete();
			mf.transferTo(save);
		}
		ScheduleDTO dto = new ScheduleDTO();
		dto.setS_num(s_num);
		dto.setS_mainimg(saveName);
		sqlMap.update("schedule.scheduleImg",dto);
		request.setAttribute("dto", dto);
		return "/schedule/schedule-img.jsp";
	}
}





