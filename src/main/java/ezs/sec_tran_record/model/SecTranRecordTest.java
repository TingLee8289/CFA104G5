package ezs.sec_tran_record.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public class SecTranRecordTest {
	public static void main(String[] args) {

		SecTranRecordJDBCDAO dao = new SecTranRecordJDBCDAO();

//		1. 新增
//		SecTranRecordVO secTranRecordVO1 = new SecTranRecordVO();
//		secTranRecordVO1.setShTranMemID(11);
//		secTranRecordVO1.setShTranTime(Date.valueOf("2021-01-01"));
//		secTranRecordVO1.setShTranCategory(0);
//		secTranRecordVO1.setShTranAmount(BigDecimal.valueOf(3000));
//		secTranRecordVO1.setShTranAP(BigDecimal.valueOf(-3000));
//		secTranRecordVO1.setShTranBal(BigDecimal.valueOf(1000));
//
//		dao.insert(secTranRecordVO1);

//		2. 刪除
//		dao.delete(3);

//		3. 修改
//		SecTranRecordVO secTranRecordVO2 = new SecTranRecordVO();
//
//		secTranRecordVO2.setShTranMemID(2);
//		secTranRecordVO2.setShTranTime(Date.valueOf("2021-01-09"));
//		secTranRecordVO2.setShTranCategory(0);
//		secTranRecordVO2.setShTranAmount(BigDecimal.valueOf(8000));
//		secTranRecordVO2.setShTranAP(BigDecimal.valueOf(-8000));
//		secTranRecordVO2.setShTranBal(BigDecimal.valueOf(2000));
//		secTranRecordVO2.setShTranID(2);
//
//		dao.update(secTranRecordVO2);


//		4. 單筆查詢
		SecTranRecordVO secTranRecordVO3 = dao.findByPrimaryKey(1);
		System.out.print(secTranRecordVO3.getShTranID() + ",");
		System.out.print(secTranRecordVO3.getShTranMemID() + ",");
		System.out.print(secTranRecordVO3.getShTranTime() + ",");
		System.out.print(secTranRecordVO3.getShTranCategory() + ",");
		System.out.print(secTranRecordVO3.getShTranAmount() + ",");
		System.out.print(secTranRecordVO3.getShTranAP() + ",");
		System.out.print(secTranRecordVO3.getShTranBal());

		System.out.println("---------------------");

//		5. 多筆查詢
		List<SecTranRecordVO> list = dao.getAll();
		for (SecTranRecordVO secTranRecordVO4 : list) {
			
			System.out.print(secTranRecordVO4.getShTranID() + ",");
			System.out.print(secTranRecordVO4.getShTranMemID() + ",");
			System.out.print(secTranRecordVO4.getShTranTime() + ",");
			System.out.print(secTranRecordVO4.getShTranCategory() + ",");
			System.out.print(secTranRecordVO4.getShTranAmount() + ",");
			System.out.print(secTranRecordVO4.getShTranAP() + ",");
			System.out.print(secTranRecordVO4.getShTranBal());

			System.out.println();
		}
	}
}
