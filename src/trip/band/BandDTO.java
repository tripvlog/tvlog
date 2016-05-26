package trip.band;

import java.sql.Timestamp;

public class BandDTO {

	private int band_id;
	private String band_name;
	private String band_leader;
	private String band_img;
	private String band_intro;
	private int band_range;
	private Timestamp band_reg;
	
	public int getBand_id() { return band_id; }
	public void setBand_id(int band_id) { this.band_id = band_id; }
	public String getBand_name() { return band_name; }
	public void setBand_name(String band_name) { this.band_name = band_name; }
	public String getBand_leader() { return band_leader; }
	public void setBand_leader(String band_leader) { this.band_leader = band_leader; }
	public String getBand_img() { return band_img; }
	public void setBand_img(String band_img) { this.band_img = band_img; }
	public String getBand_intro() { return band_intro; }
	public void setBand_intro(String band_intro) { this.band_intro = band_intro; }
	public int getBand_range() { return band_range; }
	public void setBand_range(int band_range) { this.band_range = band_range; }
	public Timestamp getBand_reg() { return band_reg; }
	public void setBand_reg(Timestamp band_reg) { this.band_reg = band_reg; }
}
