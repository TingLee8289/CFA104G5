package ezs.sec_ord_details.model;

import java.math.BigDecimal;
import java.util.List;

//二手購物訂單明細複合主鍵確認

public class SecOrdDetailsService {
	
	private SecOrdDetailsDAO_interface dao;

	public SecOrdDetailsService() {
		dao = new SecOrdDetailsDAO();
	}

	public SecOrdDetailsVO addSecOrdDetails(Integer shOrdID,
			Integer shID,
			String shName,
			BigDecimal shPrice,
			Integer shQty) {

		SecOrdDetailsVO secOrdDetailsVO = new SecOrdDetailsVO();

		secOrdDetailsVO.setShOrdID(shOrdID);
		secOrdDetailsVO.setShID(shID);
		secOrdDetailsVO.setShName(shName);
		secOrdDetailsVO.setShPrice(shPrice);
		secOrdDetailsVO.setShQty(shQty);
		
		dao.insert(secOrdDetailsVO);

		return secOrdDetailsVO;
	}

	public SecOrdDetailsVO updateSecOrdDetails(Integer shOrdID,
			Integer shID,
			String shName,
			BigDecimal shPrice,
			Integer shQty) {

		SecOrdDetailsVO secOrdDetailsVO = new SecOrdDetailsVO();

		secOrdDetailsVO.setShOrdID(shOrdID);
		secOrdDetailsVO.setShID(shID);
		secOrdDetailsVO.setShName(shName);
		secOrdDetailsVO.setShPrice(shPrice);
		secOrdDetailsVO.setShQty(shQty);
		
		dao.update(secOrdDetailsVO);

		return secOrdDetailsVO;
	}

	public void deleteSecOrdDetails(Integer shOrdID,Integer shID) {
		dao.delete(shOrdID,shID);
	}

	public SecOrdDetailsVO getOneSecOrdDetails(Integer shOrdID,Integer shID) {
		return dao.findByPrimaryKey(shOrdID,shID);
	}

	public List<SecOrdDetailsVO> getAll() {
		return dao.getAll();
	}

	public List<SecOrdDetailsVO> findByShOrdID(Integer shOrdID) {
		return dao.findByShOrdID(shOrdID);
	}
}
