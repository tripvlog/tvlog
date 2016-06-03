package trip.band;

import java.sql.Timestamp;

public class boardDTO {

	private int band_id;
	private String name;
	private String path;
	private int band_board_num;
	private int band_board_notice;
	private String band_board_writer;
	private String band_board_img;
	private String band_board_content;
	private int band_board_readcount;
	private Timestamp band_board_reg;

	public int getBand_id() {
		return band_id;
	}

	public void setBand_id(int band_id) {
		this.band_id = band_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getBand_board_num() {
		return band_board_num;
	}

	public void setBand_board_num(int band_board_num) {
		this.band_board_num = band_board_num;
	}

	public int getBand_board_notice() {
		return band_board_notice;
	}

	public void setBand_board_notice(int band_board_notice) {
		this.band_board_notice = band_board_notice;
	}

	public String getBand_board_writer() {
		return band_board_writer;
	}

	public void setBand_board_writer(String band_board_writer) {
		this.band_board_writer = band_board_writer;
	}

	public String getBand_board_img() {
		return band_board_img;
	}

	public void setBand_board_img(String band_board_img) {
		this.band_board_img = band_board_img;
	}

	public String getBand_board_content() {
		return band_board_content;
	}

	public void setBand_board_content(String band_board_content) {
		this.band_board_content = band_board_content;
	}

	public int getBand_board_readcount() {
		return band_board_readcount;
	}

	public void setBand_board_readcount(int band_board_readcount) {
		this.band_board_readcount = band_board_readcount;
	}

	public Timestamp getBand_board_reg() {
		return band_board_reg;
	}

	public void setBand_board_reg(Timestamp band_board_reg) {
		this.band_board_reg = band_board_reg;
	}
}
