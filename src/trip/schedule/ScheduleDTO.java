package trip.schedule;

import java.sql.Timestamp;
import java.util.Date;
//schedule dto
public class ScheduleDTO {
	private int s_num;
	private String s_writer;
	private String s_title;
	private String s_startday;
	private Timestamp s_endday;
	private String s_theme;
	private String s_mainimg;
	private int s_range;
	private int s_step;
	
	public int getS_step() {
		return s_step;
	}
	public void setS_step(int s_step) {
		this.s_step = s_step;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public String getS_writer() {
		return s_writer;
	}
	public void setS_writer(String s_writer) {
		this.s_writer = s_writer;
	}
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public String getS_startday() {
		return s_startday;
	}
	public void setS_startday(String s_startday) {
		this.s_startday = s_startday;
	}
	public Timestamp getS_endday() {
		return s_endday;
	}
	public void setS_endday(Timestamp s_endday) {
		this.s_endday = s_endday;
	}
	public String getS_theme() {
		return s_theme;
	}
	public void setS_theme(String  s_theme) {
		this.s_theme = s_theme;
		
	}
	public String getS_mainimg() {
		return s_mainimg;
	}
	public void setS_mainimg(String s_mainimg) {
		this.s_mainimg = s_mainimg;
	}
	public int getS_range() {
		return s_range;
	}
	public void setS_range(int s_range) {
		this.s_range = s_range;
	}
	
}
