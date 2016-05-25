package trip.band;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class BandAction {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/band/b_create.trip")
	public String bandCreate(){ return "/band/create_band.jsp"; }
	
	@RequestMapping("/band/b_createPro.trip")
	public String bandCreatePro(MultipartHttpServletRequest request){
		System.out.println(" ============== b_create.trip start ============== ");
		System.out.println(request.getParameter("b_name") + " is b_name");
		System.out.println(request.getFile("b_img") + " is b_img");
		System.out.println(" ============== b_create.trip end ============== ");
		return "redirect:/band/b_create.trip";
	}
}
