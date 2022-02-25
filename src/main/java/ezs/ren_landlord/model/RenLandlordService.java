package ezs.ren_landlord.model;

import java.util.List;

public class RenLandlordService {

	private RenLandlordDAO_interface dao;

	public RenLandlordService() {
		dao = new RenLandlordDAO();
	}

	public RenLandlordVO addLandlord(Integer lddMemId,byte[] lddPic) {

		RenLandlordVO renLandlordVO = new RenLandlordVO();

		renLandlordVO.setLddMemId(lddMemId);
		renLandlordVO.setLddPic(lddPic);

		dao.insert(renLandlordVO);

		return renLandlordVO;
	}

	public RenLandlordVO updateLandlord(Integer lddId,Integer lddMemId,Integer lddApproval) {

		RenLandlordVO renLandlordVO = new RenLandlordVO();
		
		renLandlordVO.setLddId(lddId);
		renLandlordVO.setLddMemId(lddMemId);
		renLandlordVO.setLddApproval(lddApproval);
		dao.update(renLandlordVO);

		dao.updatestatus(renLandlordVO);
		return renLandlordVO;
	}

	public void deleteLandlord(Integer lddId) {
		dao.delete(lddId);
	}

	public RenLandlordVO getOneLandlord(Integer lddId) {
		return dao.findByPrimaryKey(lddId);
	}
	public List<RenLandlordVO> getOneLandlordbymemid(Integer lddMemId) {
		return dao.findByMemID(lddMemId);
	}

	public List<RenLandlordVO> getAll() {
		return dao.getAll();
	}
	
	public Integer findByMEM(Integer lddMemId) {
		return dao.findByMEM(lddMemId);
	}
}
