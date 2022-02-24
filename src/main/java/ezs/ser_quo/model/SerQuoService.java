package ezs.ser_quo.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import ezs.ser_dmd.model.SerDmdVO;


public class SerQuoService {
	private SerQuoDAO_interface dao;

	public SerQuoService() {
		dao = new SerQuoDAO();
	}

	public SerQuoVO addSerQuo(Byte quoStatus, Integer quoDmdID, Integer quoVdrID, Date quoDate, Date quoExpiryDate,
			String quoItem, BigDecimal quoTotalPrice) {
		SerQuoVO serQuoVO = new SerQuoVO();

		serQuoVO.setQuoStatus(quoStatus);
		serQuoVO.setQuoDmdID(quoDmdID);
		serQuoVO.setQuoVdrID(quoVdrID);
		serQuoVO.setQuoDate(quoDate);
		serQuoVO.setQuoExpiryDate(quoExpiryDate);
		serQuoVO.setQuoItem(quoItem);
		serQuoVO.setQuoTotalPrice(quoTotalPrice);
		dao.insert(serQuoVO);
		return serQuoVO;
	}

	public SerQuoVO updateSerQuo(Integer quoID, Byte quoStatus, Integer quoDmdID, Integer quoVdrID, Date quoDate,
			Date quoExpiryDate, String quoItem, BigDecimal quoTotalPrice) {
		SerQuoVO serQuoVO = new SerQuoVO();
		serQuoVO.setQuoID(quoID);
		serQuoVO.setQuoStatus(quoStatus);
		serQuoVO.setQuoDmdID(quoDmdID);
		serQuoVO.setQuoVdrID(quoVdrID);
		serQuoVO.setQuoDate(quoDate);
		serQuoVO.setQuoExpiryDate(quoExpiryDate);
		serQuoVO.setQuoItem(quoItem);
		serQuoVO.setQuoTotalPrice(quoTotalPrice);
		dao.update(serQuoVO);
		return serQuoVO;
	}

	public void deleteSerQuo(Integer quoID) {
		dao.delete(quoID);
	}

	public SerQuoVO getOneSerQuo(Integer quoID) {
		return dao.findByPrimaryKey(quoID);
	}

	public List<SerQuoVO> findByVdrID(Integer quoVdrID) {
		return dao.findByVdrID(quoVdrID);
	}
	public List<SerQuoVO> getAll() {
		return dao.getAll();
	}
	public List<SerQuoVO> findByDmdID(Integer dmdID) {
		return dao.findByDmdID(dmdID);
	}
	
	
}
