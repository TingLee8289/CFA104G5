package ezs.ren_lease.model;

import java.util.List;

public class RenLeaseTest {
	public static void main(String[] args) {

		RenLeaseJDBCDAO dao = new RenLeaseJDBCDAO();

		// 新增
//		RenLeaseVO leaseVO1 = new RenLeaseVO();
//		leaseVO1.setLseMemId(2);
//		leaseVO1.setLseLisId(8);
//		leaseVO1.setLseLddId(4);
//		leaseVO1.setLseLddScore(1);
//		leaseVO1.setLseLddTxt("test");
//		leaseVO1.setLseTntScore(1);
//		leaseVO1.setLseTntTxt("test");
//		leaseVO1.setLseStatus(3);
//		leaseVO1.setLseTimestamp(new Timestamp(System.currentTimeMillis()));
//		leaseVO1.setLseStart(java.sql.Date.valueOf("2023-02-01"));
//		leaseVO1.setLseEnd(java.sql.Date.valueOf("2024-02-01"));
//		dao.insert(leaseVO1);	

		// 修改
//		RenLeaseVO leaseVO2 = new RenLeaseVO();
//		leaseVO2.setLseId(5);
//		leaseVO2.setLseMemId(2);
//		leaseVO2.setLseLisId(8);
//		leaseVO2.setLseLddId(4);
//		leaseVO2.setLseLddScore(2);
//		leaseVO2.setLseLddTxt("羞羞");
//		leaseVO2.setLseTntScore(3);
//		leaseVO2.setLseTntTxt("羞羞");
//		leaseVO2.setLseStatus(2);
//		leaseVO2.setLseTimestamp(new Timestamp(System.currentTimeMillis()));
//		leaseVO2.setLseStart(java.sql.Date.valueOf("2023-02-01"));
//		leaseVO2.setLseEnd(java.sql.Date.valueOf("2024-02-01"));
//		dao.update(leaseVO2);

		// 刪除
//		dao.delete(5);

		// 查詢
//		RenLeaseVO leaseVO3 = dao.findByPrimaryKey(1);
//		System.out.print(leaseVO3.getLseId() + ",");
//		System.out.print(leaseVO3.getLseMemId() + ",");
//		System.out.println(leaseVO3.getLseLisId());
//		System.out.print(leaseVO3.getLseLddId() + ",");
//		System.out.print(leaseVO3.getLseLddScore() + ",");
//		System.out.println(leaseVO3.getLseLddTxt());
//		System.out.print(leaseVO3.getLseTntScore() + ",");
//		System.out.print(leaseVO3.getLseTntTxt() + ",");
//		System.out.println(leaseVO3.getLseStatus());
//		System.out.print(leaseVO3.getLseTimestamp() + ",");
//		System.out.print(leaseVO3.getLseStart() + ",");
//		System.out.println(leaseVO3.getLseEnd());
//		System.out.println("---------------------");

		// 查詢
//		List<RenLeaseVO> list = dao.getAll();
//		for (RenLeaseVO alease : list) {
//			System.out.print(alease.getLseId() + ",");
//			System.out.print(alease.getLseMemId() + ",");
//			System.out.println(alease.getLseLisId());
//			System.out.print(alease.getLseLddId() + ",");
//			System.out.print(alease.getLseLddScore() + ",");
//			System.out.println(alease.getLseLddTxt());
//			System.out.print(alease.getLseTntScore() + ",");
//			System.out.print(alease.getLseTntTxt() + ",");
//			System.out.println(alease.getLseStatus());
//			System.out.print(alease.getLseTimestamp() + ",");
//			System.out.print(alease.getLseStart() + ",");
//			System.out.println(alease.getLseEnd());
//			System.out.println("---------------------");
//		}
		
//		List<RenLeaseVO> list = dao.getAll(6);
//		for (RenLeaseVO alease : list) {
//			System.out.print(alease.getLseId() + ",");
//			System.out.print(alease.getLseMemId() + ",");
//			System.out.println(alease.getLseLisId());
//			System.out.print(alease.getLseLddId() + ",");
//			System.out.print(alease.getLseLddScore() + ",");
//			System.out.println(alease.getLseLddTxt());
//			System.out.print(alease.getLseTntScore() + ",");
//			System.out.print(alease.getLseTntTxt() + ",");
//			System.out.println(alease.getLseStatus());
//			System.out.print(alease.getLseTimestamp() + ",");
//			System.out.print(alease.getLseStart() + ",");
//			System.out.println(alease.getLseEnd());
//			System.out.println("---------------------");
//		}
		

	}
}
