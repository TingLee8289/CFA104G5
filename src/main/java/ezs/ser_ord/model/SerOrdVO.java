package ezs.ser_ord.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;

public class SerOrdVO implements Serializable{
	private Integer ordID;
	private Byte ordStatus;
	private Byte ordPayStatus;
	private Integer ordDmdID;
	private Integer ordQuoID;
	private Integer ordMemID;
	private Integer ordVdrID;
	private Integer ordSerClaID;
	private String ordMemVatno;
	private String ordVdrVatno;
	private String ordClnName;
	private String ordClnTel;
	private Date ordWorkDate;
	private String ordCounty;
	private String ordDist;
	private String ordAddr;
	private String ordItem;
	private BigDecimal ordTotalPrice;
	private BigDecimal ordPrePay;
	private Byte ordPayType;
	private Date ordPayDate;
	private BigDecimal ordFpay;
	private Byte ordFpayType;
	private Date ordFpayDate;
	private Integer ordBuyerScore;
	private String ordBuyerTxt;
	private Integer ordVdrScore;
	private String ordVdrTxt;
	private String ordNote;
	public Integer getOrdID() {
		return ordID;
	}
	public void setOrdID(Integer ordID) {
		this.ordID = ordID;
	}
	public Byte getOrdStatus() {
		return ordStatus;
	}
	public void setOrdStatus(Byte ordStatus) {
		this.ordStatus = ordStatus;
	}
	public Byte getOrdPayStatus() {
		return ordPayStatus;
	}
	public void setOrdPayStatus(Byte ordPayStatus) {
		this.ordPayStatus = ordPayStatus;
	}
	public Integer getOrdDmdID() {
		return ordDmdID;
	}
	public void setOrdDmdID(Integer ordDmdID) {
		this.ordDmdID = ordDmdID;
	}
	public Integer getOrdQuoID() {
		return ordQuoID;
	}
	public void setOrdQuoID(Integer ordQuoID) {
		this.ordQuoID = ordQuoID;
	}
	public Integer getOrdMemID() {
		return ordMemID;
	}
	public void setOrdMemID(Integer ordMemID) {
		this.ordMemID = ordMemID;
	}
	public Integer getOrdVdrID() {
		return ordVdrID;
	}
	public void setOrdVdrID(Integer ordVdrID) {
		this.ordVdrID = ordVdrID;
	}
	public Integer getOrdSerClaID() {
		return ordSerClaID;
	}
	public void setOrdSerClaID(Integer ordSerClaID) {
		this.ordSerClaID = ordSerClaID;
	}
	public String getOrdMemVatno() {
		return ordMemVatno;
	}
	public void setOrdMemVatno(String ordMemVatno) {
		this.ordMemVatno = ordMemVatno;
	}
	public String getOrdVdrVatno() {
		return ordVdrVatno;
	}
	public void setOrdVdrVatno(String ordVdrVatno) {
		this.ordVdrVatno = ordVdrVatno;
	}
	public String getOrdClnName() {
		return ordClnName;
	}
	public void setOrdClnName(String ordClnName) {
		this.ordClnName = ordClnName;
	}
	public String getOrdClnTel() {
		return ordClnTel;
	}
	public void setOrdClnTel(String ordClnTel) {
		this.ordClnTel = ordClnTel;
	}
	public Date getOrdWorkDate() {
		return ordWorkDate;
	}
	public void setOrdWorkDate(Date ordWorkDate) {
		this.ordWorkDate = ordWorkDate;
	}
	public String getOrdCounty() {
		return ordCounty;
	}
	public void setOrdCounty(String ordCounty) {
		this.ordCounty = ordCounty;
	}
	public String getOrdDist() {
		return ordDist;
	}
	public void setOrdDist(String ordDist) {
		this.ordDist = ordDist;
	}
	public String getOrdAddr() {
		return ordAddr;
	}
	public void setOrdAddr(String ordAddr) {
		this.ordAddr = ordAddr;
	}
	public String getOrdItem() {
		return ordItem;
	}
	public void setOrdItem(String ordItem) {
		this.ordItem = ordItem;
	}
	public BigDecimal getOrdTotalPrice() {
		return ordTotalPrice;
	}
	public void setOrdTotalPrice(BigDecimal ordTotalPrice) {
		this.ordTotalPrice = ordTotalPrice;
	}
	public BigDecimal getOrdPrePay() {
		return ordPrePay;
	}
	public void setOrdPrePay(BigDecimal ordPrePay) {
		this.ordPrePay = ordPrePay;
	}
	public Byte getOrdPayType() {
		return ordPayType;
	}
	public void setOrdPayType(Byte ordPayType) {
		this.ordPayType = ordPayType;
	}
	public Date getOrdPayDate() {
		return ordPayDate;
	}
	public void setOrdPayDate(Date ordPayDate) {
		this.ordPayDate = ordPayDate;
	}
	public BigDecimal getOrdFpay() {
		return ordFpay;
	}
	public void setOrdFpay(BigDecimal ordFpay) {
		this.ordFpay = ordFpay;
	}
	public Byte getOrdFpayType() {
		return ordFpayType;
	}
	public void setOrdFpayType(Byte ordFpayType) {
		this.ordFpayType = ordFpayType;
	}
	public Date getOrdFpayDate() {
		return ordFpayDate;
	}
	public void setOrdFpayDate(Date ordFpayDate) {
		this.ordFpayDate = ordFpayDate;
	}
	public Integer getOrdBuyerScore() {
		return ordBuyerScore;
	}
	public void setOrdBuyerScore(Integer ordBuyerScore) {
		this.ordBuyerScore = ordBuyerScore;
	}
	public String getOrdBuyerTxt() {
		return ordBuyerTxt;
	}
	public void setOrdBuyerTxt(String ordBuyerTxt) {
		this.ordBuyerTxt = ordBuyerTxt;
	}
	public Integer getOrdVdrScore() {
		return ordVdrScore;
	}
	public void setOrdVdrScore(Integer ordVdrScore) {
		this.ordVdrScore = ordVdrScore;
	}
	public String getOrdVdrTxt() {
		return ordVdrTxt;
	}
	public void setOrdVdrTxt(String ordVdrTxt) {
		this.ordVdrTxt = ordVdrTxt;
	}
	public String getOrdNote() {
		return ordNote;
	}
	public void setOrdNote(String ordNote) {
		this.ordNote = ordNote;
	}
	
}
