package ezs.ren_location.model;

import java.util.List;

public class RenLocationTest {
	public static void main(String[] args) {
		RenLocationJDBCDAO dao = new RenLocationJDBCDAO();

		// 新增
//		RenLocationVO locationVO1 = new RenLocationVO();		
//		locationVO1.setLocCity("苗栗縣");
//		locationVO1.setLocDist("苗栗市");
//		dao.insert(locationVO1);

		// 修改
//		RenLocationVO locationVO2 = new RenLocationVO();		
//		locationVO2.setLocID(65);		
//		locationVO2.setLocCity("苗栗縣");
//		locationVO2.setLocDist("頭份市");
//		dao.update(locationVO2);

		// 刪除
//		dao.delete(65);

		// PK查詢
//		RenLocationVO locationVO3 = dao.findByPrimaryKey(63);
//		System.out.print(locationVO3.getLocID() + ",");
//		System.out.print(locationVO3.getLocCity() + ",");
//		System.out.println(locationVO3.getLocDist() + ",");
//		System.out.println("---------------------");


		// 全部查詢
		List<RenLocationVO> list = dao.getAll();
		for (RenLocationVO aLocation : list) {
			System.out.print(aLocation.getLocID() + ",");
			System.out.print(aLocation.getLocCity() + ",");
			System.out.print(aLocation.getLocDist());
			System.out.println();
		}
	}
}
