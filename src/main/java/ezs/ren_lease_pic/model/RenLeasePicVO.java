package ezs.ren_lease_pic.model;

import java.io.Serializable;

public class RenLeasePicVO implements Serializable{
	
	private Integer lpId;
	private Integer lpLeaseId; 
	private byte[] lpPic;
	
	public RenLeasePicVO() {
		super();
	}

	public Integer getLpId() {
		return lpId;
	}

	public void setLpId(Integer lpId) {
		this.lpId = lpId;
	}

	public Integer getLpLeaseId() {
		return lpLeaseId;
	}

	public void setLpLeaseId(Integer lpLeaseId) {
		this.lpLeaseId = lpLeaseId;
	}

	public byte[] getLpPic() {
		return lpPic;
	}

	public void setLpPic(byte[] lpPic) {
		this.lpPic = lpPic;
	}
}
