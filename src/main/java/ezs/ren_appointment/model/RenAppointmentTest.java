package ezs.ren_appointment.model;

import java.util.List;

public class RenAppointmentTest {

	public static void main(String[] args) {

		RenAppointmentJDBCDAO dao = new RenAppointmentJDBCDAO();

		// Insert
//		RenAppointmentVO app1 = new RenAppointmentVO();
//		app1.setAptMemId(15);
//		app1.setAptLddId(1);
//		app1.setAptLisId(2);
//		app1.setAptStatus(0);
//		app1.setAptTime(java.sql.Timestamp.valueOf("2022-01-31 19:00:00"));
//		app1.setAptTimestamp(java.sql.Timestamp.valueOf("2022-01-28 21:03:45"));
//		dao.insert(app1);

		// Update
//		RenAppointmentVO app2 = new RenAppointmentVO();
//		app2.setAptId(6);
//		app2.setAptMemId(15);
//		app2.setAptLddId(1);
//		app2.setAptLisId(2);
//		app2.setAptStatus(1);
//		app2.setAptTime(java.sql.Timestamp.valueOf("2022-02-02 19:00:00"));
//		dao.update(app2);

		// Delete
//		dao.delete(6);

		// Find by PK
//		System.out.println("--PK查詢-------------------");
//		RenAppointmentVO app3 = dao.findByPK(2);
//		System.out.print(app3.getAptMemId() + ",");
//		System.out.print(app3.getAptLddId() + ",");
//		System.out.print(app3.getAptLisId() + ",");
//		System.out.print(app3.getAptStatus() + ",");
//		System.out.print(app3.getAptTime() + ",");
//		System.out.println(app3.getAptTimestamp());

		// Find All
//		System.out.println("--查詢全部-------------------");
//		List<RenAppointmentVO> appList = dao.getAll();
//		for (RenAppointmentVO aList : appList) {
//			System.out.print(aList.getAptId() + ",");
//			System.out.print(aList.getAptMemId() + ",");
//			System.out.print(aList.getAptLddId() + ",");
//			System.out.print(aList.getAptLisId() + ",");
//			System.out.print(aList.getAptStatus() + ",");
//			System.out.print(aList.getAptTime() + ",");
//			System.out.print(aList.getAptTimestamp());
//			System.out.println();
//		}

		
		System.out.println("--PK查詢-------------------");
		List<RenAppointmentVO> appList = dao.getAllLDD(1);
		for (RenAppointmentVO aList : appList) {
			System.out.print(aList.getAptId() + ",");
			System.out.print(aList.getAptMemId() + ",");
			System.out.print(aList.getAptLddId() + ",");
			System.out.print(aList.getAptLisId() + ",");
			System.out.print(aList.getAptStatus() + ",");
			System.out.print(aList.getAptTime() + ",");
			System.out.print(aList.getAptTimestamp());
			System.out.println();
		}

	}
}
