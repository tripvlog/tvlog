package trip.Diary;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ImgUploadAction {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("upload.trip")
	public ModelAndView upload(){
		
		
		return null;		
	}
}
