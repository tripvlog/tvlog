package trip.post;

import java.util.Date;

public class boardVO {
	
	private String id;
	private int no;
	private String user_img;
	private int co_no;
	private int num;
	private String subject;
	private String name;
	private String password;
	private String content;
	private String file_orgname;
	private String file_savname="";
	private int readhit;
	private int good;
	private Date regdate;
	private String listimg;
	private String select_p;
	private String p_public;
	private String friend_id;
	private Date friend_reg;

	
	public Date getFriend_reg() {
		return friend_reg;
	}
	public void setFriend_reg(Date friend_reg) {
		this.friend_reg = friend_reg;
	}
	public String getFriend_id() {		return friend_id;	}
	public void setFriend_id(String friend_id) {		this.friend_id = friend_id;	}
	public String getP_public() {		return p_public;	}
	public void setP_public(String p_public) {		this.p_public = p_public;	}
	public String getSelect_p() {	return select_p;	}
	public void setSelect_p(String select_p) {		this.select_p = select_p;	}
	public void setListimg(String listimg) {
		this.listimg = listimg;
	}
	public String getUser_img() {		return user_img;	}
	public void setUser_img(String user_img) {		this.user_img = user_img;	}
	public int getCo_no() {		return co_no;	}
	public void setCo_no(int co_no) {		this.co_no = co_no;	}
	public int getNum() {		return num;	}
	public void setNum(int num) {		this.num = num;	}
	public String getId() {		return id;	}
	public void setId(String id) {		this.id = id;	}	
	public int getGood() {		return good;	}
	public void setGood(int good) {		this.good = good;	}
	public int getNo() {		return no;	}
	public void setNo(int no) {		this.no = no;	}
	public String getSubject() {		return subject;	}
	public void setSubject(String subject) {		this.subject = subject;	}
	public String getName() {		return name;	}
	public void setName(String name) {		this.name = name;	}
	public String getPassword() {		return password;	}
	public void setPassword(String password) {		this.password = password;	}
	public String getContent() {		return content;	}
	public void setContent(String content) {		this.content = content;	}
	public int getReadhit() {	return readhit;	}
	public void setReadhit(int readhit) {		this.readhit = readhit;	}
	public Date getRegdate() {		return regdate;	}
	public void setRegdate(Date regdate) {		this.regdate = regdate;	}
	public String getFile_orgname() {		return file_orgname;	}
	public void setFile_orgname(String file_orgname) {		this.file_orgname = file_orgname;	}
	public String getFile_savname() {	return file_savname;	}
	public String getListimg() {
		if(file_savname != null){
			String [] sn = file_savname.split(",");
			if(sn.length > 0){
				listimg = sn[0];
			}
		}
		return listimg;	
	}
	public void setFile_savname(String file_savname) {		this.file_savname = file_savname;	}

}


