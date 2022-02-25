package ezs.ren_lease.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class RenLeaseVO  implements Serializable  {
	
	private Integer lseId; 
	private Integer	lseMemId;  
	private Integer	lseLisId;  
	private Integer lseLddId;
	private Integer lseLddScore;
	private String lseLddTxt;
	private Integer lseTntScore;
	private String lseTntTxt;
	private Integer lseStatus; 
	private Timestamp lseTimestamp;
	private Date lseStart;
	private Date lseEnd;
	private Integer lsePrice;
	private byte[] lsePic;
	private Integer	lseLeaseMemId; 

	public RenLeaseVO() {
	}

	public Integer getLseId() {
		return lseId;
	}

	public void setLseId(Integer lseId) {
		this.lseId = lseId;
	}

	public Integer getLseMemId() {
		return lseMemId;
	}

	public void setLseMemId(Integer lseMemId) {
		this.lseMemId = lseMemId;
	}

	public Integer getLseLisId() {
		return lseLisId;
	}

	public void setLseLisId(Integer lseLisId) {
		this.lseLisId = lseLisId;
	}

	public Integer getLseLddId() {
		return lseLddId;
	}

	public void setLseLddId(Integer lseLddId) {
		this.lseLddId = lseLddId;
	}

	public Integer getLseLddScore() {
		return lseLddScore;
	}

	public void setLseLddScore(Integer lseLddScore) {
		this.lseLddScore = lseLddScore;
	}

	public String getLseLddTxt() {
		return lseLddTxt;
	}

	public void setLseLddTxt(String lseLddTxt) {
		this.lseLddTxt = lseLddTxt;
	}

	public Integer getLseTntScore() {
		return lseTntScore;
	}

	public void setLseTntScore(Integer lseTntScore) {
		this.lseTntScore = lseTntScore;
	}

	public String getLseTntTxt() {
		return lseTntTxt;
	}

	public void setLseTntTxt(String lseTntTxt) {
		this.lseTntTxt = lseTntTxt;
	}

	public Integer getLseStatus() {
		return lseStatus;
	}

	public void setLseStatus(Integer lseStatus) {
		this.lseStatus = lseStatus;
	}

	public Timestamp getLseTimestamp() {
		return lseTimestamp;
	}

	public void setLseTimestamp(Timestamp lseTimestamp) {
		this.lseTimestamp = lseTimestamp;
	}

	public Date getLseStart() {
		return lseStart;
	}

	public void setLseStart(Date lseStart) {
		this.lseStart = lseStart;
	}

	public Date getLseEnd() {
		return lseEnd;
	}

	public void setLseEnd(Date lseEnd) {
		this.lseEnd = lseEnd;
	}

	public Integer getLsePrice() {
		return lsePrice;
	}

	public void setLsePrice(Integer lsePrice) {
		this.lsePrice = lsePrice;
	}

	public byte[] getLsePic() {
		return lsePic;
	}

	public void setLsePic(byte[] lsePic) {
		this.lsePic = lsePic;
	}

	public Integer getLseLeaseMemId() {
		return lseLeaseMemId;
	}

	public void setLseLeaseMemId(Integer lseLeaseMemId) {
		this.lseLeaseMemId = lseLeaseMemId;
	}	
}
