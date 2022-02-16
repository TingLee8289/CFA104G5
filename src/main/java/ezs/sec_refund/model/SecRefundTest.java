package ezs.sec_refund.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class SecRefundTest {

	public static void main(String[] args) {

		SecRefundJDBCDAO dao = new SecRefundJDBCDAO();

//		1. 新增
//		SecRefundVO secRefundVO1 = new SecRefundVO();
//		secRefundVO1.setShOrdID(4);
//		secRefundVO1.setShRefContent("品質不良!!");
//		secRefundVO1.setShRefApplyDate(Date.valueOf("2021-01-01"));   
//		secRefundVO1.setShRefStatus(0);
//	
//		dao.insert(secRefundVO1);

//		2. 刪除
//		dao.delete(2);

//		3. 修改
		SecRefundVO secRefundVO2 = new SecRefundVO();
		secRefundVO2.setShOrdID(4);
		
		secRefundVO2.setShRefContent("測試中文字測試中文字");
		secRefundVO2.setShRefApplyDate(Date.valueOf("2022-02-28"));
		secRefundVO2.setShRefStatus(1);
		secRefundVO2.setShRefID(4);
		dao.update(secRefundVO2);


//		4. 單筆查詢
		SecRefundVO secRefundVO3 = dao.findByPrimaryKey(3);
		System.out.print(secRefundVO3.getShRefID() + ",");
		System.out.print(secRefundVO3.getShOrdID() + ",");
		System.out.print(secRefundVO3.getShRefContent() + ",");
		System.out.print(secRefundVO3.getShRefApplyDate() + ",");
		System.out.print(secRefundVO3.getShRefStatus());
		System.out.println("---------------------");

//		5. 多筆查詢
		List<SecRefundVO> list = dao.getAll();
		for (SecRefundVO secRefundVO4 : list) {
			
			System.out.print(secRefundVO4.getShRefID() + ",");
			System.out.print(secRefundVO4.getShOrdID() + ",");
			System.out.print(secRefundVO4.getShRefContent() + ",");
			System.out.print(secRefundVO4.getShRefApplyDate() + ",");
			System.out.print(secRefundVO4.getShRefStatus());
		
			System.out.println();
		}
	}
	

}
