package ezs.admin_priv.model;

import java.util.List;

import ezs.admin_func.model.AdminFuncVO;

public class AdminPrivService {
	private AdminPriv_interface dao;

	public AdminPrivService() {
		dao = new AdminPrivDAO();
	}

	public AdminPrivVO addAdminPriv(Integer admID, Integer funID) {

		AdminPrivVO adminPrivVO = new AdminPrivVO();

		adminPrivVO.setAdmID(admID);
		adminPrivVO.setFunID(funID);
		dao.insert(adminPrivVO);

		return adminPrivVO;
	}

	public void deleteAdminPriv(Integer admID) {

		dao.delete(admID);
	}

	public  AdminPrivVO  getoneAdminFunc(Integer admID, Integer funID) {
		return dao.findByPrimaryKey(admID, funID);
	}
	
	public List<AdminPrivVO> getAllFromID (Integer adminID){
		return dao.getAllFromID(adminID);
	}
//	public List<AdminPrivVO> getAllFromID (Objectb adminID){
//		return dao.getAllFromID(adminID);
//	}
	
	public  List<AdminPrivVO> getAll() {
		return dao.getAll();
	}
}
