package ezs.sec_postcode.model;

import java.io.Serializable;

public class SecPostcodeVO implements Serializable{
	private Integer shPostCode;
	private String shPostCounty;
	private String shPostDist;
	public Integer getShPostCode() {
		return shPostCode;
	}
	public void setShPostCode(Integer shPostCode) {
		this.shPostCode = shPostCode;
	}
	public String getShPostCounty() {
		return shPostCounty;
	}
	public void setShPostCounty(String shPostCounty) {
		this.shPostCounty = shPostCounty;
	}
	public String getShPostDist() {
		return shPostDist;
	}
	public void setShPostDist(String shPostDist) {
		this.shPostDist = shPostDist;
	}
	
	
	
	
}
