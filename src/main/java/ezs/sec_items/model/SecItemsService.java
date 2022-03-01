package ezs.sec_items.model;

import java.math.BigDecimal;
import java.util.List;

import ezs.sec_pics.model.SecPicsDAO_interface;
import ezs.sec_pics.model.SecPicsJDBCDAO;
import ezs.sec_pics.model.SecPicsVO;

public class SecItemsService {
	private SecItemsDAO_interface dao;
	private SecPicsDAO_interface daosecpic;
	
	public SecItemsService() {
		dao = new SecItemsJNDIDAO();
		daosecpic = new SecPicsJDBCDAO();
		
	}
	//
	public SecItemsVO addSecItems(SecItemsVO secItemsVO, SecPicsVO secPicsVO) {
		Integer id = dao.insert(secItemsVO);
//		DAO新增出來才會產生的ShID 讓它對應Pics
		secPicsVO.setShID(id);
		//picDao 傳到關聯表格
		daosecpic.insert(secPicsVO);
		return secItemsVO;

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
	
	public SecItemsVO updateSecItems(SecItemsVO secItemsVO, SecPicsVO secPicsVO) {
		Integer id = dao.insert(secItemsVO);
//		DAO新增出來才會產生的ShID 讓它對應Pics
		secPicsVO.setShID(id);
		//picDao 傳到關聯表格
		daosecpic.update(secPicsVO);
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
			String shDist
			) {

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
		secItemsVO.setShID(shID);
		dao.update(secItemsVO);

		return secItemsVO;
	}
	
	
	public void deleteSecItems(Integer shID) {

		dao.delete(shID);
	}

	public SecItemsVO getOneSecItems(Integer shSellerID, Integer shID) {
		return dao.findByPrimaryKey(shSellerID, shID);
	}

	public List<SecItemsVO> getAll() {
		return dao.getAll();
	}
	public List<SecItemsVO> getAll2(Integer shSellerID) {
		return dao.getAll2(shSellerID);
	}
	
	public List<SecItemsVO> getByCategory(Integer shSellerID, Integer shCateID) {
		return dao.findByShCategory(shSellerID, shCateID);
	}
	
	public List<SecItemsVO> getByCategory2(Integer shCateID) {
		return dao.findByShCategory2(shCateID);
	}
	
	public List<SecItemsVO> getByStatus(Integer shSellerID, Integer shStatus) {
		return dao.findByStatus(shSellerID, shStatus);
	}
	
	public SecItemsVO getOneSecItemsByShID(Integer shID) {
		return dao.getOneSecItemsByShID(shID);
	}
	
	
}