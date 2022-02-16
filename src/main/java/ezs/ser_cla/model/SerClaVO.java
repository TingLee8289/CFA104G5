package ezs.ser_cla.model;

import java.io.Serializable;

public class SerClaVO implements Serializable {
	private Integer serClaID;
	private String serClaName;

	public Integer getSerClaID() {
		return serClaID;
	}

	public void setSerClaID(Integer serClaID) {
		this.serClaID = serClaID;
	}

	public String getSerClaName() {
		return serClaName;
	}

	public void setSerClaName(String serClaName) {
		this.serClaName = serClaName;
	}

}
