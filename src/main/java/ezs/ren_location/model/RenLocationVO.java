package ezs.ren_location.model;

import java.io.Serializable;

public class RenLocationVO implements Serializable{
	private Integer locID;
	private String locCity;
	private String locDist;
	
	public RenLocationVO() {
		super();
	}
	
	public Integer getLocID() {
		return locID;
	}
	public void setLocID(Integer locID) {
		this.locID = locID;
	}
	public String getLocCity() {
		return locCity;
	}
	public void setLocCity(String locCity) {
		this.locCity = locCity;
	}
	public String getLocDist() {
		return locDist;
	}
	public void setLocDist(String locDist) {
		this.locDist = locDist;
	}
}
