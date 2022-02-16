package ezs.member.model;

import java.io.Serializable;

public class MemberVO implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer memID;
	private String memUsername;
	private String memPassword;
	private String memName;
	private Byte memLandlord;
	private Byte memSupplier;
	private Byte memSeller;
	private String memPhone;
	private String memAddress;
	private String memEmail;
	private String memPID;
	private Byte memStatus;
	private byte[] memHeadshot;
	private Integer memRevCount;
	private Integer memRevScore;
	private Integer memRedCount;
	private Integer memRedScore;
	private Integer memReported;
	private Integer memLddReported;
	private Integer memSupReported;
	private Integer memSelReported;
	private String memVatno;
	public Integer getMemID() {
		return memID;
	}
	public void setMemID(Integer memID) {
		this.memID = memID;
	}
	public String getMemUsername() {
		return memUsername;
	}
	public void setMemUsername(String memUsername) {
		this.memUsername = memUsername;
	}
	public String getMemPassword() {
		return memPassword;
	}
	public void setMemPassword(String memPassword) {
		this.memPassword = memPassword;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public Byte getMemLandlord() {
		return memLandlord;
	}
	public void setMemLandlord(Byte memLandlord) {
		this.memLandlord = memLandlord;
	}
	public Byte getMemSupplier() {
		return memSupplier;
	}
	public void setMemSupplier(Byte memSupplier) {
		this.memSupplier = memSupplier;
	}
	public Byte getMemSeller() {
		return memSeller;
	}
	public void setMemSeller(Byte memSeller) {
		this.memSeller = memSeller;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemAddress() {
		return memAddress;
	}
	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemPID() {
		return memPID;
	}
	public void setMemPID(String memPID) {
		this.memPID = memPID;
	}
	public Byte getMemStatus() {
		return memStatus;
	}
	public void setMemStatus(Byte memStatus) {
		this.memStatus = memStatus;
	}
	public byte[] getMemHeadshot() {
		return memHeadshot;
	}
	public void setMemHeadshot(byte[] memHeadshot) {
		this.memHeadshot = memHeadshot;
	}
	public Integer getMemRevCount() {
		return memRevCount;
	}
	public void setMemRevCount(Integer memRevCount) {
		this.memRevCount = memRevCount;
	}
	public Integer getMemRevScore() {
		return memRevScore;
	}
	public void setMemRevScore(Integer memRevScore) {
		this.memRevScore = memRevScore;
	}
	public Integer getMemRedCount() {
		return memRedCount;
	}
	public void setMemRedCount(Integer memRedCount) {
		this.memRedCount = memRedCount;
	}
	public Integer getMemRedScore() {
		return memRedScore;
	}
	public void setMemRedScore(Integer memRedScore) {
		this.memRedScore = memRedScore;
	}
	public Integer getMemReported() {
		return memReported;
	}
	public void setMemReported(Integer memReported) {
		this.memReported = memReported;
	}
	public Integer getMemLddReported() {
		return memLddReported;
	}
	public void setMemLddReported(Integer memLddReported) {
		this.memLddReported = memLddReported;
	}
	public Integer getMemSupReported() {
		return memSupReported;
	}
	public void setMemSupReported(Integer memSupReported) {
		this.memSupReported = memSupReported;
	}
	public Integer getMemSelReported() {
		return memSelReported;
	}
	public void setMemSelReported(Integer memSelReported) {
		this.memSelReported = memSelReported;
	}
	public String getMemVatno() {
		return memVatno;
	}
	public void setMemVatno(String memVatno) {
		this.memVatno = memVatno;
	}


}
