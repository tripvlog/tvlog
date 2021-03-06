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
		sqlMap.insert("band_create_table_board", banddto.getBand_id());	// 諛대뱶留덈떎 寃뚯떆�뙋 �뀒�씠釉� �깮�꽦
		sqlMap.insert("band_create_sequence_board",banddto.getBand_id()); // 寃뚯떆�뙋 �떆���뒪 �깮�꽦
		sqlMap.insert("band_create_table_comment", banddto.getBand_id()); // �뙎湲� �뀒�씠釉� �깮�꽦
		sqlMap.insert("band_create_sequence_comment", banddto.getBand_id()); // �뙎湲� �떆���뒪 �깮�꽦
		sqlMap.insert("band_create_table_member", banddto.getBand_id()); // 硫ㅻ쾭 �뀒�씠釉� �깮�꽦
		sqlMap.insert("band_create_sequence_member", banddto.getBand_id()); // 硫ㅻ쾭 �떆���뒪 �깮�꽦
		sqlMap.insert("band_create_table_board_imgs", banddto.getBand_id()); // 諛대뱶 寃뚯떆臾쇱뿉 �삱�씪�삤�뒗 �씠誘몄�瑜� 湲곕줉�븷 �뀒�씠釉� �깮�꽦
		
		String leader_name = (String)sqlMap.queryForObject("member_get_name", banddto.getBand_leader());
		Map map = new HashMap();
		map.put("band_id", banddto.getBand_id());
		map.put("leader_id", banddto.getBand_leader());
		map.put("leader_name", leader_name);
		String memberImg = (String)sqlMap.queryForObject("member_get_img", banddto.getBand_leader());
		map.put("band_member_img", memberImg);
		sqlMap.insert("band_insert_leader", map); // 諛대뱶 硫ㅻ쾭�븞�뿉 由щ뜑 異붽�
		
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
		request.setAttribute("count", list.size());
		return "/band/list_band.jsp";
	}
	
	@RequestMapping("/band/b_view.trip")
	public String bandView(HttpServletRequest request, HttpSession session, int band_id, BandDTO banddto, boardDTO boarddto, memberDTO memdto, trip.member.BandListDTO bandlistdto){
		banddto = (BandDTO)sqlMap.queryForObject("band_view", band_id);
		List band_board = sqlMap.queryForList("band_content", banddto.getBand_id());
		List bandlist = sqlMap.queryForList("main_band", null); // �궗�슜�옄�뿉寃� �떎瑜� 諛대뱶 異붿쿇 
		
		if(session.getAttribute("memId") != null){	// 濡쒓렇�씤�씠 �릺�뼱�엳�떎硫� 濡쒓렇�씤�븳 �쉶�썝�뿉 諛대뱶 媛��엯 紐⑸줉�쓣 媛��졇�샂
			bandlistdto.setMember_id((String)session.getAttribute("memId"));
			List band_list = sqlMap.queryForList("band_my_list", bandlistdto);
			System.out.println(band_list.size());
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
		
		if(request.getParameter("modify").equals("complete")){ // �궡�슜�닔�젙�씪 寃쎌슦 �룞�옉
			sqlMap.update("band_modify_content", boarddto);
			for(MultipartFile multi : band_board_img){ // �깉濡� �뾽濡쒕뱶 �릺�뒗 �씠誘몄�媛� �엳�떎硫� 湲곗〈 �씠誘몄��뒗 �궘�젣
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
				sqlMap.delete("band_board_imgs_del", imgdto); // db�뿉 ���옣�맂 �씠誘몄� 紐⑸줉 �젣嫄�
				board_maxnum = boarddto.getBand_board_num();
			}
		}else{
			sqlMap.insert("band_board_write", boarddto); // �궡�슜 �옉�꽦
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
		return "redirect:/band/b_view.trip?band_id=" + band_id;
	}
	
	@RequestMapping("/band/bb_commentView.trip") // �뙎湲� 異쒕젰
	public String bb_commentView(HttpServletRequest request, int band_id, int board_num, commentDTO commentdto){
		System.out.println("bb_commentView.trip �샇異�");
		System.out.println("band_id : " + band_id + ", board_num : " + board_num);
		commentdto.setBand_board_comment_bno(board_num);
		commentdto.setBand_id(band_id);
	    List board_comment = sqlMap.queryForList("band_comment", commentdto);
	    request.setAttribute("band_id", band_id);
	    request.setAttribute("b_board_comments", board_comment);
	    return "/band/commentview_band.jsp";
	}
	
	@RequestMapping("band/bb_commentDel.trip")
	public String bb_commentDel(HttpServletRequest request, int band_id, int comment_num, commentDTO commentdto){
		System.out.println("band_id : " + band_id + ", comment_num : " + comment_num);
		commentdto.setBand_id(band_id);
		commentdto.setBand_board_comment_cno(comment_num);
		sqlMap.delete("band_comment_delete", commentdto);
		return "redirect:/band/b_view.trip?band_id=" + band_id;
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
		List bandlist = sqlMap.queryForList("main_band", null); // �궗�슜�옄�뿉寃� �떎瑜� 諛대뱶 異붿쿇 
		banddto = (BandDTO)sqlMap.queryForObject("band_view", band_id);
		if(session.getAttribute("memId") != null){	// 濡쒓렇�씤�씠 �릺�뼱�엳�떎硫� 濡쒓렇�씤�븳 �쉶�썝�뿉 諛대뱶 媛��엯 紐⑸줉�쓣 媛��졇�샂
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
				if(!bef_img.equals("") && !bef_img.equals("default.jpg")){ // db�뿉 湲곗〈 �씠誘몄�媛� �엳�쓣 寃쎌슦 �궘�젣
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
		if(confirm.equals("yes")){ // 諛대뱶由щ뜑媛� 媛��엯�듅�씤
			sqlMap.update("band_join_confirm", memberdto);
			banddto = (BandDTO)sqlMap.queryForObject("band_view", band_id);
			bandlistdto.setBand_id(band_id);
			bandlistdto.setBand_name(banddto.getBand_name());
			bandlistdto.setBand_img(banddto.getBand_img());
			bandlistdto.setMember_id(memberdto.getBand_member_id());
			
			// �듅�씤�맂 id db�뿉 �엳�뒗 諛대뱶紐⑸줉�뿉 �빐�떦 諛대뱶 異붽��빐�빞�븿
			sqlMap.insert("band_insert_my_list", bandlistdto);
			return "redirect:/band/b_modify.trip?band_id=" + band_id;
		}else{	// 諛대뱶 媛��엯 �떊泥�
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
		List check = sqlMap.queryForList("band_member_list_get", band_id);
		
		if(check.size() == 0){
			System.out.println("check.size : " + check.size());
			b_drop(request, band_id, null, null, null);
		}
		return "redirect:/band/b_list.trip";
	}
	
	@RequestMapping("/band/b_drop.trip")
	public String b_drop(HttpServletRequest request, int band_id, imgDTO imgdto, memberDTO memberdto, trip.member.BandListDTO bandlistdto){
		String band_img = (String)sqlMap.queryForObject("band_img_get", band_id); // 諛대뱶 ���몴 �씠誘몄� �궘�젣
		if(!band_img.equals("default.jpg")){
			String filePath = request.getSession().getServletContext().getRealPath("/") + "img" + File.separator + "band" + File.separator;
			String img = filePath + band_img;
			File imgfile = new File(img);
			if(imgfile.exists()){
				imgfile.delete();
			}
		}
		List board_imgs = sqlMap.queryForList("band_board_img_get", band_id); // 諛대뱶 寃뚯떆�뙋 �씠誘몄� �궘�젣
		for(int i = 0; i < board_imgs.size(); i++){
			imgdto = (imgDTO)board_imgs.get(i);
			String filePath = request.getSession().getServletContext().getRealPath("/") + "img" + File.separator + "band" + File.separator;
			String img = filePath + imgdto.getBoard_img();
			File imgfile = new File(img);
			if(imgfile.exists()){
				imgfile.delete();
			}
		}
		List member_imgs = sqlMap.queryForList("band_member_img_get", band_id); // 諛대뱶 媛��엯�썑 �닔�젙�븳 �봽濡쒗븘 �궗吏� �궘�젣
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
		List member_list = sqlMap.queryForList("band_member_list_get", band_id); // 媛쒖씤 �뀒�씠釉붾쭏�떎 �엳�뒗 諛대뱶 由ъ뒪�듃 以� �궘�젣�맂 諛대뱶留� �궘�젣
		for(int i = 0; i < member_list.size(); i++){
			memberdto = (memberDTO)member_list.get(i);
			bandlistdto.setBand_id(band_id);
			bandlistdto.setMember_id(memberdto.getBand_member_id());
			sqlMap.delete("member_band_delete", bandlistdto);
		}
		// 諛대뱶紐⑸줉�뿉�꽌 �궘�젣 諛� 4媛쒖쓽 �뀒�씠釉붽낵 3媛쒖쓽 �떆���뒪 �젣嫄�
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
