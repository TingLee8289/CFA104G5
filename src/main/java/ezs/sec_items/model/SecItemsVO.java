package ezs.sec_items.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class SecItemsVO implements Serializable{
	private Integer shID;
	private Integer shCateID;
	private Integer shSellerID;
	private String shName;
	private BigDecimal shPrice;
	private Integer shQTY;
	private String shSize;
	private String shDescription;
	private String shCondition;
	private String shTime;
	private String shGuarantee;
	private Integer shStatus;
	private String shCounty;
	private String shDist;
	
	public Integer getShID() {
		return shID;
	}
	public void setShID(Integer shID) {
		this.shID = shID;
	}
	public Integer getShCateID() {
		return shCateID;
	}
	public void setShCateID(Integer shCateID) {
		this.shCateID = shCateID;
	}
	public Integer getShSellerID() {
		return shSellerID;
	}
	public void setShSellerID(Integer shSellerID) {
		this.shSellerID = shSellerID;
	}
	public String getShName() {
		return shName;
	}
	public void setShName(String shName) {
		this.shName = shName;
	}
	public BigDecimal getShPrice() {
		return shPrice;
	}
	public void setShPrice(BigDecimal shPrice) {
		this.shPrice = shPrice;
	}
	public Integer getShQTY() {
		return shQTY;
	}
	public void setShQTY(Integer shQTY) {
		this.shQTY = shQTY;
	}
	public String getShSize() {
		return shSize;
	}
	public void setShSize(String shSize) {
		this.shSize = shSize;
	}
	public String getShDescription() {
		return shDescription;
	}
	public void setShDescription(String shDescription) {
		this.shDescription = shDescription;
	}
	public String getShCondition() {
		return shCondition;
	}
	public void setShCondition(String shCondition) {
		this.shCondition = shCondition;
	}
	public String getShTime() {
		return shTime;
	}
	public void setShTime(String shTime) {
		this.shTime = shTime;
	}
	public String getShGuarantee() {
		return shGuarantee;
	}
	public void setShGuarantee(String shGuarantee) {
		this.shGuarantee = shGuarantee;
	}
	public Integer getShStatus() {
		return shStatus;
	}
	public void setShStatus(Integer shStatus) {
		this.shStatus = shStatus;
	}
	public String getShCounty() {
		return shCounty;
	}
	public void setShCounty(String shCounty) {
		this.shCounty = shCounty;
	}
	public String getShDist() {
		return shDist;
	}
	public void setShDist(String shDist) {
		this.shDist = shDist;
	}
	
	
}
