package trip.diary;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	@RequestMapping("diary.trip")
	public String diaryForm(){
		
		return "/diary/form.jsp";
	}
	@RequestMapping("submit.trip")
	public String submit(HttpServletRequest request){
		System.out.println(" access submit ");
		System.out.println("¿¡µðÅÍ ÄÁÅÙÃ÷ °ª : " + request.getParameter("d_content"));
		
		return "redirect:/diary/s_editor.jsp";
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
	
}
