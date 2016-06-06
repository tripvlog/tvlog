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
	public String bandCreatePro(MultipartHttpServletRequest request, HttpSession session, BandDTO dto){
		
		MultipartFile b_img = request.getFile("b_img");
		session.setAttribute("memId", "Test"); // 임의 세션 값 설정
		dto.setBand_leader((String)session.getAttribute("memId"));
		sqlMap.insert("band_create", dto);
		dto.setBand_id((int)sqlMap.queryForObject("band_selectLastId", null));
		sqlMap.insert("band_create_table_board", dto.getBand_id());	// 밴드마다 게시판 테이블 생성
		sqlMap.insert("band_create_sequence_board", dto.getBand_id()); // 게시판 시퀀스 생성
		sqlMap.insert("band_create_table_comment", dto.getBand_id()); // 댓글 테이블 생성
		sqlMap.insert("band_create_table_member", dto.getBand_id()); // 멤버 테이블 생성
		sqlMap.insert("band_create_sequence_member", dto.getBand_id()); // 멤버 시퀀스 생성
		sqlMap.insert("band_create_table_board_imgs", dto.getBand_id()); // 밴드 게시물에 올라오는 이미지를 기록할 테이블 생성
		
		String leader_name = (String)sqlMap.queryForObject("member_get_name", dto.getBand_leader());
		Map map = new HashMap();
		map.put("band_id", dto.getBand_id());
		map.put("leader_id", dto.getBand_leader());
		map.put("leader_name", leader_name);
		String memberImg = (String)sqlMap.queryForObject("member_get_img", dto.getBand_leader());
		map.put("band_member_img", memberImg);
		sqlMap.insert("band_insert_leader", map); // 밴드 멤버안에 리더 추가
		
		String band_img = request.getFile("b_img").getOriginalFilename();
		
		if(!band_img.equals("")){
			
			String img_path = request.getSession().getServletContext().getRealPath("/");
			String img_name = "bI_" + dto.getBand_id();
			String img_ext = band_img.substring(band_img.lastIndexOf('.') + 1, band_img.length());
			dto.setBand_img(img_name + "." + img_ext);
			File img_save = new File(img_path + "img/band/" + img_name + "." + img_ext);

			sqlMap.update("band_imgUpload", dto);
			
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
	public String bandView(HttpServletRequest request, BandDTO banddto, memberDTO memdto, trip.member.BandListDTO bandlistdto, HttpSession session){
		banddto = (BandDTO)sqlMap.queryForObject("band_view", banddto);
		List band_board = sqlMap.queryForList("band_content", banddto.getBand_id());
		bandlistdto.setMember_id((String)session.getAttribute("memId"));
		List band_list = sqlMap.queryForList("band_my_list", bandlistdto);
		
		request.setAttribute("band_id", banddto.getBand_id());
		request.setAttribute("b_board_contents", band_board);
		request.setAttribute("band", banddto);
		request.setAttribute("band_list", band_list);
		return "/band/view_band.jsp";
	}
	
	@RequestMapping("/band/bb_write.trip")
	public String b_boardWrite(MultipartHttpServletRequest request, HttpSession session, boardDTO boarddto, imgDTO imgdto){

		List<MultipartFile> band_board_img = request.getFiles("upload_img");
		String board_imgs = "";
		session.setAttribute("memId", "kk"); // 임의 세션 값 설졍
		boarddto.setBand_board_writer((String)session.getAttribute("memId")); // 밴드 게시물은 작성자의 세션값을 받아 db에 넣음
		sqlMap.insert("band_board_write", boarddto);
		
		imgdto.setBand_id(Integer.parseInt(request.getParameter("band_id")));
		int board_maxnum = (int) sqlMap.queryForObject("band_board_num", imgdto.getBand_id());
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
