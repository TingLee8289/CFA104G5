package ezs.admin_emp.model;

import java.io.Serializable;

public class AdminEmpVO implements Serializable{
	private Integer admID;
	private String admUsername;
	private String admPassword;
	private Integer admStatus;

	public Integer getAdmID() {
		return admID;
	}

	public void setAdmID(Integer admID) {
		this.admID = admID;
	}

	public String getAdmUsername() {
		return admUsername;
	}

	public void setAdmUsername(String admUsername) {
		this.admUsername = admUsername;
	}

	public String getAdmPassword() {
		return admPassword;
	}

	public void setAdmPassword(String admPassword) {
		this.admPassword = admPassword;
	}

	public Integer getAdmStatus() {
		return admStatus;
	}

	public void setAdmStatus(Integer admStatus) {
		this.admStatus = admStatus;
	}

}
