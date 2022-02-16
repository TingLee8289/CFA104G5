package ezs.admin_func.model;

import java.util.List;

public class AdminFuncTest {
	public static void main(String[] args) {
		AdminFuncJDBCDAO dao = new AdminFuncJDBCDAO();

//		1. 新增
//		AdminFuncVO admFuncVO1 = new AdminFuncVO();
//		admFuncVO1.setFunName("下架");
//		System.out.println("成功");
//		dao.insert(admFuncVO1);
//
//		2. 修改
//		AdminFuncVO admFuncVO2 = new AdminFuncVO();
//		admFuncVO2.setFunID(4);
//		admFuncVO2.setFunName("員工管理");
//		System.out.println("成功");
//		dao.update(admFuncVO2);
//
//		3.刪除
//		dao.delete(4);
//		System.out.println("成功");
//
//		4. 單筆查詢
//		AdminFuncVO admFuncVO3 = dao.findByPrimaryKey(1);
//		System.out.print(admFuncVO3.getFunID() + ",");
//		System.out.print(admFuncVO3.getFunName() + ",");
//		System.out.println("---------------------");
//
//		5. 多筆查詢
		List<AdminFuncVO> list = dao.getAll();
		for (AdminFuncVO aVo : list) {
			System.out.print(aVo.getFunID() + ",");
			System.out.print(aVo.getFunName());
			System.out.println();
		}
	}
}
