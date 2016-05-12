package trip.diary;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class DiaryAction {

	@Autowired
	private SqlMapClientTemplate sqlMap;
	
	@RequestMapping("diary.trip")
	public String diaryForm(){
		
		return "/diary/form.jsp";
	}
	@RequestMapping("submit.trip")
	public String submit(HttpServletRequest request){
		System.out.println(" access submit ");
		System.out.println("������ ������ �� : " + request.getParameter("d_content"));
		
		return "redirect:/diary/s_editor.jsp";
	}
	
	@RequestMapping("diaryPro.trip")
	public String diaryPro(HttpServletRequest req, MultipartHttpServletRequest mtreq) throws Exception{
		String originalfileName = "";
		List<MultipartFile> mf = mtreq.getFiles("profile_pt");
		System.out.println(" ==================== diaryPro start ======================= ");
		System.out.println(req.getParameter("d_title") + " is title value");
		System.out.println(req.getParameter("d_content") + " is content value");

		if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
		} else {
			for (int i = 0; i < mf.size(); i++) {
				originalfileName = mf.get(i).getOriginalFilename();
				System.out.println(originalfileName  + " is profile_pt value");
			}
		}
		System.out.println(mf.size() + " is mf.size() value");
		System.out.println(" ==================== diaryPro end ======================= ");
		return "redirect:diary.trip";
	}
	
	@RequestMapping("map.trip")
	public String map(){ return "/diary/map.jsp"; }
	
	@RequestMapping("/diary/photoUpload.trip")
	public String photoUpload(HttpServletRequest request, ImgVO dto){
		
		String callback = dto.getCallback();
		String callback_func = dto.getCallback_func();
		String file_result = "";
		
		try{
			if(dto.getFiledata() != null && dto.getFiledata().getOriginalFilename() != null && !dto.getFiledata().getOriginalFilename().equals("")){
				// ������ �����Ѵٸ�
				String original_name = dto.getFiledata().getOriginalFilename();
				String ext = original_name.substring(original_name.lastIndexOf(".") + 1);
				
				// �⺻ ���
				String defaultPath = request.getSession().getServletContext().getRealPath("/");
				// �� ���
				String path = defaultPath + "diary_imgs" + File.separator;
				File file = new File("path:" + path);
				
				// ���丮�� ������� ����
				if(!file.exists()){
					file.mkdirs();
				}
				
				// ������ ���ε� �� ���ϸ�(�ѱ۹����� ���� ������ �ø��� �ʴ°��� ����), UUID.randomUUID() : ������ ����
				String realname = UUID.randomUUID().toString() + "." + ext;
				
				// ������ ���� ����, transferTo() : MultipartFile�� �ֿ� �޼����̸�, ���ε��� ���� �����͸� ������ ���Ͽ� �����ϴ� ���
				dto.getFiledata().transferTo(new File(path + realname));
				file_result += "&bNewLine=true&sFileName=" + original_name + "&sFileURL=/diary_imgs" + realname;
				
			}else{
				file_result += "&errstr=error";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println(" =============== photoUpload Start =============== ");
		System.out.println(callback + " is callback");
		System.out.println(callback_func + " is callback_func");
		System.out.println(file_result + " is file_result");
		System.out.println(" =============== photoUpload end =============== ");
		return "redirect:" + callback + "?callback_func=" + callback_func + file_result;
	}
	
	@RequestMapping("/diary/multiplePhotoUpload.trip")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
		
		try{
			// ��������
			String sFileInfo = "";
			// ���� ���ϸ��� ����, request.getHeader("header-name") : HTTP ��û ����� header-name �̸����� �Ҵ�� ���� ����. ������ �̸��� ������ null 
			String filename = request.getHeader("file-name");
			// ���� Ȯ����
			String filename_ext = filename.substring(filename.lastIndexOf('.') + 1);
			// Ȯ���ڸ� �ҹ��ڷ� ����
			filename_ext = filename_ext.toLowerCase();
			// ���� �⺻ ���
			String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			// �� ���
			String filePath =  dftFilePath + "diary_imgs" + File.separator;
			File file = new File(filePath);
			
			if(!file.exists()){
				file.mkdirs();
			}
			String realFileNm = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new java.util.Date());
			realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			String rlFileNm = filePath + realFileNm;
			
			// ������ �����ۼ�
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(rlFileNm);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while((numRead = is.read(b,0,b.length)) != -1){
				os.write(b, 0, numRead);
			}
			if(is != null){
				is.close();
			}
			os.flush();
			os.close();
			
			// �������
			sFileInfo += "&bNewLine=true";
			// img �±��� title �Ӽ��� �������ϸ����� ��������ֱ� ����
			sFileInfo += "&sFileName=" + filename;
			sFileInfo += "&sFileURL=" + "diary_imgs" + realFileNm;
			PrintWriter print = response.getWriter();
			print.print(sFileInfo);
			print.flush();
			print.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}	
}
