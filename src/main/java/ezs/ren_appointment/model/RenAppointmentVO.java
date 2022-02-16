package ezs.ren_appointment.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class RenAppointmentVO implements Serializable{
	
	private Integer aptId;
	private Integer aptMemId;
	private Integer aptLddId;
	private Integer aptLisId;
	private Integer aptStatus;
	private Timestamp aptTime;
	private Timestamp aptTimestamp;
	
	public RenAppointmentVO() {
		super();
	}

	public Integer getAptId() {
		return aptId;
	}

	public void setAptId(Integer aptId) {
		this.aptId = aptId;
	}

	public Integer getAptMemId() {
		return aptMemId;
	}

	public void setAptMemId(Integer aptMemId) {
		this.aptMemId = aptMemId;
	}

	public Integer getAptLddId() {
		return aptLddId;
	}

	public void setAptLddId(Integer aptLddId) {
		this.aptLddId = aptLddId;
	}

	public Integer getAptLisId() {
		return aptLisId;
	}

	public void setAptLisId(Integer aptLisId) {
		this.aptLisId = aptLisId;
	}

	public Integer getAptStatus() {
		return aptStatus;
	}

	public void setAptStatus(Integer aptStatus) {
		this.aptStatus = aptStatus;
	}

	public Timestamp getAptTime() {
		return aptTime;
	}

	public void setAptTime(Timestamp aptTime) {
		this.aptTime = aptTime;
	}

	public Timestamp getAptTimestamp() {
		return aptTimestamp;
	}

	public void setAptTimestamp(Timestamp aptTimestamp) {
		this.aptTimestamp = aptTimestamp;
	}
}
