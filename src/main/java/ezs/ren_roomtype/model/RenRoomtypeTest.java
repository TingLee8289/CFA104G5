package ezs.ren_roomtype.model;

import java.util.List;

public class RenRoomtypeTest {
	public static void main(String[] args) {
		RenRoomtypeJDBCDAO dao = new RenRoomtypeJDBCDAO();

		// 新增
//		RenRoomtypeVO roomtypeVO1 = new RenRoomtypeVO();
//		roomtypeVO1.setRtID(4);
//		roomtypeVO1.setRtType("其他");
//		dao.insert(roomtypeVO1);

		// 更新
//		RenRoomtypeVO roomtypeVO2 = new RenRoomtypeVO();
//		roomtypeVO2.setRtID(4);
//		roomtypeVO2.setRtType("其他1");
//		dao.update(roomtypeVO2);

		// 刪除
//		dao.delete(4);

		// PK查詢
//		RenRoomtypeVO roomtypeVO3 = dao.findByPrimaryKey(2);
//		System.out.print(roomtypeVO3.getRtID() + ",");
//		System.out.println(roomtypeVO3.getRtType());
//		System.out.println("------------------");
//		
		// 全部查詢
		List<RenRoomtypeVO> list = dao.getAll();
		for (RenRoomtypeVO aRoomtype : list) {
			System.out.print(aRoomtype.getRtID() + ",");
			System.out.print(aRoomtype.getRtType());
			System.out.println();
		}
	}
}
