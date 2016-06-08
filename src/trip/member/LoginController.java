package trip.member;



	import java.io.File;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.orm.ibatis.SqlMapClientTemplate;
	import org.springframework.stereotype.Controller;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

	@Controller
	public class LoginController {
		
		@Autowired
		SqlMapClientTemplate sqlmap;
		
		@RequestMapping("/member/loginForm.trip")
		public String loginForm(){
			return "/main/index.jsp";
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
			return "/main/index.jsp";
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
			return "/member/myPage.jsp";
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
			sqlmap.insert("joinInsert", dto);
			sqlmap.insert("member_create_band_list", dto);
			sqlmap.insert("member_create_friend_list", dto);
			MultipartFile mf = request.getFile("save");
			if(mf.getSize() > 0){
				String rp = request.getRealPath("//img//member//");
				String orgName = mf.getOriginalFilename();
				String ext = orgName.substring(orgName.lastIndexOf("."));
				String savName = dto.getId()+ext;
				File sf = new File(rp+"//"+savName);
				mf.transferTo(sf);
				dto.setPath(savName);
				sqlmap.update("joinUpdate", dto);
			}
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
		public String modifyPro( MultipartHttpServletRequest request, HttpSession session) throws Exception{
			LoginDTO dto = new LoginDTO();
			String id = (String)session.getAttribute("memId");
			dto.setId(id);
			dto.setName(request.getParameter("name"));
			dto.setPw(request.getParameter("pw"));
			dto.setDomain(request.getParameter("domain"));
			
			
			MultipartFile mf = request.getFile("path");
			System.out.println(mf);
			if(mf.getSize() > 0){
				String dbpath = (String)sqlmap.queryForObject("member_get_img", id);
				if(dbpath.equals("default.jpg")){
					String rp = request.getRealPath("//img//member//");
					String orgName = mf.getOriginalFilename();  // 원본 이름
					String ext = orgName.substring(orgName.lastIndexOf("."));   // .확장자
					String savName = dto.getId()+ext;   //저장할 이름 : 아이디+확장자
					File sf = new File(rp+"//"+savName);  //rp경로에 저장한 이름 넣고 sf에 대입
					mf.transferTo(sf);   //mf를 sf로 바꿔줌
					dto.setPath(savName);
					sqlmap.update("modifyUpdate", dto);
				}
				else{
					String rp = request.getRealPath("//img//member//");
					File deleteFile = new File(rp + dbpath);
					deleteFile.delete();  //원래 파일 삭제
					// 다시 새로운 파일 저장
					String orgName = mf.getOriginalFilename();
					String ext = orgName.substring(orgName.lastIndexOf("."));
					String savName = dto.getId()+ext;
					File sf = new File(rp+"//"+savName);
					mf.transferTo(sf);
					dto.setPath(savName);
					sqlmap.update("modifyUpdate", dto);
				}
			}
			else{
				sqlmap.update("modifyUpdateTwo", dto);
			}
			return"/member/modifyPro.jsp";
		}
		
		@RequestMapping("/member/myPage.trip")
		public ModelAndView myPage(HttpSession session, HttpServletRequest request){
			String id = (String)session.getAttribute("memId");
			// 회원 정보 수정
			LoginDTO dto = (LoginDTO)sqlmap.queryForObject("modify",id);    
			request.setAttribute("dto",dto);
			// 내가 쓴 포스트
			int myPostListCount = (Integer)sqlmap.queryForObject("myPostListCount", id);			
			List post = new ArrayList();
			post = sqlmap.queryForList("myPostList", id);
			// 내가 만든 일정
			int myScheduleListCount = (Integer)sqlmap.queryForObject("myScheduleListCount", id);
			List schedule = new ArrayList();
			schedule = sqlmap.queryForList("myScheduleList", id);
			// 내 친구 목록
			int myFriendListCount = (Integer)sqlmap.queryForObject("myFriendListCount", id);
			List friend = new ArrayList();
			friend = sqlmap.queryForList("myFriendList", id);
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("myPostListCount",myPostListCount);
			mv.addObject("post", post);
			mv.addObject("myScheduleListCount", myScheduleListCount);
			mv.addObject("schedule", schedule);
			mv.addObject("myFriendListCount", myFriendListCount);
			mv.addObject("friend", friend);
			mv.setViewName("/member/myPage.jsp");
			
			return mv;
		}
		
		@RequestMapping("/member/findPw.trip")
		public String findPw(String id, HttpServletRequest request){
			id = request.getParameter("id");
			String findpw = (String) sqlmap.queryForObject("pw", id);
			request.setAttribute("pw", findpw);
			return "/main/findPw.jsp";
		}
		
		@RequestMapping("/member/myPost.trip")
		public ModelAndView myPost(HttpSession session){
			String id = (String)session.getAttribute("memId");
			
			int myPostListCount = (Integer)sqlmap.queryForObject("myPostListCount", id);			
			List post = new ArrayList();
			post = sqlmap.queryForList("myPostList", id);
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("myPostListCount",myPostListCount);
			mv.addObject("post", post);
			mv.setViewName("/member/myPost.jsp");
			return mv;
		}
	}

