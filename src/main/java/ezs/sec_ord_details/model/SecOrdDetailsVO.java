package ezs.sec_ord_details.model;

import java.io.Serializable;

public class SecOrdDetailsVO implements Serializable{
	private Integer shOrdID;
	private Integer shID;
	private String shName;
	private Integer shPrice;
	private Integer shQty;
	
	public Integer getShOrdID() {
		return shOrdID;
	}
	public void setShOrdID(Integer shOrdID) {
		this.shOrdID = shOrdID;
	}
	public Integer getShID() {
		return shID;
	}
	public void setShID(Integer shID) {
		this.shID = shID;
	}
	public String getShName() {
		return shName;
	}
	public void setShName(String shName) {
		this.shName = shName;
	}
	public Integer getShPrice() {
		return shPrice;
	}
	public void setShPrice(Integer shPrice) {
		this.shPrice = shPrice;
	}
	public Integer getShQty() {
		return shQty;
	}
	public void setShQty(Integer shQty) {
		this.shQty = shQty;
	}

	
	
}
