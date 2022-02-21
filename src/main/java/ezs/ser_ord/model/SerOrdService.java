package ezs.ser_ord.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import ezs.ser_quo.model.SerQuoVO;
import util.Util;

public class SerOrdService {
	private SerOrdDAO_interface dao;

	public SerOrdService() {
		dao = new SerOrdDAO();
	}

	public SerOrdVO addSerOrd(Byte ordStatus, Byte ordPayStatus, Integer ordDmdID, Integer ordQuoID, Integer ordMemID,
			Integer ordVdrID, Integer ordSerClaID, String ordMemVatno, String ordVdrVatno, String ordClnName,
			String ordClnTel, Date ordWorkDate, String ordCounty, String ordDist, String ordAddr, String ordItem,
			BigDecimal ordTotalPrice, BigDecimal ordPrePay, Byte ordPayType, Date ordPayDate, BigDecimal ordFpay,
			Byte ordFpayType, Date ordFpayDate, Integer ordBuyerScore, String ordBuyerTxt, Integer ordVdrScore,
			String ordVdrTxt, String ordNote) {
		SerOrdVO serOrdVO = new SerOrdVO();

		serOrdVO.setOrdStatus(ordStatus);
		serOrdVO.setOrdPayStatus(ordPayStatus);
		serOrdVO.setOrdDmdID(ordDmdID);
		serOrdVO.setOrdQuoID(ordQuoID);
		serOrdVO.setOrdMemID(ordMemID);
		serOrdVO.setOrdVdrID(ordVdrID);
		serOrdVO.setOrdSerClaID(ordSerClaID);
		serOrdVO.setOrdMemVatno(ordMemVatno);
		serOrdVO.setOrdVdrVatno(ordVdrVatno);
		serOrdVO.setOrdClnName(ordClnName);
		serOrdVO.setOrdClnTel(ordClnTel);
		serOrdVO.setOrdWorkDate(ordWorkDate);
		serOrdVO.setOrdCounty(ordCounty);
		serOrdVO.setOrdDist(ordDist);
		serOrdVO.setOrdAddr(ordAddr);
		serOrdVO.setOrdItem(ordItem);
		serOrdVO.setOrdTotalPrice(ordTotalPrice);
		serOrdVO.setOrdPrePay(ordPrePay);
		serOrdVO.setOrdPayType(ordPayType);
		serOrdVO.setOrdPayDate(ordPayDate);
		serOrdVO.setOrdFpay(ordFpay);
		serOrdVO.setOrdFpayType(ordFpayType);
		serOrdVO.setOrdFpayDate(ordFpayDate);
		serOrdVO.setOrdBuyerScore(ordBuyerScore);
		serOrdVO.setOrdBuyerTxt(ordBuyerTxt);
		serOrdVO.setOrdVdrScore(ordVdrScore);
		serOrdVO.setOrdVdrTxt(ordVdrTxt);
		serOrdVO.setOrdNote(ordNote);
		dao.insert(serOrdVO);
		return serOrdVO;

	}

	public SerOrdVO updateSerOrd(Byte ordStatus, Byte ordPayStatus, Integer ordDmdID, Integer ordQuoID,
			Integer ordMemID, Integer ordVdrID, Integer ordSerClaID, String ordMemVatno, String ordVdrVatno,
			String ordClnName, String ordClnTel, Date ordWorkDate, String ordCounty, String ordDist, String ordAddr,
			String ordItem, BigDecimal ordTotalPrice, BigDecimal ordPrePay, Byte ordPayType, Date ordPayDate,
			BigDecimal ordFpay, Byte ordFpayType, Date ordFpayDate, Integer ordBuyerScore, String ordBuyerTxt,
			Integer ordVdrScore, String ordVdrTxt, String ordNote, Integer ordID) {
		SerOrdVO serOrdVO = new SerOrdVO();
		serOrdVO.setOrdStatus(ordStatus);
		serOrdVO.setOrdPayStatus(ordPayStatus);
		serOrdVO.setOrdDmdID(ordDmdID);
		serOrdVO.setOrdQuoID(ordQuoID);
		serOrdVO.setOrdMemID(ordMemID);
		serOrdVO.setOrdVdrID(ordVdrID);
		serOrdVO.setOrdSerClaID(ordSerClaID);
		serOrdVO.setOrdMemVatno(ordMemVatno);
		serOrdVO.setOrdVdrVatno(ordVdrVatno);
		serOrdVO.setOrdClnName(ordClnName);
		serOrdVO.setOrdClnTel(ordClnTel);
		serOrdVO.setOrdWorkDate(ordWorkDate);
		serOrdVO.setOrdCounty(ordCounty);
		serOrdVO.setOrdDist(ordDist);
		serOrdVO.setOrdAddr(ordAddr);
		serOrdVO.setOrdItem(ordItem);
		serOrdVO.setOrdTotalPrice(ordTotalPrice);
		serOrdVO.setOrdPrePay(ordPrePay);
		serOrdVO.setOrdPayType(ordPayType);
		serOrdVO.setOrdPayDate(ordPayDate);
		serOrdVO.setOrdFpay(ordFpay);
		serOrdVO.setOrdFpayType(ordFpayType);
		serOrdVO.setOrdFpayDate(ordFpayDate);
		serOrdVO.setOrdBuyerScore(ordBuyerScore);
		serOrdVO.setOrdBuyerTxt(ordBuyerTxt);
		serOrdVO.setOrdVdrScore(ordVdrScore);
		serOrdVO.setOrdVdrTxt(ordVdrTxt);
		serOrdVO.setOrdNote(ordNote);
		serOrdVO.setOrdID(ordID);
		dao.update(serOrdVO);
		return serOrdVO;

	}

	public void deleteSerOrd(Integer ordID) {
		dao.delete(ordID);
	}

	public SerOrdVO getOneSerOrd(Integer ordID) {
		return dao.findByPrimaryKey(ordID);
	}

	public List<SerOrdVO> getAll() {
		return dao.getAll();
	}
	
	public List<SerOrdVO> findOrdByVdrID(Integer ordVdrID){
		return dao.findOrdByVdrID(ordVdrID);
	}
	public List<SerOrdVO> findOrdByMemID(Integer ordMemID){
		return dao.findOrdByMemID(ordMemID);
	}
	public void finishOrd(Integer ordID) {   
		 dao.finishOrd(ordID);
	}
	public void jobCompleted(Integer ordID) {   
		dao.jobCompleted(ordID);
	}
	public void creditPay(Integer ordID) {
		dao.creditPay(ordID);
	}
}
