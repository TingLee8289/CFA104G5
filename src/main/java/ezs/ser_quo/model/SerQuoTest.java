package ezs.ser_quo.model;

import java.math.BigDecimal;
import java.util.List;


public class SerQuoTest {
	public static void main(String[] args) {
		SerQuoJDBCDAO dao = new SerQuoJDBCDAO();
		// insert
		SerQuoVO q1 = new SerQuoVO();
		q1.setQuoStatus((byte)0);
		q1.setQuoDmdID(4);
		q1.setQuoVdrID(2);
		q1.setQuoDate(java.sql.Date.valueOf("2021-01-26"));
		q1.setQuoExpiryDate(java.sql.Date.valueOf("2021-02-26"));
		q1.setQuoItem("青仔500");
		q1.setQuoTotalPrice(new BigDecimal(500));
		dao.insert(q1);
//		SerQuoVO q5 = new SerQuoVO();
//		q5.setQuoStatus((byte)0);
//		q5.setQuoDmdID(3);
//		q5.setQuoVdrID(3);
//		q5.setQuoDate(java.sql.Date.valueOf("2021-01-26"));
//		q5.setQuoExpiryDate(java.sql.Date.valueOf("2021-02-26"));
//		q5.setQuoItem("青仔500");
//		q5.setQuoTotalPrice(new BigDecimal(500));
//		dao.insert(q5);
		// update
//		SerQuoVO q2 = new SerQuoVO();
//		q2.setQuoID(6);
//		q2.setQuoStatus((byte)0);
//		q2.setQuoDmdID(3);
//		q2.setQuoVdrID(5);
//		q2.setQuoDate(java.sql.Date.valueOf("2021-01-27"));
//		q2.setQuoExpiryDate(java.sql.Date.valueOf("2021-02-27"));
//		q2.setQuoItem("青仔5000");
//		q2.setQuoTotalPrice(new BigDecimal(5000));
//		dao.update(q2);
		// delete
//		dao.delete(6);
		// findone
//		SerQuoVO q4 = dao.findByPrimaryKey(2);
//		System.out.print(q4.getQuoID() + " ");
//		System.out.print(q4.getQuoItem());

		// finall
		List<SerQuoVO> list = dao.getAll();
		for (SerQuoVO ser5 : list) {
			System.out.print(ser5.getQuoID());
			System.out.print(ser5.getQuoTotalPrice() + " ");
		}
	}
}
