package trip.band;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public String bandCreate(){	return "/band/create_band.jsp"; }
	
	@RequestMapping("/band/b_createPro.trip")
	public String bandCreatePro(MultipartHttpServletRequest request, BandDTO dto){
		
		MultipartFile b_img = request.getFile("b_img");
		sqlMap.insert("band_create", dto);
		dto.setBand_id((int)sqlMap.queryForObject("band_selectLastId", null));
		sqlMap.insert("band_create_table_board", dto.getBand_id());
		sqlMap.insert("band_create_table_comment", dto.getBand_id());
		sqlMap.insert("band_create_table_member", dto.getBand_id());
		
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
		System.out.println(band.getBand_id() + "============== getband_id ============");
		band = (BandDTO)sqlMap.queryForObject("band_view", band);
		boardDTO band_board_content = (boardDTO)sqlMap.queryForObject("band_content", band.getBand_id());
		request.setAttribute("band_board_content", band_board_content);
		request.setAttribute("band", band);
		return "/band/view_band.jsp";
	}
}
