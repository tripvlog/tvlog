package trip.Diary;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ImgUploadAction {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("upload.trip")
	public ModelAndView upload(HttpServletRequest req, MultipartHttpServletRequest mulreq, ImgDto dto){
		
		String savFolder = "c:\\uploads\\";
		
		File dir = new File(savFolder);
		
		if(!dir.isDirectory()){
			dir.mkdirs();
		}
		
		List<MultipartFile> mf = (List<MultipartFile>) mulreq.getFile("uploadFile");
		if(mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")){
			
		}else{
			for(int i = 0; i < mf.size(); i++){
				String genId = UUID.randomUUID().toString();
				String originalfileName = mf.get(i).getOriginalFilename();
				// http://devofhwb.tistory.com/17
			}
		}
		return null;		
	}
}
