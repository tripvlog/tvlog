package trip.post;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView{
	public DownloadView(){
		setContentType("application/download;charset=utf-8");
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		File file = (File)model.get("downloadFile");  //downloadFile?ŒŒ?¼ë¯¸í„°ë¥? ë°›ìœ¼ë©? ?‹¤?š´ë¡œë“œì°½ì„ ë³´ì—¬ì¤??‹¤. (?•„ë¬´ê±°?‚˜ ì§?? • ê°??Š¥)
		response.setCharacterEncoding(getContentType());
		response.setContentLength((int)file.length());
		
		String fileName = java.net.URLEncoder.encode(file.getName(),"UTF-8");
		response.setHeader("Content-Disposition", "attachment;filename=\""+fileName+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;
		try{
			fis = new FileInputStream(file); //?¸?’‹?Š¤?Š¸ë¦¼ì´ ?ŒŒ?¼?˜ ?„¸ë¶? ?‚´?š©ê¹Œì? ?½?Š”ê²ƒì„.
			FileCopyUtils.copy(fis, out); //?ŒŒ?¼ì¹´í”¼?œ ?‹¸?´?˜?Š¤ë¥¼ì‚¬?š©?•´?„œ ì¹´í”¼ë¥¼ì´?š©?•˜ë©? ?ŒŒ?¼?„ ?•„?›ƒ?’‹?œ¼ë¡? ?‚´ë³´ë‚´ì¤?.
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(fis != null){try{fis.close();}catch(Exception e2){}}
		}
		out.flush();
		
	}

}
