package trip.band;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		session.setAttribute("memId", "test111"); // 임의 세션 값 설정
		dto.setBand_leader((String)session.getAttribute("memId"));
		sqlMap.insert("band_create", dto);
		dto.setBand_id((int)sqlMap.queryForObject("band_selectLastId", null));
		sqlMap.insert("band_create_table_board", dto.getBand_id());	// 밴드마다 게시판 테이블 생성
		sqlMap.insert("band_create_sequence_board", dto.getBand_id()); // 게시판 시퀀스 생성
		sqlMap.insert("band_create_table_comment", dto.getBand_id()); // 댓글 테이블 생성
		sqlMap.insert("band_create_table_member", dto.getBand_id()); // 멤버 테이블 생성
		sqlMap.insert("band_create_sequence_member", dto.getBand_id()); // 멤버 시퀀스 생성
		
		Map map = new HashMap();
		map.put("band_id", dto.getBand_id());
		map.put("member_id", dto.getBand_leader());
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
		boardDTO band_board_content = (boardDTO)sqlMap.queryForObject("band_content", band.getBand_id());
		request.setAttribute("band_board_content", band_board_content);
		request.setAttribute("band", band);
		return "/band/view_band.jsp";
	}
	
	@RequestMapping("/band/b_write.trip")
	public String bandWrite(HttpServletRequest request, HttpSession session){
		System.out.println(" *** b_write.trip start *** ");
		System.out.println(request.getParameter("band_board_content"));
		System.out.println(request.getParameterValues("band_board_img"));
		System.out.println(" *** b_write.trip end *** ");
		return "redirect:/band/b_view.trip?band_id=" + request.getParameter("band_id");
	}
}
