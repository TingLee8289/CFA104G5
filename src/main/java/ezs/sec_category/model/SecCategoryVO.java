package ezs.sec_category.model;

import java.io.Serializable;

public class SecCategoryVO implements Serializable{

	private Integer shCateID;
	private String shCateName;
	
	public Integer getShCateID() {
		return shCateID;
	}
	public void setShCateID(Integer shCateID) {
		this.shCateID = shCateID;
	}
	public String getShCateName() {
		return shCateName;
	}
	public void setShCateName(String shCateName) {
		this.shCateName = shCateName;
	}
	
}
