package ezs.ser_ad.model;

import java.io.Serializable;



public class SerAdVO implements Serializable {
	private Integer adVdrID;
	private Byte adStatus;
	private Integer adSerClaID;
	private String adDist;
	private String adTxt;
	private byte[] adPic;
	public Integer getAdVdrID() {
		return adVdrID;
	}
	public void setAdVdrID(Integer adVdrID) {
		this.adVdrID = adVdrID;
	}
	public Byte getAdStatus() {
		return adStatus;
	}
	public void setAdStatus(Byte adStatus) {
		this.adStatus = adStatus;
	}
	public Integer getAdSerClaID() {
		return adSerClaID;
	}
	public void setAdSerClaID(Integer adSerClaID) {
		this.adSerClaID = adSerClaID;
	}
	public String getAdDist() {
		return adDist;
	}
	public void setAdDist(String adDist) {
		this.adDist = adDist;
	}
	public String getAdTxt() {
		return adTxt;
	}
	public void setAdTxt(String adTxt) {
		this.adTxt = adTxt;
	}
	public byte[] getAdPic() {
		return adPic;
	}
	public void setAdPic(byte[] adPic) {
		this.adPic = adPic;
	}
	
	
	



	

}
