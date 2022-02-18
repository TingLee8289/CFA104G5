package ezs.ser_cla.model;

import java.util.List;

public class SerClaService {
	private SerClaDAO_interface dao;

	public SerClaService() {
		dao = new SerClaDAO();
	}

	public SerClaVO addSerCla(String serClaName) {

		SerClaVO serclaVO = new SerClaVO();

	
		serclaVO.setSerClaName(serClaName);
		dao.insert(serclaVO);

		return serclaVO;
	}

	public SerClaVO updateSerCla(String serClaName, Integer serClaID) {

		SerClaVO serclaVO = new SerClaVO();

		serclaVO.setSerClaName(serClaName);
		serclaVO.setSerClaID(serClaID);
		dao.update(serclaVO);

		return serclaVO;
	}

	public void deleteSerCla(Integer serClaID) {
		dao.delete(serClaID);
	}

	public SerClaVO getoneSerCla(Integer serClaID) {
		return dao.findByPrimaryKey(serClaID);
	}

	public List<SerClaVO> getAll() {
		return dao.getAll();
	}

}
