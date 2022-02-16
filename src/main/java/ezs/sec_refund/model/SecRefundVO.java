package ezs.sec_refund.model;

import java.io.Serializable;
import java.sql.Date;

public class SecRefundVO implements Serializable{
	
	private Integer shRefID;
	private Integer shOrdID;
	private String shRefContent;
	private Date shRefApplyDate;
	private Integer shRefStatus;
	
	public Integer getShRefID() {
		return shRefID;
	}
	public void setShRefID(Integer shRefID) {
		this.shRefID = shRefID;
	}
	public Integer getShOrdID() {
		return shOrdID;
	}
	public void setShOrdID(Integer shOrdID) {
		this.shOrdID = shOrdID;
	}
	public String getShRefContent() {
		return shRefContent;
	}
	public void setShRefContent(String shRefContent) {
		this.shRefContent = shRefContent;
	}
	public Date getShRefApplyDate() {
		return shRefApplyDate;
	}
	public void setShRefApplyDate(Date shRefApplyDate) {
		this.shRefApplyDate = shRefApplyDate;
	}
	public Integer getShRefStatus() {
		return shRefStatus;
	}
	public void setShRefStatus(Integer shRefStatus) {
		this.shRefStatus = shRefStatus;
	}

	
	
}
