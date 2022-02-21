package ezs.sec_ord.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;

public class SecOrdVO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer shOrdID;
	private Integer shBuyerID;
	private Integer shSellerID;
	private Integer shPostcode;
	private String shCounty;
	private String shDist;
	private String shRoad;
	private Integer shPayment;
	private Integer shOrdStatus;
	private BigDecimal shPrice;
	private Date shDate;
	private Integer shBuyerScore;
	private String shBuyerTXT;
	private Integer shSellerScore;
	private String shSellerTXT;
	private Date shAPPDate;
	private String shNotes;
	private String shRecipName;
	private String shRecipPhone;
	
	
	public Integer getShOrdID() {
		return shOrdID;
	}
	public void setShOrdID(Integer shOrdID) {
		this.shOrdID = shOrdID;
	}
	public Integer getShBuyerID() {
		return shBuyerID;
	}
	public void setShBuyerID(Integer shBuyerID) {
		this.shBuyerID = shBuyerID;
	}
	public Integer getShSellerID() {
		return shSellerID;
	}
	public void setShSellerID(Integer shSellerID) {
		this.shSellerID = shSellerID;
	}
	public Integer getShPostcode() {
		return shPostcode;
	}
	public void setShPostcode(Integer shPostcode) {
		this.shPostcode = shPostcode;
	}
	public String getShCounty() {
		return shCounty;
	}
	public void setShCounty(String shCounty) {
		this.shCounty = shCounty;
	}
	public String getShDist() {
		return shDist;
	}
	public void setShDist(String shDist) {
		this.shDist = shDist;
	}
	public String getShRoad() {
		return shRoad;
	}
	public void setShRoad(String shRoad) {
		this.shRoad = shRoad;
	}
	public Integer getShPayment() {
		return shPayment;
	}
	public void setShPayment(Integer shPayment) {
		this.shPayment = shPayment;
	}
	public Integer getShOrdStatus() {
		return shOrdStatus;
	}
	public void setShOrdStatus(Integer shOrdStatus) {
		this.shOrdStatus = shOrdStatus;
	}
	public BigDecimal getShPrice() {
		return shPrice;
	}
	public void setShPrice(BigDecimal shPrice) {
		this.shPrice = shPrice;
	}
	public Date getShDate() {
		return shDate;
	}
	public void setShDate(Date shDate) {
		this.shDate = shDate;
	}
	public Integer getShBuyerScore() {
		return shBuyerScore;
	}
	public void setShBuyerScore(Integer shBuyerScore) {
		this.shBuyerScore = shBuyerScore;
	}
	public String getShBuyerTXT() {
		return shBuyerTXT;
	}
	public void setShBuyerTXT(String shBuyerTXT) {
		this.shBuyerTXT = shBuyerTXT;
	}
	public Integer getShSellerScore() {
		return shSellerScore;
	}
	public void setShSellerScore(Integer shSellerScore) {
		this.shSellerScore = shSellerScore;
	}
	public String getShSellerTXT() {
		return shSellerTXT;
	}
	public void setShSellerTXT(String shSellerTXT) {
		this.shSellerTXT = shSellerTXT;
	}
	public Date getShAPPDate() {
		return shAPPDate;
	}
	public void setShAPPDate(Date shAPPDate) {
		this.shAPPDate = shAPPDate;
	}
	public String getShNotes() {
		return shNotes;
	}
	public void setShNotes(String shNotes) {
		this.shNotes = shNotes;
	}
	public String getShRecipName() {
		return shRecipName;
	}
	public void setShRecipName(String shRecipName) {
		this.shRecipName = shRecipName;
	}
	public String getShRecipPhone() {
		return shRecipPhone;
	}
	public void setShRecipPhone(String shRecipPhone) {
		this.shRecipPhone = shRecipPhone;
	}
	
	
	
	
}
