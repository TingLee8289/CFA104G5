package ezs.ser_ad.model;

import java.util.List;

public class SerAdService {
	private SerAdDAO_interface dao;

	public SerAdService() {
		dao = new SerAdDAO();
	}

	public SerAdVO addSerAd(Integer adVdrID, Byte adStatus, Integer adSerClaID, String adDist, String adTxt,
			byte[] adPic) {

		SerAdVO seradVO = new SerAdVO();

		seradVO.setAdVdrID(adVdrID);
		seradVO.setAdStatus(adStatus);
		seradVO.setAdSerClaID(adSerClaID);
		seradVO.setAdDist(adDist);
		seradVO.setAdTxt(adTxt);
		seradVO.setAdPic(adPic);
		dao.insert(seradVO);

		return seradVO;
	}

	public SerAdVO updateSerAd(Byte adStatus, String adDist, String adTxt, byte[] adPic, Integer adVdrID,
			Integer adSerClaID) {

		SerAdVO seradVO = new SerAdVO();

		seradVO.setAdStatus(adStatus);
		seradVO.setAdDist(adDist);
		seradVO.setAdTxt(adTxt);
		seradVO.setAdPic(adPic);
		seradVO.setAdVdrID(adVdrID);
		seradVO.setAdSerClaID(adSerClaID);
		dao.update(seradVO);

		return seradVO;

	}

	public void deleteSerAd(Integer adVdrID, Integer adSerClaID) {
		dao.delete(adVdrID, adSerClaID);
	}

	public SerAdVO getOneSerAd(Integer adVdrID, Integer adSerClaID) {

		return dao.findByPrimartKey(adVdrID, adSerClaID);
	}

	public List<SerAdVO> getAll() {
		return dao.getAll();
	}
	public List<SerAdVO> getAdBySerClaID(Integer adSerClaID) {
		return dao.getAdBySerClaID(adSerClaID);
	}

}
