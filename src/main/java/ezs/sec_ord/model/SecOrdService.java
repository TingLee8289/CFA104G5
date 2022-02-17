package ezs.sec_ord.model;

import java.math.BigDecimal;
import java.util.List;
import java.util.Set;

public class SecOrdService {
	
	private SecOrdDAO_interface dao;

	public SecOrdService() {
		dao = new SecOrdJDBCDAO();
	}

	public SecOrdVO addSecOrd(
			Integer shBuyerID,
			Integer shSellerID,
			Integer shPostcode,
			String shCounty,
			String shDist,
			String shRoad,
			Integer shPayment,
			Integer shOrdStatus,
			BigDecimal shPrice,
			java.sql.Date shDate,
			Integer shBuyerScore,
			String shBuyerTXT,
			Integer shSellerScore,
			String shSellerTXT,
			java.sql.Date shAPPDate,
			String shNotes) {

		SecOrdVO secOrdVO = new SecOrdVO();

	
		secOrdVO.setShBuyerID(shBuyerID);
		secOrdVO.setShSellerID(shSellerID);
		secOrdVO.setShPostcode(shPostcode);
		secOrdVO.setShCounty(shCounty);
		secOrdVO.setShDist(shDist);
		secOrdVO.setShRoad(shRoad);
		secOrdVO.setShPayment(shPayment);
		secOrdVO.setShOrdStatus(shOrdStatus);
		secOrdVO.setShPrice(shPrice);
		secOrdVO.setShDate(shDate);
		secOrdVO.setShBuyerScore(shBuyerScore);
		secOrdVO.setShBuyerTXT(shBuyerTXT);
		secOrdVO.setShSellerScore(shSellerScore);
		secOrdVO.setShSellerTXT(shSellerTXT);
		secOrdVO.setShAPPDate(shAPPDate);
		secOrdVO.setShNotes(shNotes);
		dao.insert(secOrdVO);
	

		return secOrdVO;
	}

	public SecOrdVO updateSecOrd(Integer shOrdID,
			Integer shBuyerID,
			Integer shSellerID,
			Integer shPostcode,
			String shCounty,
			String shDist,
			String shRoad,
			Integer shPayment,
			Integer shOrdStatus,
			BigDecimal shPrice,
			java.sql.Date shDate,
			Integer shBuyerScore,
			String shBuyerTXT,
			Integer shSellerScore,
			String shSellerTXT,
			java.sql.Date shAPPDate,
			String shNotes) {

		SecOrdVO secOrdVO = new SecOrdVO();

		secOrdVO.setShOrdID(shOrdID);
		secOrdVO.setShBuyerID(shBuyerID);
		secOrdVO.setShSellerID(shSellerID);
		secOrdVO.setShPostcode(shPostcode);
		secOrdVO.setShCounty(shCounty);
		secOrdVO.setShDist(shDist);
		secOrdVO.setShRoad(shRoad);
		secOrdVO.setShPayment(shPayment);
		secOrdVO.setShOrdStatus(shOrdStatus);
		secOrdVO.setShPrice(shPrice);
		secOrdVO.setShDate(shDate);
		secOrdVO.setShBuyerScore(shBuyerScore);
		secOrdVO.setShBuyerTXT(shBuyerTXT);
		secOrdVO.setShSellerScore(shSellerScore);
		secOrdVO.setShSellerTXT(shSellerTXT);
		secOrdVO.setShAPPDate(shAPPDate);
		secOrdVO.setShNotes(shNotes);
		dao.update(secOrdVO);

		return secOrdVO;
	}

	public void deleteSecOrd(Integer shOrdID) {
		dao.delete(shOrdID);
	}

	public SecOrdVO getOneSecOrd(Integer shOrdID) {
		return dao.findByPrimaryKey(shOrdID);
	}

	public List<SecOrdVO> getAll() {
		return dao.getAll();
	}
	
	public Set<SecOrdVO> getSecOrdByShBuyerID(Integer shBuyerID) {
		return dao.getSecOrdByShBuyerID(shBuyerID);
	}
	public Set<SecOrdVO> getSecOrdByShSellerID(Integer shSellerID) {
		return dao.getSecOrdByShSellerID(shSellerID);
	}
}
