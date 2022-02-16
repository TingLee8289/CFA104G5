package ezs.ren_listing_pic.model;

import java.io.Serializable;

public class RenListingPicVO implements Serializable{
	
	private Integer lspID;
	private Integer lspLisID;
	private byte[] lspPic;
	
	public RenListingPicVO() {
		super();
	}
	
	public Integer getLspID() {
		return lspID;
	}
	public void setLspID(Integer lspID) {
		this.lspID = lspID;
	}
	public Integer getLspLisID() {
		return lspLisID;
	}
	public void setLspLisID(Integer lspLisID) {
		this.lspLisID = lspLisID;
	}
	public byte[] getLspPic() {
		return lspPic;
	}
	public void setLspPic(byte[] lspPic) {
		this.lspPic = lspPic;
	}

}
