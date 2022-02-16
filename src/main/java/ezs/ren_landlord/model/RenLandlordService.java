package ezs.ren_landlord.model;

import java.util.List;

public class RenLandlordService {

	private RenLandlordDAO_interface dao;

	public RenLandlordService() {
		dao = new RenLandlordDAO();
	}

	public RenLandlordVO addLandlord(Integer lddMemId,Integer lddApproval) {

		RenLandlordVO renLandlordVO = new RenLandlordVO();

		renLandlordVO.setLddMemId(lddMemId);
		renLandlordVO.setLddApproval(lddApproval);

		dao.insert(renLandlordVO);

		return renLandlordVO;
	}

	public RenLandlordVO updateLandlord(Integer lddId,Integer lddMemId,Integer lddApproval) {

		RenLandlordVO renLandlordVO = new RenLandlordVO();
		
		renLandlordVO.setLddId(lddId);
		renLandlordVO.setLddMemId(lddMemId);
		renLandlordVO.setLddApproval(lddApproval);
		dao.update(renLandlordVO);

		return renLandlordVO;
	}

	public void deleteLandlord(Integer lddId) {
		dao.delete(lddId);
	}

	public RenLandlordVO getOneLandlord(Integer lddId) {
		return dao.findByPrimaryKey(lddId);
	}

	public List<RenLandlordVO> getAll() {
		return dao.getAll();
	}
}
