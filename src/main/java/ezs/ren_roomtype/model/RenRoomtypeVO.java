package ezs.ren_roomtype.model;

import java.io.Serializable;

public class RenRoomtypeVO implements Serializable {
	private Integer rtID;
	private String rtType;
	
	public RenRoomtypeVO() {
		super();
	}
	public Integer getRtID() {
		return rtID;
	}
	public void setRtID(Integer rtID) {
		this.rtID = rtID;
	}
	public String getRtType() {
		return rtType;
	}
	public void setRtType(String rtType) {
		this.rtType = rtType;
	}
}
