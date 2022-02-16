package ezs.ser_quo.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;


public class SerQuoVO implements Serializable{
	private Integer quoID;
	private Byte quoStatus;
	private Integer quoDmdID;
	private Integer quoVdrID;
	private Date quoDate;
	private Date quoExpiryDate;
	private String quoItem;
	private BigDecimal quoTotalPrice;
	
	public Integer getQuoID() {
		return quoID;
	}
	public void setQuoID(Integer quoID) {
		this.quoID = quoID;
	}
	public Byte getQuoStatus() {
		return quoStatus;
	}
	public void setQuoStatus(Byte quoStatus) {
		this.quoStatus = quoStatus;
	}
	public Integer getQuoDmdID() {
		return quoDmdID;
	}
	public void setQuoDmdID(Integer quoDmdID) {
		this.quoDmdID = quoDmdID;
	}
	public Integer getQuoVdrID() {
		return quoVdrID;
	}
	public void setQuoVdrID(Integer quoVdrID) {
		this.quoVdrID = quoVdrID;
	}
	public Date getQuoDate() {
		return quoDate;
	}
	public void setQuoDate(Date quoDate) {
		this.quoDate = quoDate;
	}
	public Date getQuoExpiryDate() {
		return quoExpiryDate;
	}
	public void setQuoExpiryDate(Date quoExpiryDate) {
		this.quoExpiryDate = quoExpiryDate;
	}
	public String getQuoItem() {
		return quoItem;
	}
	public void setQuoItem(String quoItem) {
		this.quoItem = quoItem;
	}
	public BigDecimal getQuoTotalPrice() {
		return quoTotalPrice;
	}
	public void setQuoTotalPrice(BigDecimal quoTotalPrice) {
		this.quoTotalPrice = quoTotalPrice;
	}

}
