package trip.Diary;

public class ImgDto {

	private int imgs_file_num;
	private String imgs_ori_name;
	private String imgs_sav_name;
	
	public void SetImgs_file_num(int imgs_file_num){ this.imgs_file_num = imgs_file_num; }
	public int getImgs_file_num(){ return imgs_file_num; }
	
	public void setImgs_ori_name(String imgs_ori_name){ this.imgs_ori_name = imgs_ori_name; }
	public String getImgs_ori_name(){ return imgs_ori_name; }
	
	public void setImgs_sav_name(String imgs_sav_name){ this.imgs_sav_name = imgs_sav_name; }
	public String getImgs_sav_name(){ return imgs_sav_name; }
	
}