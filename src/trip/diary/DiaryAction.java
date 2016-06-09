package trip.diary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import trip.post.boardVO;

@Controller
public class DiaryAction {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	ImgVO vo;
	
	@RequestMapping("/diary/editor.trip")
	public String s_editor(){ return "/diary/s_editor.jsp"; }
	
	@RequestMapping("/diary/submit.trip")
	public String submit(HttpServletRequest request, HttpSession session, ImgVO vo){
		vo.setDiary_writer((String)session.getAttribute("memId"));
		sqlMap.insert("diary_insert", vo);
		return "redirect:list.trip";
	}
	@RequestMapping("/diary/diaryPro.trip")
	public String diaryPro(HttpServletRequest req, MultipartHttpServletRequest mtreq) throws Exception{
		String originalfileName = "";
		List<MultipartFile> mf = mtreq.getFiles("profile_pt");

		if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
		} else {
			for (int i = 0; i < mf.size(); i++) {
				originalfileName = mf.get(i).getOriginalFilename();
			}
		}
		return "redirect:diary.trip";
	}
	
	@RequestMapping("/diary/map.trip")
	public String map(){ return "/diary/map.jsp"; }
	
	@RequestMapping("/diary/list.trip")
	public String list(ImgVO vo, HttpServletRequest request){
		List list = sqlMap.queryForList("diary_select", null);
		request.setAttribute("list", list);
		return "/diary/list.jsp";
	}
	@RequestMapping("/diary/frienddiary.trip")
	public String frienddiary(boardVO dto, String friend_id, HttpSession session, HttpServletRequest request){
		  String id=null;	   
		  id= (String)session.getAttribute("memId");
		  dto.setId(id);
		  
		  List<boardVO> list = null;   
		  
		  if(id==null){
		  list = sqlMap.queryForList("diary_frienddiary", dto); 
  
		  }else if(id!=null){
			  list =sqlMap.queryForList("diary_sessionFriend", friend_id);
		  }
		  request.setAttribute("list", list);
		  
		return "/diary/list.jsp";
	}
	
	@RequestMapping("/diary/view.trip")
	public String list(HttpServletRequest request){
		int diary_num = Integer.parseInt(request.getParameter("num"));
		vo = (ImgVO)sqlMap.queryForObject("diary_view", diary_num);
		request.setAttribute("vo", vo);
		return "/diary/view.jsp";
	}
	
	@RequestMapping("/diary/modify.trip")
	public String modify(HttpServletRequest request){
		
		int diary_num = Integer.parseInt(request.getParameter("num"));
		vo = (ImgVO)sqlMap.queryForObject("diary_view", diary_num);
		request.setAttribute("vo", vo);
		return "/diary/modify.jsp";
	}
	
	@RequestMapping("/diary/modifyPro.trip")
	public String modifyPro(HttpServletRequest request, ImgVO vo){
		sqlMap.insert("diary_update", vo);
		return "redirect:view.trip?num=" + vo.getDiary_num();
	}
	
	@RequestMapping("/diary/delete.trip")
	public String delete(HttpServletRequest request){
		int diary_num = Integer.parseInt(request.getParameter("num"));
		sqlMap.delete("diary_delete", diary_num);
		return "redirect:list.trip";
	}
	
	@RequestMapping("/diary/cluster.trip")
 	public String cluster(HttpServletRequest request){
 		List location = sqlMap.queryForList("diary_cluster", null);
 		System.out.println(location.size() + " is locatioin value");
 		request.setAttribute("location", location);
 		System.out.println(" ========== cluster.trip ok ========== ");
 		return "/diary/cluster.jsp";
 	}
}
