package ezs.sec_ord_details.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class SecOrdDetailsVO implements Serializable{
	private Integer shOrdID;
	private Integer shID;
	private String shName;
	private BigDecimal shPrice;
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
	public BigDecimal getShPrice() {
		return shPrice;
	}
	public void setShPrice(BigDecimal shPrice) {
		this.shPrice = shPrice;
	}
	public Integer getShQty() {
		return shQty;
	}
	public void setShQty(Integer shQty) {
		this.shQty = shQty;
	}

	
	
}
