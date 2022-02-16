package ezs.admin_priv.model;

import java.util.List;

public class AdminPrivTest {

	public static void main(String[] args) {
		AdminPrivJDBCDAO dao = new AdminPrivJDBCDAO();

// 		1. 新增
//		AdminPrivVO adminPrivVO1 = new AdminPrivVO();
//		adminPrivVO1.setAdmID(3);
//		adminPrivVO1.setFunID(2);
//		System.out.println("成功");
//		dao.insert(adminPrivVO1);
		
//		2. 刪除
//		dao.delete(3,2);
//		System.out.println("成功");

//		3. 查詢單筆
//		AdminPrivVO adminPrivVO3 = dao.findByPrimaryKey(1,1);
//		System.out.print(adminPrivVO3.getAdmID() + ",");
//		System.out.print(adminPrivVO3.getFunID());
//		System.out.println("---------------------");

//		4. 查詢多筆
		List<AdminPrivVO> list = dao.getAll();
		for (AdminPrivVO aVo : list) {
			System.out.print(aVo.getAdmID() + ",");
			System.out.print(aVo.getFunID());
			System.out.println();
		}
	}

}
