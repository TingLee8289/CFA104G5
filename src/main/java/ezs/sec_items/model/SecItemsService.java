package ezs.sec_items.model;

import java.math.BigDecimal;
import java.util.List;

public class SecItemsService {
	private SecItemsDAO_interface dao;
	
	public SecItemsService() {
		dao = new SecItemsDAO();
	}

	public SecItemsVO addSecItems(Integer shCateID, 
			Integer shSellerID, 
			String shName, 
			BigDecimal shPrice, 
			Integer shQTY,
			String shSize,
			String shDescription,
			String shCondition,
			String shTime,
			String shGuarantee,
			Integer shStatus,
			String shCounty,
			String shDist) {

		SecItemsVO secItemsVO = new SecItemsVO();

		secItemsVO.setShCateID(shCateID);
		secItemsVO.setShSellerID(shSellerID);
		secItemsVO.setShName(shName);
//		待確認BigDecima使用方式(對應TEST MAIN方法中)
//		secTranRecordVO1.setShTranAP(BigDecimal.valueOf(1000));
//	    secItemsVO.setShPrice(new BigDecimal(10));
		secItemsVO.setShPrice(shPrice);
		secItemsVO.setShQTY(shQTY);
		secItemsVO.setShSize(shSize);
		secItemsVO.setShDescription(shDescription);
		secItemsVO.setShCondition(shCondition);
		secItemsVO.setShTime(shTime);
		secItemsVO.setShGuarantee(shGuarantee);
		secItemsVO.setShStatus(shStatus);
		secItemsVO.setShCounty(shCounty);
		secItemsVO.setShDist(shDist);
		dao.insert(secItemsVO);

		return secItemsVO;
	}

	public SecItemsVO updateSecItems(Integer shID, 
			Integer shCateID, 
			Integer shSellerID, 
			String shName,
			BigDecimal shPrice, 
			Integer shQTY,
			String shSize,
			String shDescription,
			String shCondition,
			String shTime,
			String shGuarantee,
			Integer shStatus,
			String shCounty,
			String shDist) {

		SecItemsVO secItemsVO = new SecItemsVO();
		
		secItemsVO.setShID(shID);
		secItemsVO.setShCateID(shCateID);
		secItemsVO.setShSellerID(shSellerID);
		secItemsVO.setShName(shName);
		secItemsVO.setShPrice(shPrice);
		secItemsVO.setShQTY(shQTY);
		secItemsVO.setShSize(shSize);
		secItemsVO.setShDescription(shDescription);
		secItemsVO.setShCondition(shCondition);
		secItemsVO.setShTime(shTime);
		secItemsVO.setShGuarantee(shGuarantee);
		secItemsVO.setShStatus(shStatus);
		secItemsVO.setShCounty(shCounty);
		secItemsVO.setShDist(shDist);

		dao.update(secItemsVO);
		return secItemsVO;
	}

	public void deleteSecItems(Integer shID) {
		dao.delete(shID);
	}

	public SecItemsVO getOneSecItems(Integer shID) {
		return dao.findByPrimaryKey(shID);
	}

	public List<SecItemsVO> getAll() {
		return dao.getAll();
	}

	public List<SecItemsVO> getByCategory(Integer shCateID) {
		return dao.findByShCategory(shCateID);
	}	

}
