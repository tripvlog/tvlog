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
		listdto.setBand_img(banddto.getBand_img());
		listdto.setMember_id((String)session.getAttribute("memId"));
		sqlMap.insert("band_insert_my_list", listdto);
		String band_img = request.getFile("b_img").getOriginalFilename();
		
		if(!band_img.equals("")){
			
			String img_path = request.getSession().getServletContext().getRealPath("/");
			String img_name = "bI_" + banddto.getBand_id();
			String img_ext = band_img.substring(band_img.lastIndexOf('.') + 1, band_img.length());
			banddto.setBand_img(img_name + "." + img_ext);
			File img_save = new File(img_path + "img/band/" + img_name + "." + img_ext);

			sqlMap.update("band_imgUpload", banddto);
			
			try {
				b_img.transferTo(img_save);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:/band/b_list.trip";
	}
	
	@RequestMapping("/band/b_list.trip")
	public String bandList(HttpServletRequest request){
		List list = sqlMap.queryForList("band_select", null);
		request.setAttribute("b_list", list);
		return "/band/list_band.jsp";
	}
	
	@RequestMapping("/band/b_view.trip")
	public String bandView(HttpServletRequest request, HttpSession session, int band_id, BandDTO banddto, boardDTO boarddto, memberDTO memdto, trip.member.BandListDTO bandlistdto){
		banddto = (BandDTO)sqlMap.queryForObject("band_view", banddto);
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
					List board_img = sqlMap.queryForList("band_img_select", imgdto);
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
	
	@RequestMapping("/band/bb_delete.trip")
	public String b_boardDelete(imgDTO imgdto, HttpSession session, HttpServletRequest request){
		List band_board_img = sqlMap.queryForList("band_img_select", imgdto);
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
	
}
