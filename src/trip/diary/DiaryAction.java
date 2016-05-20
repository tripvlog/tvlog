package trip.diary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class DiaryAction {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	ImgVO vo;
	
	@RequestMapping("diary.trip")
	public String diaryForm(){ return "/diary/form.jsp"; }
	
	@RequestMapping("editor.trip")
	public String s_editor(){ return "/diary/s_editor.jsp"; }
	
	@RequestMapping("submit.trip")
	public String submit(HttpServletRequest request, ImgVO vo){
		System.out.println(" ==================== submit.trip Start ==================== ");
		System.out.println("에디터 : " + request.getParameter("d_content"));
		System.out.println(vo.getDiary_num() + " vo.getnum");
		System.out.println(vo.getDiary_writer() + " vo.getwriter");
		System.out.println(vo.getDiary_title() + " vo.gettitle");
		System.out.println(vo.getDiary_content() + " vo.getcontent");
		System.out.println(vo.getDiary_location() + " vo.getloaction");
		System.out.println(vo.getDiary_range() + " vo.getrange");
		sqlMap.insert("diary_insert", vo);
		System.out.println(" ==================== submit.trip end ==================== ");
		return "redirect:list.trip";
	}
	@RequestMapping("diaryPro.trip")
	public String diaryPro(HttpServletRequest req, MultipartHttpServletRequest mtreq) throws Exception{
		String originalfileName = "";
		List<MultipartFile> mf = mtreq.getFiles("profile_pt");
		System.out.println(" ==================== diaryPro start ======================= ");
		System.out.println(req.getParameter("d_title") + " is title value");
		System.out.println(req.getParameter("d_content") + " is content value");

		if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
		} else {
			for (int i = 0; i < mf.size(); i++) {
				originalfileName = mf.get(i).getOriginalFilename();
				System.out.println(originalfileName  + " is profile_pt value");
			}
		}
		System.out.println(mf.size() + " is mf.size() value");
		System.out.println(" ==================== diaryPro end ======================= ");
		return "redirect:diary.trip";
	}
	
	@RequestMapping("map.trip")
	public String map(){ return "/diary/map.jsp"; }
	
	@RequestMapping("list.trip")
	public String list(ImgVO vo, HttpServletRequest request){
		List list = sqlMap.queryForList("diary_select", null);
		request.setAttribute("list", list);
		System.out.println(" ========== list.trip ok ========== ");
		return "/diary/list.jsp";
	}
	
	@RequestMapping("view.trip")
	public String list(HttpServletRequest request){
		int diary_num = Integer.parseInt(request.getParameter("num"));
		vo = (ImgVO)sqlMap.queryForObject("diary_view", diary_num);
		request.setAttribute("vo", vo);
		System.out.println(" ========== view.trip ok ========== ");
		return "/diary/view.jsp";
	}
	
	@RequestMapping("modify.trip")
	public String modify(HttpServletRequest request){
		
		int diary_num = Integer.parseInt(request.getParameter("num"));
		vo = (ImgVO)sqlMap.queryForObject("diary_view", diary_num);
		request.setAttribute("vo", vo);
		System.out.println(" ========== modify.trip ok ========== ");
		return "/diary/modify.jsp";
	}
	
	@RequestMapping("modifyPro.trip")
	public String modifyPro(HttpServletRequest request, ImgVO vo){
		System.out.println(vo.getDiary_num() + " is vo.getdiarynum");
		sqlMap.insert("diary_update", vo);
		System.out.println(" ========== modifyPro.trip ok ========== ");
		return "redirect:view.trip?num=" + vo.getDiary_num();
	}
	
	@RequestMapping("delete.trip")
	public String delete(HttpServletRequest request){
		int diary_num = Integer.parseInt(request.getParameter("num"));
		sqlMap.delete("diary_delete", diary_num);
		System.out.println(" ========== delete.trip ok ========== ");
		return "redirect:list.trip";
	}
}