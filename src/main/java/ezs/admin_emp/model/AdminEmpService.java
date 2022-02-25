package ezs.admin_emp.model;

import java.util.List;

import ezs.admin_func.model.AdminFuncJDBCDAO;
import ezs.admin_priv.model.AdminPrivService;
import ezs.admin_priv.model.AdminPrivVO;

public class AdminEmpService {
	
	private AdminEmpDAO_interface dao;
	
	public AdminEmpService() {
		dao = new AdminEmpDAO();
	}
	
	public AdminEmpVO addAdminEmp(String admUsername,String admPassword,Integer admStatus) {
		
		AdminEmpVO adminEmpVO = new AdminEmpVO();
		
		adminEmpVO.setAdmUsername(admUsername);
		adminEmpVO.setAdmPassword(admPassword);
		adminEmpVO.setAdmStatus(admStatus);
		dao.insert(adminEmpVO);
		
		return adminEmpVO;
	}
	
	public AdminEmpVO updateAdminEmp(Integer adminID,String admUsername,String admPassword,Integer admStatus) {
		
		AdminEmpVO adminEmpVO = new AdminEmpVO();
		
		adminEmpVO.setAdmID(adminID);
		adminEmpVO.setAdmUsername(admUsername);
		adminEmpVO.setAdmPassword(admPassword);
		adminEmpVO.setAdmStatus(admStatus);
		dao.update(adminEmpVO);
		
		return adminEmpVO;
	}

	public  void  deletAdminEmp(Integer adminID) {

		dao.delete(adminID);
	}

	public  AdminEmpVO  getOneAdminEmp(Integer adminID) {
		return dao.findByPrimaryKey(adminID);
	}

	public  List<AdminEmpVO> getAll() {
		AdminPrivService adminPrivService = new AdminPrivService();
		List<AdminEmpVO> list = dao.getAll();
		for(AdminEmpVO vo : list) {
			Integer adminID = vo.getAdmID();
			List<AdminPrivVO> authList = adminPrivService.getAllFromID(adminID);
			vo.setAuthlist(authList);
		}
		return list;
	}
	
	public  List<AdminEmpVO> getAll1() {
		return dao.getAll1();
	}
	
	public AdminEmpVO Search(String admUsername ,String admPassword) {
		return dao.Search(admUsername ,admPassword);
	}
	
	public AdminEmpVO Check(String admUsername ) {
		return dao.CheckAdmUsername(admUsername);
	}

	
}
