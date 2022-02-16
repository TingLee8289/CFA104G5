package ezs.sec_pics.model;

import java.io.Serializable;

public class SecPicsVO implements Serializable{
	
	private Integer shPicID;
	private Integer shID;
	private byte[] shPic;
	public Integer getShPicID() {
		return shPicID;
	}
	public void setShPicID(Integer shPicID) {
		this.shPicID = shPicID;
	}
	public Integer getShID() {
		return shID;
	}
	public void setShID(Integer shID) {
		this.shID = shID;
	}
	public byte[] getShPic() {
		return shPic;
	}
	public void setShPic(byte[] shPic) {
		this.shPic = shPic;
	}

	
}
