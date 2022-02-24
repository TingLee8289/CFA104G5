package ezs.ren_lease.model;

import java.sql.Date;
import java.util.List;

public class RenLeaseService {

	private RenLeaseDAO_interface dao;

	public RenLeaseService() {
		dao = new RenLeaseDAO();
	}

	public RenLeaseVO addRenLease(Integer lseMemId, Integer lseLisId, Integer lseLddId,Integer lsePrice, Date lseStart, Date lseEnd,byte[] lsePic,Integer lseLeaseMemId) {
		RenLeaseVO renLeaseVO = new RenLeaseVO();

		renLeaseVO.setLseMemId(lseMemId);
		renLeaseVO.setLseLisId(lseLisId);
		renLeaseVO.setLseLddId(lseLddId);
		renLeaseVO.setLsePrice(lsePrice);
		renLeaseVO.setLseStart(lseStart);
		renLeaseVO.setLseEnd(lseEnd);
		renLeaseVO.setLsePic(lsePic);
		renLeaseVO.setLseLeaseMemId(lseLeaseMemId);

		dao.insert(renLeaseVO);

		return renLeaseVO;
	}

	public RenLeaseVO updateLease(Integer lsePrice,Integer LseLddScore, String lseLddTxt, Integer lseTntScore, String lseTntTxt, Integer lseStatus, Date lseStart, Date lseEnd) {

		RenLeaseVO renLeaseVO = new RenLeaseVO();

		renLeaseVO.setLseLddScore(LseLddScore);
		renLeaseVO.setLseLddTxt(lseLddTxt);
		renLeaseVO.setLseTntScore(lseTntScore);
		renLeaseVO.setLseTntTxt(lseTntTxt);
		renLeaseVO.setLseStatus(lseStatus);
		renLeaseVO.setLseStart(lseStart);
		renLeaseVO.setLseEnd(lseEnd);
		dao.update(renLeaseVO);

		return renLeaseVO;
	}

	public void deleteRenLease(Integer lseId) {
		dao.delete(lseId);
	}

	public RenLeaseVO getOneRenLease(Integer lseId) {
		return dao.findByPrimaryKey(lseId);
	}

	public List<RenLeaseVO> getAll() {
		return dao.getAll();
	}


	public List<RenLeaseVO> getAllMEM(Integer lseLeaseMemId){
		return dao.getAllMEM(lseLeaseMemId);
	}

	public List<RenLeaseVO> getAllLease(Integer lse_mem_id) {
		return dao.getAllLease(lse_mem_id);
	}

}
