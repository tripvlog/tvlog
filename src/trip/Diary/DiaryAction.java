package trip.Diary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

@Controller
public class DiaryAction {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("diary.trip")
	public String diaryForm(){
		
		return "/diary/form.jsp";
	}
	
	
	@RequestMapping("diaryPro.trip")
	public String diaryPro(HttpServletRequest req, MultipartHttpServletRequest mtreq) throws Exception{
		String originalfileName = "";
		List<MultipartFile> mf = mtreq.getFiles("profile_pt");
		System.out.println(" ==================== diaryPro start ======================= ");
		System.out.println(req.getParameter("d_title") + " is title value");
		System.out.println(req.getParameter("d_content") + " is content value");
		System.out.println(req.getRealPath("diary") + " is realPath about diary");
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
	
}
