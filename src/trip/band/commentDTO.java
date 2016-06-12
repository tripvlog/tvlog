package trip.band;

import java.sql.Timestamp;

public class commentDTO {

	private int band_id;
	private int band_board_comment_bno;
	private int band_board_comment_cno;
	private String band_board_comment_writer;
	private String band_board_comment_comment;
	private Timestamp band_board_comment_reg;

	public int getBand_id() {
		return band_id;
	}

	public void setBand_id(int band_id) {
		this.band_id = band_id;
	}

	public int getBand_board_comment_bno() {
		return band_board_comment_bno;
	}

	public void setBand_board_comment_bno(int band_board_comment_bno) {
		this.band_board_comment_bno = band_board_comment_bno;
	}

	public int getBand_board_comment_cno() {
		return band_board_comment_cno;
	}

	public void setBand_board_comment_cno(int band_board_comment_cno) {
		this.band_board_comment_cno = band_board_comment_cno;
	}

	public String getBand_board_comment_writer() {
		return band_board_comment_writer;
	}

	public void setBand_board_comment_writer(String band_board_comment_writer) {
		this.band_board_comment_writer = band_board_comment_writer;
	}

	public String getBand_board_comment_comment() {
		return band_board_comment_comment;
	}

	public void setBand_board_comment_comment(String band_board_comment_comment) {
		this.band_board_comment_comment = band_board_comment_comment;
	}

	public Timestamp getBand_board_comment_reg() {
		return band_board_comment_reg;
	}

	public void setBand_board_comment_reg(Timestamp band_board_comment_reg) {
		this.band_board_comment_reg = band_board_comment_reg;
	}
}
