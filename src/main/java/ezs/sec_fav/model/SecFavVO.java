package ezs.sec_fav.model;

import java.io.Serializable;
import java.sql.Date;

public class SecFavVO implements Serializable{
	
	private Integer shMemID;
	private Integer shID;
	private Date shAddFavTime;
	
	public Integer getShMemID() {
		return shMemID;
	}
	public void setShMemID(Integer shMemID) {
		this.shMemID = shMemID;
	}
	public Integer getShID() {
		return shID;
	}
	public void setShID(Integer shID) {
		this.shID = shID;
	}
	public Date getShAddFavTime() {
		return shAddFavTime;
	}
	public void setShAddFavTime(Date shAddFavTime) {
		this.shAddFavTime = shAddFavTime;
	}
	
	
	
	
}
