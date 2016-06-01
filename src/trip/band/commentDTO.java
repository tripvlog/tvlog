package trip.band;

import java.sql.Timestamp;

public class commentDTO {

	private String band_board_comment_writer;
	private String band_board_comment_comment;
	private Timestamp band_board_comment_reg;
	
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
