package ezs.sec_refund.model;

import java.sql.Date;
import java.util.List;

public class SecRefundService {
	
	private SecRefundDAO_interface dao;

	public SecRefundService() {
		dao = new SecRefundJDBCDAO();
	}

	public SecRefundVO addSecRefund(Integer shOrdID, 
			String shRefContent, 
			Date shRefApplyDate, 
			Integer shRefStatus) {

		SecRefundVO secRefundVO = new SecRefundVO();

		
		secRefundVO.setShOrdID(shOrdID);
		secRefundVO.setShRefContent(shRefContent);
		secRefundVO.setShRefApplyDate(shRefApplyDate);   
		secRefundVO.setShRefStatus(shRefStatus);
		dao.insert(secRefundVO);

		return secRefundVO;
	}

	public SecRefundVO updateSecRefund(Integer shRefID,
			Integer shOrdID, 
			String shRefContent, 
			Date shRefApplyDate, 
			Integer shRefStatus) {
		
		SecRefundVO secRefundVO = new SecRefundVO();

		
		secRefundVO.setShRefID(shRefID);
		secRefundVO.setShOrdID(shOrdID);
		secRefundVO.setShRefContent(shRefContent);
		secRefundVO.setShRefApplyDate(shRefApplyDate);   
		secRefundVO.setShRefStatus(shRefStatus);
		dao.update(secRefundVO);

		return secRefundVO;
	}

	public void deleteSecRefund(Integer shRefID) {
		dao.delete(shRefID);
	}

	public SecRefundVO getOneSecRefund(Integer shRefID) {
		return dao.findByPrimaryKey(shRefID);
	}

	public List<SecRefundVO> getAll() {
		return dao.getAll();
	}
}
