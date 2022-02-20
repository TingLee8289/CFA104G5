package ezs.sec_ord.model;

import java.math.BigDecimal;
import java.util.List;

public class SecOrdTest {

	public static void main(String[] args) {
		SecOrdJDBCDAO dao = new SecOrdJDBCDAO();
		SecOrdVO secOrdVO = new SecOrdVO();

//		1. 新增
		secOrdVO.setShBuyerID(1);
		secOrdVO.setShSellerID(2);
		secOrdVO.setShPostcode(320);
		secOrdVO.setShCounty("測試測試測試測試");
		secOrdVO.setShDist("測試測試");
		secOrdVO.setShRoad("測試測試測試測試測試測試");
		secOrdVO.setShPayment(10);
		secOrdVO.setShOrdStatus(2);
		secOrdVO.setShPrice(new BigDecimal(1000));
		secOrdVO.setShDate(new java.sql.Date(new java.util.Date().getTime()));
		secOrdVO.setShAPPDate(new java.sql.Date((new java.util.Date().getTime()) + 14 *24 *60 * 60 *1000L));
		secOrdVO.setShNotes("zzz");
		dao.insert(secOrdVO);

//		2. 刪除
//		Integer shOrdID = 5;
//		dao.delete(shOrdID);
//		
//		3. 修改
//		secOrdVO.setShBuyerID(3);
//		secOrdVO.setShSellerID(4);
//		secOrdVO.setShPostcode(100);
//		secOrdVO.setShCounty("測試測試");
//		secOrdVO.setShDist("測試測試");
//		secOrdVO.setShRoad("測試測試測試測試測試測試");
//		secOrdVO.setShPayment(11);
//		secOrdVO.setShOrdStatus(1);
//		secOrdVO.setShPrice(new BigDecimal(100));
//		secOrdVO.setShDate(new java.sql.Date(new java.util.Date().getTime()));
//		secOrdVO.setShBuyerScore(1);
//		secOrdVO.setShBuyerTXT("xxx");
//		secOrdVO.setShSellerScore(2);
//		secOrdVO.setShSellerTXT("yyy");
//		secOrdVO.setShAPPDate(new java.sql.Date((new java.util.Date().getTime()) + 14 *24 *60 * 60 *1000L));
//		secOrdVO.setShNotes("xyz");
//		secOrdVO.setShOrdID(4);
//		dao.update(secOrdVO);
//		
//		4. 查詢單筆資料
//		secOrdVO = dao.findByPrimaryKey(1);
//		System.out.print(secOrdVO.getShOrdID() + "\t");
//		System.out.print(secOrdVO.getShBuyerID() + "\t");
//		System.out.print(secOrdVO.getShSellerID() + "\t");
//		System.out.print(secOrdVO.getShPostcode() + "\t");
//		System.out.print(secOrdVO.getShCounty() + "\t");
//		System.out.print(secOrdVO.getShDist() + "\t");
//		System.out.print(secOrdVO.getShRoad() + "\t");
//		System.out.print(secOrdVO.getShPayment() + "\t");
//		System.out.print(secOrdVO.getShOrdStatus() + "\t");
//		System.out.print(secOrdVO.getShPrice() + "\t");
//		System.out.print(secOrdVO.getShDate() + "\t");
//		System.out.print(secOrdVO.getShBuyerScore() + "\t");
//		System.out.print(secOrdVO.getShBuyerTXT() + "\t");
//		System.out.print(secOrdVO.getShSellerScore() + "\t");
//		System.out.print(secOrdVO.getShSellerTXT() + "\t");
//		System.out.print(secOrdVO.getShAPPDate() + "\t");
//		System.out.print(secOrdVO.getShNotes() + "\t");
		
		
//		
////		5. 查詢多筆資料
//		List<SecOrdVO> list = dao.getAll();
//		for (SecOrdVO asecOrdVO : list) {
//			System.out.print(asecOrdVO.getShOrdID() + "\t");
//			System.out.print(asecOrdVO.getShBuyerID() + "\t");
//			System.out.print(asecOrdVO.getShSellerID() + "\t");
//			System.out.print(asecOrdVO.getShPostcode() + "\t");
//			System.out.print(asecOrdVO.getShCounty() + "\t");
//			System.out.print(asecOrdVO.getShDist() + "\t");
//			System.out.print(asecOrdVO.getShRoad() + "\t");
//			System.out.print(asecOrdVO.getShPayment() + "\t");
//			System.out.print(asecOrdVO.getShOrdStatus() + "\t");
//			System.out.print(asecOrdVO.getShPrice() + "\t");
//			System.out.print(asecOrdVO.getShDate() + "\t");
//			System.out.print(asecOrdVO.getShBuyerScore() + "\t");
//			System.out.print(asecOrdVO.getShBuyerTXT() + "\t");
//			System.out.print(asecOrdVO.getShSellerScore() + "\t");
//			System.out.print(asecOrdVO.getShSellerTXT() + "\t");
//			System.out.print(asecOrdVO.getShAPPDate() + "\t");
//			System.out.print(asecOrdVO.getShNotes() + "\t");
//			System.out.println();
//		}

	}

}
