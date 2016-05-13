package trip.member;



	import java.nio.file.Path;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.orm.ibatis.SqlMapClientTemplate;
	import org.springframework.stereotype.Controller;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestMethod;

	@Controller
	public class LoginController {
		
		@Autowired
		SqlMapClientTemplate sqlmap;
		
		@RequestMapping("/loginForm.trip")
		public String loginForm(){
			return "/trip.member/loginForm.jsp";
		}
		
		
		

		@RequestMapping(value="/loginPro.trip",method=RequestMethod.POST)
		public String Login(HttpSession session, LoginDTO dto,HttpServletRequest request){
			
				int count = (Integer)sqlmap.queryForObject("loginCheck",dto);
				if(count==1){			
				
					session.setAttribute("memId",dto.getId());
					dto=(LoginDTO)sqlmap.queryForObject("path", dto);
					String imgPath = "D:\\save\\" + dto.getPath();
					request.setAttribute("imgPath", imgPath);
					request.setAttribute("dto",dto);
									
				}				
				return "/trip.member/loginPro.jsp";
					
		}
		
		
		
		
		@RequestMapping("/logout.trip")
		public String logout(){
			return "/trip.member/logout.jsp";
		}

		@RequestMapping("/joinForm.trip")
		public String join(){
				
				return "/trip.member/joinForm.jsp";
					
		}
		
		@RequestMapping("/joinPro.trip")
		public String joinPro(LoginDTO dto){
			
			sqlmap.insert("joinInsert", dto);
			return "/trip.member/joinPro.jsp";
			
		}
		
		
		@RequestMapping("/ConfirmId.trip")
		public String ConfirmId(HttpServletRequest request,String id){
			id = request.getParameter("id");
			int count = (Integer)sqlmap.queryForObject("idcheck",id);
			request.setAttribute("id", id);
			String view =null;
			if(count==1){
				
				 view="/trip.member/ExistId.jsp";
			}
			else{
				 view="/trip.member/IdCheck.jsp";
			} 
				
			return view;	
			
		}
		
		
		
		@RequestMapping("/ConfirmDomain.trip")
		public String ConfirmDomain(HttpServletRequest request,String domain){
			domain = request.getParameter("domain");
			int count = (Integer)sqlmap.queryForObject("domaincheck",domain);
			request.setAttribute("domain", domain);
			String view =null;
			if(count==1){
				
				 view="/trip.member/ExistDomain.jsp";
			}
			else{
				 view="/trip.member/DomainCheck.jsp";
			} 
				
			return view;	
		}
	
		
		@RequestMapping("/deleteForm.trip")
		public String deleteForm(){
			return "/trip.member/deleteForm.jsp";
			
		}
		@RequestMapping("/deletePro.trip")
		public String deletePro(HttpSession session,LoginDTO dto, HttpServletRequest request){
			
			String dbid = (String) session.getAttribute("memId");
			String dbpw = (String) sqlmap.queryForObject("pw", dbid);
			String pw = request.getParameter("pw");
			
			if(dbpw.equals(pw)){			
			                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
				dto=(LoginDTO)sqlmap.queryForObject("delete",dbid);
				
			}
			return "/trip.member/deletePro.jsp";
			
		}
	
	}

