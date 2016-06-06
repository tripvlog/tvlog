package trip.member;

import java.sql.Timestamp;

public class FriendListDTO {

	private int friend_no;
	private String friend_id;
	private String friend_name;
	private int friend_state;
	private Timestamp friend_reg;
	private String member_id;

	public int getFriend_no() {
		return friend_no;
	}

	public void setFriend_no(int friend_no) {
		this.friend_no = friend_no;
	}

	public String getFriend_id() {
		return friend_id;
	}

	public void setFriend_id(String friend_id) {
		this.friend_id = friend_id;
	}

	public String getFriend_name() {
		return friend_name;
	}

	public void setFriend_name(String friend_name) {
		this.friend_name = friend_name;
	}

	public int getFriend_state() {
		return friend_state;
	}

	public void setFriend_state(int friend_state) {
		this.friend_state = friend_state;
	}

	public Timestamp getFriend_reg() {
		return friend_reg;
	}

	public void setFriend_reg(Timestamp friend_reg) {
		this.friend_reg = friend_reg;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

}
