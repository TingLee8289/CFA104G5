package ezs.sec_ord_details.model;

import java.util.List;

public class SecOrdDetailsTest {
	public static void main(String[] args) {

		SecOrdDetailsJDBCDAO dao = new SecOrdDetailsJDBCDAO();

//		1. 新增
//		SecOrdDetailsVO secOrdDetailsVO1 = new SecOrdDetailsVO();
//		secOrdDetailsVO1.setShOrdID(3);
//		secOrdDetailsVO1.setShID(1);
//		secOrdDetailsVO1.setShName("測試測試");
//		secOrdDetailsVO1.setShPrice(10000);
//		secOrdDetailsVO1.setShQty(2);
//
//		dao.insert(secOrdDetailsVO1);

//		2. 刪除
		
//		dao.delete(3, 1);

//		3. 修改
//		SecOrdDetailsVO secOrdDetailsVO2 = new SecOrdDetailsVO();
//		secOrdDetailsVO2.setShName("測試測試");
//		secOrdDetailsVO2.setShPrice(1000);
//		secOrdDetailsVO2.setShQty(1);
//		secOrdDetailsVO2.setShOrdID(1);
//		secOrdDetailsVO2.setShID(2);
//
//		dao.update(secOrdDetailsVO2);
//

//		4. 單筆查詢
//		SecOrdDetailsVO secOrdDetailsVO3 = dao.findByPrimaryKey(3, 3);
//
//		System.out.print(secOrdDetailsVO3.getShOrdID() + ",");
//		System.out.print(secOrdDetailsVO3.getShID() + ",");
//		System.out.print(secOrdDetailsVO3.getShName() + ",");
//		System.out.print(secOrdDetailsVO3.getShPrice() + ",");
//		System.out.print(secOrdDetailsVO3.getShQty() + ",");
//
//		System.out.println("---------------------");
//
//		5. 多筆查詢
//		List<SecOrdDetailsVO> list5 = dao.getAll();
//		for (SecOrdDetailsVO secOrdDetailsVO4 : list5) {
//
//			System.out.print(secOrdDetailsVO4.getShOrdID() + ",");
//			System.out.print(secOrdDetailsVO4.getShID() + ",");
//			System.out.print(secOrdDetailsVO4.getShName() + ",");
//			System.out.print(secOrdDetailsVO4.getShPrice() + ",");
//			System.out.print(secOrdDetailsVO4.getShQty() + ",");
//
//			System.out.println();
//		}
		
//		6. 以訂單編號查詢
		List<SecOrdDetailsVO> list6 = dao.findByShOrdID(13);
		for (SecOrdDetailsVO secOrdDetailsVO4 : list6) {
			
			System.out.print(secOrdDetailsVO4.getShOrdID() + ",");
			System.out.print(secOrdDetailsVO4.getShID() + ",");
			System.out.print(secOrdDetailsVO4.getShName() + ",");
			System.out.print(secOrdDetailsVO4.getShPrice() + ",");
			System.out.print(secOrdDetailsVO4.getShQty());
			System.out.println();
		}
		
		
		
	}
}
