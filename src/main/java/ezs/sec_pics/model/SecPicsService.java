package ezs.sec_pics.model;

import java.util.List;

public class SecPicsService {
	private SecPicsDAO_interface dao;

	public SecPicsService() {
		dao = new SecPicsDAO();
	}

	public SecPicsVO addSecPics(Integer shID, byte[] shPic) {

		SecPicsVO secPicsVO = new SecPicsVO();

		secPicsVO.setShID(shID);
		secPicsVO.setShPic(shPic);
		
		dao.insert(secPicsVO);

		return secPicsVO;
	}

	public SecPicsVO updateSecPics(Integer shID, byte[] shPic) {

		SecPicsVO secPicsVO = new SecPicsVO();
		
		secPicsVO.setShID(shID);
		secPicsVO.setShPic(shPic);
		dao.update(secPicsVO);

		return secPicsVO;
	}

	public void deleteSecPics(Integer shPicID) {
		dao.delete(shPicID);
	}

	public SecPicsVO getOneSecPics(Integer shID) {
		return dao.findByPrimaryKey(shID);
	}

	public List<SecPicsVO> getAll() {
		return dao.getAll();
	}

	public List<SecPicsVO> getEachFirst() {
		return dao.getEachItemFirstPic();
	}

	public List<SecPicsVO> getByShID(Integer shID) {
		return dao.getByShID(shID);
	}
	
	public List<SecPicsVO> getByShCateID(Integer shCateID) {
		return dao.getByShCateID(shCateID);
	}

}
