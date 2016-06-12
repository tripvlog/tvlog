package trip.band;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import trip.member.BandListDTO;
import trip.member.LoginDTO;

@Controller
public class BandAction {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/band/b_create.trip")
	public String bandCreate(){	return "/band/create_band.jsp";	}
	
	@RequestMapping("/band/b_createPro.trip")
	public String bandCreatePro(MultipartHttpServletRequest request, HttpSession session, BandDTO banddto, trip.member.BandListDTO listdto){
		
		MultipartFile b_img = request.getFile("b_img");
		banddto.setBand_leader((String)session.getAttribute("memId"));
		sqlMap.insert("band_create", banddto);
		banddto.setBand_id((int)sqlMap.queryForObject("band_selectLastId", null));
		sqlMap.insert("band_create_table_board", banddto.getBand_id());	// 밴드마다 게시판 테이블 생성
		sqlMap.insert("band_create_sequence_board",banddto.getBand_id()); // 게시판 시퀀스 생성
		sqlMap.insert("band_create_table_comment", banddto.getBand_id()); // 댓글 테이블 생성
		sqlMap.insert("band_create_sequence_comment", banddto.getBand_id()); // 댓글 시퀀스 생성
		sqlMap.insert("band_create_table_member", banddto.getBand_id()); // 멤버 테이블 생성
		sqlMap.insert("band_create_sequence_member", banddto.getBand_id()); // 멤버 시퀀스 생성
		sqlMap.insert("band_create_table_board_imgs", banddto.getBand_id()); // 밴드 게시물에 올라오는 이미지를 기록할 테이블 생성
		
		String leader_name = (String)sqlMap.queryForObject("member_get_name", banddto.getBand_leader());
		Map map = new HashMap();
		map.put("band_id", banddto.getBand_id());
		map.put("leader_id", banddto.getBand_leader());
		map.put("leader_name", leader_name);
		String memberImg = (String)sqlMap.queryForObject("member_get_img", banddto.getBand_leader());
		map.put("band_member_img", memberImg);
		sqlMap.insert("band_insert_leader", map); // 밴드 멤버안에 리더 추가
		
		listdto.setBand_id(banddto.getBand_id());
		listdto.setBand_name(banddto.getBand_name());
		listdto.setMember_id((String)session.getAttribute("memId"));

		
		String band_img = request.getFile("b_img").getOriginalFilename();
		
		if(!band_img.equals("")){
			
			String img_path = request.getSession().getServletContext().getRealPath("/");
			String img_name = "bI_" + banddto.getBand_id();
			String img_ext = band_img.substring(band_img.lastIndexOf('.') + 1, band_img.length());
			banddto.setBand_img(img_name + "." + img_ext);
			File img_save = new File(img_path + "img/band/" + img_name + "." + img_ext);

			sqlMap.update("band_imgUpload", banddto);
			listdto.setBand_img(img_name + "." + img_ext);
			sqlMap.insert("band_insert_my_list", listdto);
			try {
				b_img.transferTo(img_save);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}else{
			listdto.setBand_img("default.jpg");
			sqlMap.insert("band_insert_my_list", listdto);
		}
		return "redirect:/band/b_list.trip";
	}
	
	@RequestMapping("/band/b_list.trip")
	public String bandList(HttpServletRequest request, HttpSession session, BandDTO banddto, memberDTO memberdto){
		List list = sqlMap.queryForList("band_select", null);
		request.setAttribute("b_list", list);
		return "/band/list_band.jsp";
	}
	
	@RequestMapping("/band/b_view.trip")
	public String bandView(HttpServletRequest request, HttpSession session, int band_id, BandDTO banddto, boardDTO boarddto, memberDTO memdto, trip.member.BandListDTO bandlistdto){
		banddto = (BandDTO)sqlMap.queryForObject("band_view", band_id);
		List band_board = sqlMap.queryForList("band_content", banddto.getBand_id());
		List bandlist = sqlMap.queryForList("main_band", null); // 사용자에게 다른 밴드 추천 
		
		if(session.getAttribute("memId") != null){	// 로그인이 되어있다면 로그인한 회원에 밴드 가입 목록을 가져옴
			bandlistdto.setMember_id((String)session.getAttribute("memId"));
			List band_list = sqlMap.queryForList("band_my_list", bandlistdto);
			request.setAttribute("band_list", band_list);
		}
		String modify = "";
		if(request.getParameter("modify") == null){
			modify = "false";
		}else{
			modify = request.getParameter("modify");
		}
		if(modify.equals("true")){
			boarddto = (boardDTO)sqlMap.queryForObject("band_board_select", boarddto);
			boarddto.setBand_id(band_id);
			int imgCount = (int)sqlMap.queryForObject("band_board_img_count", boarddto);
			List imgs = sqlMap.queryForList("band_board_imgs_get", boarddto);
			request.setAttribute("imgs", imgs);
			request.setAttribute("imgCount", imgCount);
			request.setAttribute("modify_board", boarddto);
			request.setAttribute("modify", "true");
		}
		List memberlist = sqlMap.queryForList("band_board_member_get", band_id);
		List waitmember = sqlMap.queryForList("band_member_guest", band_id);
		String id = (String)session.getAttribute("memId");
		if(id == null){
			id = "";
		}
		int check = 0;
		for(int i=0; i<waitmember.size(); i++){
			memdto = (memberDTO)waitmember.get(i);
			if(id.equals(memdto.getBand_member_id())){
				request.setAttribute("guest", "wait");
				check = 1;
				break;
			}
		}
		if(check == 0){
			for(int i=0; i<memberlist.size(); i++){
				memdto = (memberDTO)memberlist.get(i);
				if(id.equals(memdto.getBand_member_id())){
					request.setAttribute("guest", "member");
					break;
				}
				request.setAttribute("guest", "guest");
			}
		}
		request.setAttribute("waitmember", waitmember);
		request.setAttribute("bandlist", bandlist);
		request.setAttribute("band_id", banddto.getBand_id());
		request.setAttribute("b_board_contents", band_board);
		request.setAttribute("band", banddto);
		return "/band/view_band.jsp";
	}

	@RequestMapping("/band/bb_write.trip")
	public String b_boardWrite(MultipartHttpServletRequest request, HttpSession session, boardDTO boarddto, imgDTO imgdto){

		boarddto.setBand_board_writer((String)session.getAttribute("memId"));
		List<MultipartFile> band_board_img = request.getFiles("upload_img");
		String board_imgs = "";
		int board_maxnum = 0;
		imgdto.setBoard_num(boarddto.getBand_board_num());
		imgdto.setBand_id(Integer.parseInt(request.getParameter("band_id")));
		
		if(request.getParameter("modify").equals("complete")){ // 내용수정일 경우 동작
			sqlMap.update("band_modify_content", boarddto);
			for(MultipartFile multi : band_board_img){ // 새로 업로드 되는 이미지가 있다면 기존 이미지는 삭제
				if(!multi.getOriginalFilename().equals("")){
					List board_img = sqlMap.queryForList("band_board_img_select", imgdto);
					if(!board_img.toString().equals("[]")){
						for(Object obj : board_img){
							String filePath = request.getSession().getServletContext().getRealPath("/") + "img" + File.separator + "band" + File.separator;
							String img = filePath + obj.toString();
							File imgfile = new File(img);
							if(imgfile.exists()){
								imgfile.delete();
							}
						}
					}
				}
				sqlMap.delete("band_board_imgs_del", imgdto); // db에 저장된 이미지 목록 제거
				board_maxnum = boarddto.getBand_board_num();
			}
		}else{
			sqlMap.insert("band_board_write", boarddto); // 내용 작성
			board_maxnum = (int) sqlMap.queryForObject("band_board_maxnum", imgdto.getBand_id());
		}
		imgdto.setBoard_num(board_maxnum);
		imgdto.setBoard_writer(boarddto.getBand_board_writer());

		for(MultipartFile multi : band_board_img){
			if(multi.getOriginalFilename().equals("")){
				break;
			}
			String fileorgName = multi.getOriginalFilename();
			String fileName_ext = fileorgName.substring(fileorgName.lastIndexOf('.') + 1);
			fileName_ext = fileName_ext.toLowerCase();
			String filesavName = "bb_" + request.getParameter("band_id") + "_" + UUID.randomUUID().toString().substring(0, 8);
			String filePath = request.getSession().getServletContext().getRealPath("/") + "img" + File.separator + "band" + File.separator;
			File file = new File(filePath + filesavName + "." + fileName_ext);
			board_imgs = board_imgs + "<img src=/tvlog/img/band/" + filesavName + "." + fileName_ext + ">";
			if(!file.exists())
				file.mkdirs();
			
			try{
				multi.transferTo(file);
				imgdto.setBoard_img(filesavName + "." + fileName_ext);
				sqlMap.insert("band_board_insert_img", imgdto);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		boarddto.setBand_board_img(board_imgs);
		boarddto.setBand_board_num(imgdto.getBoard_num());
		sqlMap.update("band_board_img", boarddto);
		return "redirect:/band/b_view.trip?band_id=" + request.getParameter("band_id");
	}
	
	@RequestMapping("/band/bb_comment.trip")
	public String bb_comment(HttpServletRequest request, commentDTO comdto, int band_id, String member_id, int board_num, String comment){
		comdto.setBand_id(band_id);
		comdto.setBand_board_comment_bno(board_num);
		comdto.setBand_board_comment_writer(member_id);
		comdto.setBand_board_comment_comment(comment);
		sqlMap.insert("band_comment_insert", comdto);
		
			List board_comment = sqlMap.queryForList("band_comment", band_id);
			request.setAttribute("b_board_comments", board_comment);
		
		return "redirect:/band/b_view.trip?band_id=" + band_id;
	}
	
	@RequestMapping("/band/bb_commentView.trip") // 댓글 출력
	public String bb_commentView(HttpServletRequest request, int band_id){
	    List board_comment = sqlMap.queryForList("band_comment", band_id);
	    request.setAttribute("b_board_comments", board_comment);
	    return "/band/commentview_band.jsp";
	}
	@RequestMapping("/band/bb_delete.trip")
	public String b_boardDelete(imgDTO imgdto, HttpSession session, HttpServletRequest request){
		List band_board_img = sqlMap.queryForList("band_board_img_select", imgdto);
		if(!band_board_img.toString().equals("[]")){
			for(Object obj : band_board_img){
				String filePath = request.getSession().getServletContext().getRealPath("/") + "img" + File.separator + "band" + File.separator;
				String img = filePath + obj.toString();
				File imgfile = new File(img);
				if(imgfile.exists()){
					imgfile.delete();
				}
			}
		}
		sqlMap.delete("band_board_imgs_del", imgdto);
		sqlMap.delete("band_board_del", imgdto);
		return "redirect:/band/b_view.trip?band_id=" + imgdto.getBand_id();
	}

	@RequestMapping("/band/b_modify.trip")
	public String b_modify(HttpServletRequest request, HttpSession session, BandDTO banddto, memberDTO memberdto, trip.member.BandListDTO bandlistdto, int band_id){
		List bandlist = sqlMap.queryForList("main_band", null); // 사용자에게 다른 밴드 추천 
		banddto = (BandDTO)sqlMap.queryForObject("band_view", band_id);
		if(session.getAttribute("memId") != null){	// 로그인이 되어있다면 로그인한 회원에 밴드 가입 목록을 가져옴
			bandlistdto.setMember_id((String)session.getAttribute("memId"));
			List band_list = sqlMap.queryForList("band_my_list", bandlistdto);
			request.setAttribute("band_list", band_list);
		}
		memberdto.setBand_id(band_id);
		String getid = (String)session.getAttribute("memId");
		List memberlist = sqlMap.queryForList("band_board_member_get", band_id);

		for(int i=0; i<memberlist.size(); i++){
			memberdto = (memberDTO)memberlist.get(i);
			if(getid.equals(memberdto.getBand_member_id())){
				request.setAttribute("memberdto", memberdto);
			}
		}
		List guestlist = sqlMap.queryForList("band_member_guest", band_id);
		request.setAttribute("guestlist", guestlist);
		request.setAttribute("band_id", band_id);
		request.setAttribute("banddto", banddto);
		return "/band/modify_band.jsp";
	}
	
	@RequestMapping("/band/b_modifyPro.trip")
	public String b_modifyPro(MultipartHttpServletRequest request, HttpSession session, int band_id, String modify, memberDTO memberdto, BandDTO banddto, trip.member.BandListDTO bandlistdto){
		if(modify.equals("band")){
			bandlistdto.setMember_id(memberdto.getBand_member_id());
			bandlistdto.setBand_id(band_id);
			sqlMap.update("band_modify", banddto);
			sqlMap.update("member_band_name_change", bandlistdto);
			String band_img = request.getFile("b_img").getOriginalFilename();
			System.out.println("band_img : " + band_img);
			if(!band_img.equals("")){
				String bef_img = (String)sqlMap.queryForObject("band_img_get", band_id);
				System.out.println("bef_img : " + bef_img);
				if(!bef_img.equals("") && !bef_img.equals("default.jpg")){ // db에 기존 이미지가 있을 경우 삭제
					String filePath = request.getSession().getServletContext().getRealPath("/") + "img" + File.separator + "band" + File.separator;
					String img = filePath + bef_img;
					File imgfile = new File(img);
					System.out.println("imgfile.exists : " +imgfile.exists());
					if(imgfile.exists()){
						imgfile.delete();
					}
				}
				MultipartFile b_img = request.getFile("b_img");
				String img_path = request.getSession().getServletContext().getRealPath("/");
				String img_name = "bI_" + band_id;
				String img_ext = band_img.substring(band_img.lastIndexOf('.') + 1, band_img.length());
				banddto.setBand_img(img_name + "." + img_ext);
				bandlistdto.setBand_img(img_name + "." + img_ext);
				File img_save = new File(img_path + "img/band/" + img_name + "." + img_ext);
				sqlMap.update("band_imgUpload", banddto);
				sqlMap.update("member_band_img_change", bandlistdto);
				
				try {
					b_img.transferTo(img_save);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		if(modify.equals("member")){
			sqlMap.update("band_member_name_change", memberdto);
			String band_img = request.getFile("b_img").getOriginalFilename();
			
			if(!band_img.equals("")){
				String bef_img = (String)sqlMap.queryForObject("band_member_img", memberdto);
				if(!bef_img.equals("") && !bef_img.equals("default.jpg")){
					String filePath = request.getSession().getServletContext().getRealPath("/") + "img" + File.separator + "member" + File.separator;
					String img = filePath + bef_img;
					File imgfile = new File(img);
					System.out.println("imgfile.exists : " +imgfile.exists());
					if(imgfile.exists()){
						imgfile.delete();
					}
				}
				MultipartFile b_img = request.getFile("b_img");
				String img_path = request.getSession().getServletContext().getRealPath("/") + "img" + File.separator + "member" + File.separator;
				String img_name = "bM_" + band_id + memberdto.getBand_member_id();
				String img_ext = band_img.substring(band_img.lastIndexOf('.') + 1, band_img.length());
				memberdto.setBand_member_img(img_name + "." + img_ext);
				File img_save = new File(img_path + img_name + "." + img_ext);
				sqlMap.update("band_member_imgUpload", memberdto);
				
				try {
					b_img.transferTo(img_save);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		return "redirect:/band/b_view.trip?band_id=" + band_id;
	}
	
	@RequestMapping("/band/b_join.trip")
	public String b_join(HttpServletRequest request, HttpSession session, BandDTO banddto, trip.member.BandListDTO bandlistdto, trip.member.LoginDTO logindto, memberDTO memberdto, int band_id){
		String confirm = "";
		if(request.getParameter("confirm") == null){
			confirm = "no";
		}else{
			confirm = request.getParameter("confirm");
		}
		if(confirm.equals("yes")){ // 밴드리더가 가입승인
			sqlMap.update("band_join_confirm", memberdto);
			banddto = (BandDTO)sqlMap.queryForObject("band_view", band_id);
			bandlistdto.setBand_id(band_id);
			bandlistdto.setBand_name(banddto.getBand_name());
			bandlistdto.setBand_img(banddto.getBand_img());
			bandlistdto.setMember_id(memberdto.getBand_member_id());
			
			// 승인된 id db에 있는 밴드목록에 해당 밴드 추가해야함
			sqlMap.insert("band_insert_my_list", bandlistdto);
			return "redirect:/band/b_modify.trip?band_id=" + band_id;
		}else{	// 밴드 가입 신청
		logindto.setId((String)session.getAttribute("memId"));
		logindto = (LoginDTO)sqlMap.queryForObject("modify", logindto.getId());
		Map dto = new HashMap();
		dto.put("band_id", band_id);
		dto.put("band_member_id", logindto.getId());
		dto.put("band_member_name", logindto.getName());
		dto.put("band_member_img", logindto.getPath());
		sqlMap.insert("band_join", dto);
		return "redirect:/band/b_view.trip?band_id=" + band_id;
		}
	}
	
	@RequestMapping("/band/b_leave.trip")
	public String b_leave(HttpServletRequest request, int band_id, memberDTO memberdto, trip.member.BandListDTO bandlistdto){
		bandlistdto.setBand_id(band_id);
		bandlistdto.setMember_id(memberdto.getBand_member_id());
		
		String member_img = (String)sqlMap.queryForObject("band_member_get", memberdto);
		String band_leader = (String)sqlMap.queryForObject("band_leader_get", memberdto);
		if(!member_img.equals("default.jpg")){
			System.out.println("member_img : " + member_img);
			String filePath = request.getSession().getServletContext().getRealPath("/") + "img" + File.separator + "member" + File.separator;
			String img = filePath + member_img;
			File imgfile = new File(img);
			if(imgfile.exists()){
				imgfile.delete();
			}
		}
		if(band_leader.equals(memberdto.getBand_member_id())){
			sqlMap.delete("band_leader_delete", band_id);
			sqlMap.update("band_new_leader_auto", band_id);
			sqlMap.update("band_leader_update", band_id);
		}else{
			sqlMap.delete("band_member_delete", memberdto);			
		}
		sqlMap.delete("member_band_delete", bandlistdto);
		return "redirect:/band/b_list.trip";
	}
	
	@RequestMapping("/band/b_drop.trip")
	public String b_drop(HttpServletRequest request, int band_id, imgDTO imgdto, memberDTO memberdto, trip.member.BandListDTO bandlistdto){
		String band_img = (String)sqlMap.queryForObject("band_img_get", band_id); // 밴드 대표 이미지 삭제
		if(!band_img.equals("default.jpg")){
			String filePath = request.getSession().getServletContext().getRealPath("/") + "img" + File.separator + "band" + File.separator;
			String img = filePath + band_img;
			File imgfile = new File(img);
			if(imgfile.exists()){
				imgfile.delete();
			}
		}
		List board_imgs = sqlMap.queryForList("band_board_img_get", band_id); // 밴드 게시판 이미지 삭제
		for(int i = 0; i < board_imgs.size(); i++){
			imgdto = (imgDTO)board_imgs.get(i);
			String filePath = request.getSession().getServletContext().getRealPath("/") + "img" + File.separator + "band" + File.separator;
			String img = filePath + imgdto.getBoard_img();
			File imgfile = new File(img);
			if(imgfile.exists()){
				imgfile.delete();
			}
		}
		List member_imgs = sqlMap.queryForList("band_member_img_get", band_id); // 밴드 가입후 수정한 프로필 사진 삭제
		for(int i = 0; i < member_imgs.size(); i++){
			memberdto = (memberDTO)member_imgs.get(i);
			String imgName = memberdto.getBand_member_img();
			if(imgName.contains("bM_")){
				String filePath = request.getSession().getServletContext().getRealPath("/") + "img" + File.separator + "member" + File.separator;
				String img = filePath + memberdto.getBand_member_img();
				File imgfile = new File(img);
				if(imgfile.exists()){
					imgfile.delete();
				}
			}
		}
		List member_list = sqlMap.queryForList("band_member_list_get", band_id); // 개인 테이블마다 있는 밴드 리스트 중 삭제된 밴드만 삭제
		for(int i = 0; i < member_list.size(); i++){
			memberdto = (memberDTO)member_list.get(i);
			bandlistdto.setBand_id(band_id);
			bandlistdto.setMember_id(memberdto.getBand_member_id());
			sqlMap.delete("member_band_delete", bandlistdto);
		}
		// 밴드목록에서 삭제 및 4개의 테이블과 3개의 시퀀스 제거
		sqlMap.delete("band_delete", band_id);
		sqlMap.delete("band_delete_table_board", band_id);
		sqlMap.delete("band_delete_sequence_board", band_id);
		sqlMap.delete("band_delete_table_comment", band_id);
		sqlMap.delete("band_delete_sequence_comment", band_id);
		sqlMap.delete("band_delete_table_member", band_id);
		sqlMap.delete("band_delete_sequence_member", band_id);
		sqlMap.delete("band_delete_table_board_imgs", band_id);
		return "redirect:/band/b_list.trip";
	}
}
