package trip.diary;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class ImgVO {
	
	private MultipartFile Filedata;
	private String callback;
	private String callback_func;
	
	private int diary_num;
	private String diary_writer;
	private String diary_title;
	private String diary_content;
	private String diary_location;
	private int diary_range;
	private Timestamp diary_reg;
	
	public void setDiary_num(int diary_num){ this.diary_num = diary_num; }
	public void setDiary_writer(String diary_writer) { this.diary_writer = diary_writer; }
	public void setDiary_title(String diary_title) { this.diary_title = diary_title; }
	public void setDiary_content(String diary_content) { this.diary_content = diary_content; }
	public void setDiary_location(String diary_location){ this.diary_location = diary_location; }
	public void setDiary_range(int diary_range) { this.diary_range = diary_range; }
	public void setDiary_reg(Timestamp  diary_reg) { this.diary_reg = diary_reg; }
	public void setFiledata(MultipartFile filedata) { Filedata = filedata; }
	public void setCallback(String callback) { this.callback = callback; }
	public void setCallback_func(String callback_func) { this.callback_func = callback_func; }
	
	public int getDiary_num(){ return diary_num; }
	public String getDiary_writer() { return diary_writer; }
	public String getDiary_title() { return diary_title; }
	public String getDiary_content() { return diary_content; }
	public String getDiary_location() { return diary_location; }
	public int getDiary_range() { return diary_range; }
	public Timestamp getDiary_reg() { return diary_reg; }
	public MultipartFile getFiledata() { return Filedata; }
	public String getCallback() { return callback; }
	public String getCallback_func() { return callback_func; }
}
