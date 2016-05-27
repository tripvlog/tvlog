package trip.member;



	import java.io.File;
import java.nio.file.Path;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.orm.ibatis.SqlMapClientTemplate;
	import org.springframework.stereotype.Controller;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

	@Controller
	public class LoginController {
		
		@Autowired
		SqlMapClientTemplate sqlmap;
		
		@RequestMapping("/member/loginForm.trip")
		public String loginForm(){
			return "/schedule/index.jsp";
		}
		
		@RequestMapping(value="/member/loginPro.trip",method=RequestMethod.POST)
		public String Login(HttpSession session, LoginDTO dto,HttpServletRequest request){
			
				int count = (Integer)sqlmap.queryForObject("loginCheck",dto);
				if(count==1){			
				
					session.setAttribute("memId",dto.getId());
					session.setAttribute("fb",new Integer(0));
					dto=(LoginDTO)sqlmap.queryForObject("path", dto);
					request.setAttribute("imgPath",  dto.getPath());
					request.setAttribute("dto",dto);
									
				}				
				return "/schedule/index.jsp";
					
		}
		
		@RequestMapping("/member/loginfbPro.trip")
		public String Loginfb(HttpSession session, LoginDTO dto,HttpServletRequest request){
			
			int count = (Integer)sqlmap.queryForObject("idcheck",dto.getId());
			
			session.setAttribute("memId",dto.getId());
			session.setAttribute("fb",new Integer(1));
			if(count==1){			
					
					dto=(LoginDTO)sqlmap.queryForObject("path", dto);
					String imgPath = "D:\\save\\" + dto.getPath();
					request.setAttribute("imgPath", imgPath);
					request.setAttribute("dto",dto);
									
			}else{
				sqlmap.insert("fbInsert",dto);
			}
			return "/member/loginPro.jsp";
					
		}
		
		
		
		
		@RequestMapping("/member/logout.trip")
		public String logout(HttpSession session){
			session.invalidate();
			return "/member/logout.jsp";
		}

		@RequestMapping("/member/joinForm.trip")
		public String join(){
				
				return "/member/joinForm.jsp";
					     
		}
		
		@RequestMapping("/member/joinPro.trip")
		public String joinPro(MultipartHttpServletRequest request,LoginDTO dto)throws Exception{
			
			MultipartFile mf = request.getFile("save");
			System.out.println(mf);
			String rp = request.getRealPath("//img//member//");
			String orgName = mf.getOriginalFilename();
			String ext = orgName.substring(orgName.lastIndexOf("."));
			String savName = dto.getId()+ext;
			System.out.println(savName);
			File sf = new File(rp+"//"+savName);
			mf.transferTo(sf);
			
			dto.setPath(savName);
			sqlmap.insert("joinInsert", dto);
			return "/member/joinPro.jsp";
			
		}
		
		
		@RequestMapping("/member/ConfirmId.trip")
		public String ConfirmId(HttpServletRequest request,String id){
			id = request.getParameter("id");
			int count = (Integer)sqlmap.queryForObject("idcheck",id);
			request.setAttribute("id", id);
			String view =null;
			if(count==1){
				
				 view="/member/ExistId.jsp";
			}
			else{
				 view="/member/IdCheck.jsp";
			} 
				
			return view;	
			
		}
		
		
		
		@RequestMapping("/member/ConfirmDomain.trip")
		public String ConfirmDomain(HttpServletRequest request,String domain){
			domain = request.getParameter("domain");
			int count = (Integer)sqlmap.queryForObject("domaincheck",domain);
			request.setAttribute("domain", domain);
			String view =null;
			if(count==1){
				
				 view="/member/ExistDomain.jsp";
			}
			else{
				 view="/member/DomainCheck.jsp";
			} 
				
			return view;	
		}
	
		
		@RequestMapping("/member/deleteForm.trip")
		public String deleteForm(){
			return "/member/deleteForm.jsp";
			
		}
		
		@RequestMapping("/member/deletePro.trip")
		public String facebooklogin(HttpSession session,HttpServletRequest request , String pw){
			
			String dbid = (String) session.getAttribute("memId");
		
			String dbpw = (String) sqlmap.queryForObject("pw", dbid);
		
			if(dbpw.equals(pw)){		
				sqlmap.delete("delete", dbid);
				session.invalidate();
			}
			return "/member/deletePro.jsp";
			
		}
		@RequestMapping("/member/modifyForm.trip")
		public String modifyForm(HttpSession session, LoginDTO dto, HttpServletRequest request){
			String id = (String)session.getAttribute("memId");
			dto = (LoginDTO)sqlmap.queryForObject("modify",id);
			request.setAttribute("dto",dto);
			return"/member/modifyForm.jsp";
		}
		@RequestMapping("/member/modifyPro.trip")
		public String modifyPro(HttpSession session, LoginDTO dto){
			String id = (String)session.getAttribute("memId");
			dto.setId(id);
			sqlmap.update("modifyUpdate", dto);
			
			return"/member/modifyPro.jsp";
		}
	
	}

