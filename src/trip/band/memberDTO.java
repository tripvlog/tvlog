package trip.band;

import java.sql.Timestamp;

public class memberDTO {

	private int band_id;
	private String band_name;
	private int band_member_no;
	private String band_member_id;
	private String band_member_name;
	private String band_member_img;
	private int band_member_level;
	private Timestamp band_member_reg;

	

	public String getBand_name() {
		return band_name;
	}

	public void setBand_name(String band_name) {
		this.band_name = band_name;
	}

	public int getBand_id() {
		return band_id;
	}

	public void setBand_id(int band_id) {
		this.band_id = band_id;
	}

	public int getBand_member_no() {
		return band_member_no;
	}

	public void setBand_member_no(int band_member_no) {
		this.band_member_no = band_member_no;
	}

	public String getBand_member_id() {
		return band_member_id;
	}

	public void setBand_member_id(String band_member_id) {
		this.band_member_id = band_member_id;
	}

	public String getBand_member_name() {
		return band_member_name;
	}

	public void setBand_member_name(String band_member_name) {
		this.band_member_name = band_member_name;
	}

	public String getBand_member_img() {
		return band_member_img;
	}

	public void setBand_member_img(String band_member_img) {
		this.band_member_img = band_member_img;
	}

	public int getBand_member_level() {
		return band_member_level;
	}

	public void setBand_member_level(int band_member_level) {
		this.band_member_level = band_member_level;
	}

	public Timestamp getBand_member_reg() {
		return band_member_reg;
	}

	public void setBand_member_reg(Timestamp band_member_reg) {
		this.band_member_reg = band_member_reg;
	}
}
