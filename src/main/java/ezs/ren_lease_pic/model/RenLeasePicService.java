package ezs.ren_lease_pic.model;

import java.util.List;

public class RenLeasePicService {

	private RenLeasePicDAO_interface dao;

	public RenLeasePicService() {
		dao = new RenLeasePicDAO();
	}

	public RenLeasePicVO addRenLeasePic(Integer lpLeaseId, byte[] lpPic) {

		RenLeasePicVO renLeasePicVO = new RenLeasePicVO();

		renLeasePicVO.setLpLeaseId(lpLeaseId);
		renLeasePicVO.setLpPic(lpPic);
		dao.insert(renLeasePicVO);

		return renLeasePicVO;
	}

	public RenLeasePicVO updateRenLeasePic(Integer lpId,Integer lpLeaseId, byte[] lpPic) {

		RenLeasePicVO renLeasePicVO = new RenLeasePicVO();

		renLeasePicVO.setLpId(lpId);
		renLeasePicVO.setLpLeaseId(lpLeaseId);
		renLeasePicVO.setLpPic(lpPic);
		dao.update(renLeasePicVO);

		return renLeasePicVO;
	}

	public void deleteRenLeasePic(Integer lpId) {
		dao.delete(lpId);
	}

	public RenLeasePicVO getOneRenLeasePic(Integer lpId) {
		return dao.findByPrimaryKey(lpId);
	}

	public List<RenLeasePicVO> getAll() {
		return dao.getAll();
	}
}
