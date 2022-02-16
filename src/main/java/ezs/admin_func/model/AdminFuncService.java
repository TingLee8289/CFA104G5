package ezs.admin_func.model;

import java.util.List;


public class AdminFuncService {
	
	private AdminFuncDAO_interface dao;
	
	public AdminFuncService() {
		dao = new AdminFuncDAO();
	}
	
	public AdminFuncVO addAdminFun(String funName) {
		
		AdminFuncVO adminFuncVO = new AdminFuncVO();
		
		adminFuncVO.setFunName(funName);
		dao.insert(adminFuncVO);
		
		return adminFuncVO;
	}
	
	public AdminFuncVO updateAdminFun(Integer funID ,String funName) {
		
		AdminFuncVO adminFuncVO = new AdminFuncVO();
		
		adminFuncVO.setFunID(funID);
		adminFuncVO.setFunName(funName);
		dao.update(adminFuncVO);
		
		return adminFuncVO;
	}
	
	public  void  deletAdminEmp(Integer funID) {

		dao.delete(funID);
	}
	
	public  AdminFuncVO  getoneAdminFunc(Integer funID) {
		return dao.findByPrimaryKey(funID);
	}
	
	public  List<AdminFuncVO> getAll() {
		return dao.getAll();
	}
	
}
