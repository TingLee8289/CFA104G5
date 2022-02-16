package ezs.sec_tran_record.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;

public class SecTranRecordVO implements Serializable{
	private Integer shTranID;
	private Integer shTranMemID;
	private Date shTranTime;
	private Integer shTranCategory;
	private BigDecimal shTranAmount;
	private BigDecimal shTranAP;
	private BigDecimal shTranBal;

	public Integer getShTranID() {
		return shTranID;
	}

	public void setShTranID(Integer shTranID) {
		this.shTranID = shTranID;
	}

	public Integer getShTranMemID() {
		return shTranMemID;
	}

	public void setShTranMemID(Integer shTranMemID) {
		this.shTranMemID = shTranMemID;
	}

	public Date getShTranTime() {
		return shTranTime;
	}

	public void setShTranTime(Date shTranTime) {
		this.shTranTime = shTranTime;
	}

	public Integer getShTranCategory() {
		return shTranCategory;
	}

	public void setShTranCategory(Integer shTranCategory) {
		this.shTranCategory = shTranCategory;
	}

	public BigDecimal getShTranAmount() {
		return shTranAmount;
	}

	public void setShTranAmount(BigDecimal shTranAmount) {
		this.shTranAmount = shTranAmount;
	}

	public BigDecimal getShTranAP() {
		return shTranAP;
	}

	public void setShTranAP(BigDecimal shTranAP) {
		this.shTranAP = shTranAP;
	}

	public BigDecimal getShTranBal() {
		return shTranBal;
	}

	public void setShTranBal(BigDecimal shTranBal) {
		this.shTranBal = shTranBal;
	}

}
