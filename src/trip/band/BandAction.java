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
		session.setAttribute("memId", "asdf"); // 임의 세션 값 설정
		dto.setBand_leader((String)session.getAttribute("memId"));
		sqlMap.insert("band_create", dto);
		dto.setBand_id((int)sqlMap.queryForObject("band_selectLastId", null));
		sqlMap.insert("band_create_table_board", dto.getBand_id());	// 밴드마다 게시판 테이블 생성
		sqlMap.insert("band_create_sequence_board", dto.getBand_id()); // 게시판 시퀀스 생성
		sqlMap.insert("band_create_table_comment", dto.getBand_id()); // 댓글 테이블 생성
		sqlMap.insert("band_create_table_member", dto.getBand_id()); // 멤버 테이블 생성
		sqlMap.insert("band_create_sequence_member", dto.getBand_id()); // 멤버 시퀀스 생성
		
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
	public String bandView(HttpServletRequest request, BandDTO band){
		band = (BandDTO)sqlMap.queryForObject("band_view", band);
		List band_board = sqlMap.queryForList("band_content", band.getBand_id());
		//List member_info = sqlMap.queryForList("band_member_info", );
		// 게시글을 등록한 회원에 대해 닉네임, 프로필 사진을 가져와 View 부분에 보여줘야함
		request.setAttribute("b_board_contents", band_board);
		request.setAttribute("band", band);
		return "/band/view_band.jsp";
	}
	
	@RequestMapping("/band/b_write.trip")
	public String bandWrite(MultipartHttpServletRequest request, HttpSession session, boardDTO dto){
		
		List<MultipartFile> band_board_img = request.getFiles("board_img");
		String board_imgs = "";
			
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
				System.out.println(file);
				board_imgs = board_imgs + "<img src=/tvlog/img/band/" +filesavName + "." + fileName_ext + "> ";
				if(!file.exists())
					file.mkdirs();
				
				try{
					multi.transferTo(file);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		session.setAttribute("memId", "hEllO");
		dto.setBand_board_writer((String)session.getAttribute("memId"));
		dto.setBand_board_img(board_imgs);
		sqlMap.insert("band_board_write", dto);
		return "redirect:/band/b_view.trip?band_id=" + request.getParameter("band_id");
	}
}
