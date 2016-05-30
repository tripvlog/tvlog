package trip.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/main/main.trip")
	public String main(){
		return "/main/main.jsp";
	}
}
