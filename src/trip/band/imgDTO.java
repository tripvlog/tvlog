package trip.band;

import java.sql.Timestamp;

public class imgDTO {

	private int band_id;
	private int board_num;
	private String board_writer;
	private String board_img;
	private Timestamp board_img_reg;

	public void setBand_id(int band_id) {
		this.band_id = band_id;
	}

	public int getBand_id() {
		return band_id;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getBoard_writer() {
		return board_writer;
	}

	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}

	public String getBoard_img() {
		return board_img;
	}

	public void setBoard_img(String board_img) {
		this.board_img = board_img;
	}

	public Timestamp getBoard_img_reg() {
		return board_img_reg;
	}

	public void setBoard_img_reg(Timestamp board_img_reg) {
		this.board_img_reg = board_img_reg;
	}
}
