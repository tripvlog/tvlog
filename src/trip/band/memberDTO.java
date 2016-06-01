package trip.band;

import java.sql.Timestamp;

public class memberDTO {

	private int band_member_no;
	private String band_member;
	private String band_member_img;
	private int band_member_level;
	private Timestamp band_member_reg;

	public int getBand_member_no() {
		return band_member_no;
	}

	public void setBand_member_no(int band_member_no) {
		this.band_member_no = band_member_no;
	}

	public String getBand_member() {
		return band_member;
	}

	public void setBand_member(String band_member) {
		this.band_member = band_member;
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
