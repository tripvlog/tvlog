package trip.member;

import java.sql.Timestamp;

public class BandListDTO {

	private int band_no;
	private int band_id;
	private String band_name;
	private String band_img;
	private Timestamp band_reg;
	private String member_id;

	public int getBand_no() {
		return band_no;
	}

	public void setBand_no(int band_no) {
		this.band_no = band_no;
	}

	public int getBand_id() {
		return band_id;
	}

	public void setBand_id(int band_id) {
		this.band_id = band_id;
	}

	public String getBand_name() {
		return band_name;
	}

	public void setBand_name(String band_name) {
		this.band_name = band_name;
	}

	public String getBand_img() {
		return band_img;
	}

	public void setBand_img(String band_img) {
		this.band_img = band_img;
	}

	public Timestamp getBand_reg() {
		return band_reg;
	}

	public void setBand_reg(Timestamp band_reg) {
		this.band_reg = band_reg;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

}
