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
		File file = (File)model.get("downloadFile");  //downloadFile??Όλ―Έν°λ₯? λ°μΌλ©? ?€?΄λ‘λμ°½μ λ³΄μ¬μ€??€. (?λ¬΄κ±°? μ§??  κ°??₯)
		response.setCharacterEncoding(getContentType());
		response.setContentLength((int)file.length());
		
		String fileName = java.net.URLEncoder.encode(file.getName(),"UTF-8");
		response.setHeader("Content-Disposition", "attachment;filename=\""+fileName+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;
		try{
			fis = new FileInputStream(file); //?Έ??€?Έλ¦Όμ΄ ??Ό? ?ΈλΆ? ?΄?©κΉμ? ?½?κ²μ.
			FileCopyUtils.copy(fis, out); //??ΌμΉ΄νΌ? ?Έ?΄??€λ₯Όμ¬?©?΄? μΉ΄νΌλ₯Όμ΄?©?λ©? ??Ό? ????Όλ‘? ?΄λ³΄λ΄μ€?.
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(fis != null){try{fis.close();}catch(Exception e2){}}
		}
		out.flush();
		
	}

}
