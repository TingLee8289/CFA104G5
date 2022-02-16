package ezs.admin_priv.model;

import java.io.Serializable;

public class AdminPrivVO implements Serializable{
	private Integer admID;
	private Integer funID;

	public Integer getAdmID() {
		return admID;
	}

	public void setAdmID(Integer admID) {
		this.admID = admID;
	}

	public Integer getFunID() {
		return funID;
	}

	public void setFunID(Integer funID) {
		this.funID = funID;
	}

}
