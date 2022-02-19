package ezs.admin_emp.model;

import java.io.Serializable;
import java.util.List;

import ezs.admin_priv.model.AdminPrivVO;

public class AdminEmpVO implements Serializable{
	private Integer admID;
	private String admUsername;
	private String admPassword;
	private Integer admStatus;
	
	private List<AdminPrivVO> authlist;//擁有的權限功能
	
	
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

	public List<AdminPrivVO> getAuthlist() {
		return authlist;
	}

	public void setAuthlist(List<AdminPrivVO> authlist) {
		this.authlist = authlist;
	}
	
	
}
