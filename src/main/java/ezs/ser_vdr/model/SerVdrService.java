package ezs.ser_vdr.model;

import java.util.List;

public class SerVdrService {
	private SerVdrDAO_interface dao;

	public SerVdrService() {
		dao = new SerVdrDAO();

	}

	public SerVdrVO addSerVdr(Integer vdrID, Byte vdrStatus, String vdrName, String vdrTel, String vdrVatno,
			String vdrCounty, String vdrDist, String vdrAddr, String vdrOpen, String vdrIntro, byte[] vdrPic,
			Integer vdrRevCount, Integer vdrRevScore) {

		SerVdrVO servdrVO = new SerVdrVO();

		servdrVO.setVdrID(vdrID);
		servdrVO.setVdrStatus(vdrStatus);
		servdrVO.setVdrName(vdrName);
		servdrVO.setVdrTel(vdrTel);
		servdrVO.setVdrVatno(vdrVatno);
		servdrVO.setVdrCounty(vdrCounty);
		servdrVO.setVdrDist(vdrDist);
		servdrVO.setVdrAddr(vdrAddr);
		servdrVO.setVdrOpen(vdrOpen);
		servdrVO.setVdrIntro(vdrIntro);
		servdrVO.setVdrPic(vdrPic);
		servdrVO.setVdrRevCount(vdrRevCount);
		servdrVO.setVdrRevScore(vdrRevScore);
		dao.insert(servdrVO);

		return servdrVO;
	}

	public SerVdrVO updateSerVdr(Byte vdrStatus, String vdrName, String vdrTel, String vdrVatno, String vdrCounty,
			String vdrDist, String vdrAddr, String vdrOpen, String vdrIntro, byte[] vdrPic, Integer vdrRevCount,
			Integer vdrRevScore, Integer vdrID) {

		SerVdrVO servdrVO = new SerVdrVO();

		servdrVO.setVdrStatus(vdrStatus);
		servdrVO.setVdrName(vdrName);
		servdrVO.setVdrTel(vdrTel);
		servdrVO.setVdrVatno(vdrVatno);
		servdrVO.setVdrCounty(vdrCounty);
		servdrVO.setVdrDist(vdrDist);
		servdrVO.setVdrAddr(vdrAddr);
		servdrVO.setVdrOpen(vdrOpen);
		servdrVO.setVdrIntro(vdrIntro);
		servdrVO.setVdrPic(vdrPic);
		servdrVO.setVdrRevCount(vdrRevCount);
		servdrVO.setVdrRevScore(vdrRevScore);
		servdrVO.setVdrID(vdrID);
		dao.update(servdrVO);

		return servdrVO;
	}

	public void deleteSerVdr(Integer vdrID) {

		dao.delete(vdrID);
	}

	public SerVdrVO getoneSerVdr(Integer vdrID) {
		return dao.findByPrimaryKey(vdrID);
	}

	public List<SerVdrVO> getAll() {
		return dao.getAll();
	}

}
