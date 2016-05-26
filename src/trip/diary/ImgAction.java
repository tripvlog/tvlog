package trip.diary;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ImgAction {

	@RequestMapping("photoUpload.trip")
	public String photoUpload(HttpServletRequest request, ImgVO dto){
		// 단일 업로드. 현재는 되지 않음
		String callback = dto.getCallback();
		String callback_func = dto.getCallback_func();
		String file_result = "";
		
		try{
			if(dto.getFiledata() != null && dto.getFiledata().getOriginalFilename() != null && !dto.getFiledata().getOriginalFilename().equals("")){
				// 파일이 존재한다면
				String original_name = dto.getFiledata().getOriginalFilename();
				String ext = original_name.substring(original_name.lastIndexOf(".") + 1);
				
				// 기본 경로
				String defaultPath = request.getSession().getServletContext().getRealPath("/");
				// 상세 경로
				String path = defaultPath + "img" + File.separator + "diary" + File.separator;
				File file = new File("path:" + path);
				
				// 디렉토리가 없을경우 생성
				if(!file.exists()){
					file.mkdirs();
				}
				
				// 서버에 업로드 할 파일명(한글문제로 인해 원본은 올리지 않는것이 좋음), UUID.randomUUID() : 고유값 생성
				String realname = UUID.randomUUID().toString() + "." + ext;
				
				// 서버에 파일 쓰기, transferTo() : MultipartFile의 주요 메서드이며, 업로드한 파일 데이터를 지정한 파일에 저장하는 기능
				dto.getFiledata().transferTo(new File(path + realname));
				file_result += "&bNewLine=true&sFileName=" + original_name + "&sFileURL=/tvlog/img/diary/" + realname;
				
			}else{
				file_result += "&errstr=error";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:" + callback + "?callback_func=" + callback_func + file_result;
	}
	
	@RequestMapping("multiplePhotoUpload.trip")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
		// 크롬에서 이욯하는 드래그 앤 드롭 업로드 방식(또는 다중 업로드)
		try{
			// 파일정보
			String sFileInfo = "";
			// 원본 파일명을 받음, request.getHeader("header-name") : HTTP 요청 헤더에 header-name 이름으로 할당된 값을 리턴. 지정된 이름이 없으면 null 
			String filename = request.getHeader("file-name");
			// 파일 확장자
			String filename_ext = filename.substring(filename.lastIndexOf('.') + 1);
			// 확장자를 소문자로 변경
			filename_ext = filename_ext.toLowerCase();
			// 파일 기본 경로
			String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			// 상세 경로
			String filePath =  dftFilePath + "img" + File.separator + "diary" + File.separator;
			File file = new File(filePath);
			
			if(!file.exists()){
				file.mkdirs();
			}
			String realFileNm = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new java.util.Date());
			realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			String rlFileNm = filePath + realFileNm;
			
			// 서버에 파일작성
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
			
			// 정보출력
			sFileInfo += "&bNewLine=true";
			// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
			sFileInfo += "&sFileName=" + filename;
			sFileInfo += "&sFileURL=" + "/tvlog/img/diary/" + realFileNm;
			PrintWriter print = response.getWriter();
			print.print(sFileInfo);
			print.flush();
			print.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
