package ezs.ren_landlord.model;

import java.io.Serializable;

public class RenLandlordVO implements Serializable{
	private Integer lddId;
	private Integer lddMemId;
	private Integer lddApproval;
	
	public Integer getLddId() {
		return lddId;
	}

	public void setLddId(Integer lddId) {
		this.lddId = lddId;
	}

	public Integer getLddMemId() {
		return lddMemId;
	}

	public void setLddMemId(Integer lddMemId) {
		this.lddMemId = lddMemId;
	}

	public Integer getLddApproval() {
		return lddApproval;
	}

	public void setLddApproval(Integer lddApproval) {
		this.lddApproval = lddApproval;
	}
}
