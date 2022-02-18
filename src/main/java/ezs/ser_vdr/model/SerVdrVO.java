package ezs.ser_vdr.model;

import java.io.Serializable;

public class SerVdrVO implements Serializable {
	private Integer vdrID;
	private Byte vdrStatus;
	private String vdrName;
	private String vdrTel;
	private String vdrVatno;
	private String vdrCounty;
	private String vdrDist;
	private String vdrAddr;
	private String vdrOpen;
	private String vdrIntro;
	private byte[] vdrPic;
	private Integer vdrRevCount;
	private Integer vdrRevScore;
	public Integer getVdrID() {
		return vdrID;
	}
	public void setVdrID(Integer vdrID) {
		this.vdrID = vdrID;
	}
	public Byte getVdrStatus() {
		return vdrStatus;
	}
	public void setVdrStatus(Byte vdrStatus) {
		this.vdrStatus = vdrStatus;
	}
	public String getVdrName() {
		return vdrName;
	}
	public void setVdrName(String vdrName) {
		this.vdrName = vdrName;
	}
	public String getVdrTel() {
		return vdrTel;
	}
	public void setVdrTel(String vdrTel) {
		this.vdrTel = vdrTel;
	}
	public String getVdrVatno() {
		return vdrVatno;
	}
	public void setVdrVatno(String vdrVatno) {
		this.vdrVatno = vdrVatno;
	}
	public String getVdrCounty() {
		return vdrCounty;
	}
	public void setVdrCounty(String vdrCounty) {
		this.vdrCounty = vdrCounty;
	}
	public String getVdrDist() {
		return vdrDist;
	}
	public void setVdrDist(String vdrDist) {
		this.vdrDist = vdrDist;
	}
	public String getVdrAddr() {
		return vdrAddr;
	}
	public void setVdrAddr(String vdrAddr) {
		this.vdrAddr = vdrAddr;
	}
	public String getVdrOpen() {
		return vdrOpen;
	}
	public void setVdrOpen(String vdrOpen) {
		this.vdrOpen = vdrOpen;
	}
	public String getVdrIntro() {
		return vdrIntro;
	}
	public void setVdrIntro(String vdrIntro) {
		this.vdrIntro = vdrIntro;
	}
	public byte[] getVdrPic() {
		return vdrPic;
	}
	public void setVdrPic(byte[] vdrPic) {
		this.vdrPic = vdrPic;
	}
	public Integer getVdrRevCount() {
		return vdrRevCount;
	}
	public void setVdrRevCount(Integer vdrRevCount) {
		this.vdrRevCount = vdrRevCount;
	}
	public Integer getVdrRevScore() {
		return vdrRevScore;
	}
	public void setVdrRevScore(Integer vdrRevScore) {
		this.vdrRevScore = vdrRevScore;
	}
	
	

	
}
