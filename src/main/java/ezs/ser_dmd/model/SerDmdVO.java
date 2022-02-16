package ezs.ser_dmd.model;

import java.io.Serializable;

public class SerDmdVO implements Serializable {
	private Integer dmdID;
	private Byte dmdStatus;
	private Integer dmdMemID;
	private Integer dmdSerClaID;
	private String dmdName;
	private String dmdTel;
	private String dmdMail;
	private String dmdCounty;
	private String dmdRegion;
	private String dmdAddress;
	private String dmdSpaceClass;
	private Integer dmdSquare;
	private Integer dmdBudget;
	private String dmdIntro;
	private byte[] dmdPic;

	

	public Integer getDmdID() {
		return dmdID;
	}

	public void setDmdID(Integer dmdID) {
		this.dmdID = dmdID;
	}

	public Byte getDmdStatus() {
		return dmdStatus;
	}

	public void setDmdStatus(Byte dmdStatus) {
		this.dmdStatus = dmdStatus;
	}

	public Integer getDmdMemID() {
		return dmdMemID;
	}

	public void setDmdMemID(Integer dmdMemID) {
		this.dmdMemID = dmdMemID;
	}

	public Integer getDmdSerClaID() {
		return dmdSerClaID;
	}

	public void setDmdSerClaID(Integer dmdSerClaID) {
		this.dmdSerClaID = dmdSerClaID;
	}

	public String getDmdName() {
		return dmdName;
	}

	public void setDmdName(String dmdName) {
		this.dmdName = dmdName;
	}

	public String getDmdTel() {
		return dmdTel;
	}

	public void setDmdTel(String dmdTel) {
		this.dmdTel = dmdTel;
	}

	public String getDmdMail() {
		return dmdMail;
	}

	public void setDmdMail(String dmdMail) {
		this.dmdMail = dmdMail;
	}

	public String getDmdCounty() {
		return dmdCounty;
	}

	public void setDmdCounty(String dmdCounty) {
		this.dmdCounty = dmdCounty;
	}

	public String getDmdRegion() {
		return dmdRegion;
	}

	public void setDmdRegion(String dmdRegion) {
		this.dmdRegion = dmdRegion;
	}

	public String getDmdAddress() {
		return dmdAddress;
	}

	public void setDmdAddress(String dmdAddress) {
		this.dmdAddress = dmdAddress;
	}

	public String getDmdSpaceClass() {
		return dmdSpaceClass;
	}

	public void setDmdSpaceClass(String dmdSpaceClass) {
		this.dmdSpaceClass = dmdSpaceClass;
	}

	public Integer getDmdSquare() {
		return dmdSquare;
	}

	public void setDmdSquare(Integer dmdSquare) {
		this.dmdSquare = dmdSquare;
	}

	public Integer getDmdBudget() {
		return dmdBudget;
	}

	public void setDmdBudget(Integer dmdBudget) {
		this.dmdBudget = dmdBudget;
	}

	public String getDmdIntro() {
		return dmdIntro;
	}

	public void setDmdIntro(String dmdIntro) {
		this.dmdIntro = dmdIntro;
	}

	public byte[] getDmdPic() {
		return dmdPic;
	}

	public void setDmdPic(byte[] dmdPic) {
		this.dmdPic = dmdPic;
	}

	

}
