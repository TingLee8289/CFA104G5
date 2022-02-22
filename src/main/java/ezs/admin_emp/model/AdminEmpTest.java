package ezs.admin_emp.model;

import java.util.List;

public class AdminEmpTest {
	
	public static void main(String[] args) {

		AdminEmpJDBCDAO dao = new AdminEmpJDBCDAO();

//		// 1. 新增
		AdminEmpVO adminEmpVO1 = new AdminEmpVO();
		adminEmpVO1.setAdmUsername("happyjavaman");
		adminEmpVO1.setAdmPassword("123456");
		adminEmpVO1.setAdmStatus(1);
//		
//		dao.insert(adminEmpVO1);

//		// 2. 修改
//		AdminEmpVO adminEmpVO2 = new AdminEmpVO();
//		
//		adminEmpVO2.setAdmUsername("unhappyjavaman");
//		adminEmpVO2.setAdmPassword("1234567");
//		adminEmpVO2.setAdmStatus(0);
//		adminEmpVO2.setAdmID(5);
//
//		dao.update(adminEmpVO2);

//		// 3. 刪除
//		dao.delete(4);
//
//		// 4. 查詢單筆
//		AdminEmpVO adminEmpVO3 = dao.findByPrimaryKey(1);
//		System.out.print(adminEmpVO3.getAdmID() + ",");
//		System.out.print(adminEmpVO3.getAdmUsername() + ",");
//		System.out.print(adminEmpVO3.getAdmPassword() + ",");
//		System.out.print(adminEmpVO3.getAdmStatus());
//		System.out.println("---------------------");
//
//		5. 查詢多筆
//		List<AdminEmpVO> list = dao.getAll();
//		.out.print(aadminEmpVO.getAdmPassword() + ",");
//			System.out.print(aadminEmpVO.getAdmStatus());
//			System.out.println();
//		}for (AdminEmpVO aadminEmpVO : list) {
//			System.out.print(aadminEmpVO.getAdmID() + ",");
//			System.out.print(aadminEmpVO.getAdmUsername() + ",");
//			System
		
		AdminEmpVO adminEmpVO4 = dao.Search("Alex","alex123");
		System.out.print(adminEmpVO4.getAdmID() + ",");
		System.out.print(adminEmpVO4.getAdmUsername() + ",");
		System.out.print(adminEmpVO4.getAdmPassword() + ",");
		System.out.print(adminEmpVO4.getAdmStatus());
		System.out.println("---------------------");
//
//		AdminEmpVO adminEmpVO4 = dao.CheckAdmUsername("BOSS");
//		System.out.print(adminEmpVO4.getAdmUsername() + ",");
//		System.out.println("---------------------");
		
	}
}
