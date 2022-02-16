package ezs.ren_lease.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class RenLeaseVO  implements Serializable  {
	
	private Integer lseId; 
	private Integer	lseMemId;  
	private Integer	lseLisId;  
	private Integer LseLddId;
	private Integer LseLddScore;
	private String lseLddTxt;
	private Integer lseTntScore;
	private String lseTntTxt;
	private Integer lseStatus; 
	private Timestamp lseTimestamp;
	private Date lseStart;
	private Date lseEnd;
	
	public RenLeaseVO() {
		super();
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
		return LseLddId;
	}

	public void setLseLddId(Integer lseLddId) {
		LseLddId = lseLddId;
	}

	public Integer getLseLddScore() {
		return LseLddScore;
	}

	public void setLseLddScore(Integer lseLddScore) {
		LseLddScore = lseLddScore;
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
}
