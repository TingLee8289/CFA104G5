package ezs.ser_dmd.model;

import java.util.List;

public class SerDmdTest {
	public static void main(String[] args) {
		SerDmdDAO_interface dao = new SerDmdJDBCDAO();

		// 新增 測試OK
//		SerDmdVO dem1 = new SerDmdVO();
//		dem1.setDmdID(4);
//		dem1.setDmdStatus((byte)1);
//		dem1.setDmdMemID(4);
//		dem1.setDmdSerClaID(2);
//		dem1.setDmdName("吳冠宏");
//		dem1.setDmdTel("0988998876");
//		dem1.setDmdMail("124@gmail.com");
//		dem1.setDmdCounty("台北市");
//		dem1.setDmdRegion("文山區");
//		dem1.setDmdAddress("木柵路一段一號");
//		dem1.setDmdSpaceClass("層樓");
//		dem1.setDmdSquare(30);
//		dem1.setDmdBudget(5000000);
//		dem1.setDmdIntro("重新改造");
//		dem1.setDmdPic(null);
//		dao.insert(dem1);
//
		// 修改 測試OK
		SerDmdVO dem2 = new SerDmdVO();
		dem2.setDmdID(1);
		dem2.setDmdStatus((byte)1);
		dem2.setDmdMemID(1);
		dem2.setDmdSerClaID(3);
		dem2.setDmdName("潘麗貞");
		dem2.setDmdTel("0955690988");
		dem2.setDmdMail("890@gmail.com");
		dem2.setDmdCounty("台中市");
		dem2.setDmdRegion("霧峰區");
		dem2.setDmdAddress("霧峰路一段一號");
		dem2.setDmdSpaceClass("套房");
		dem2.setDmdSquare(30);
		dem2.setDmdBudget(70000);
		dem2.setDmdIntro("重新粉刷");
		dem2.setDmdPic(null);
		dao.update(dem2);

		// 刪除 測試OK
//		dao.delete(4);

		// 查詢 測試OK
//		SerDmdVO dem3 = dao.findByPrimaryKey(1);
//		System.out.print(dem3.getDmdID());
//		System.out.print(dem3.getDmdStatus());
//		System.out.print(dem3.getDmdMemID());
//		System.out.print(dem3.getDmdSerClaID());
//		System.out.print(dem3.getDmdName());
//		System.out.print(dem3.getDmdTel());
//		System.out.print(dem3.getDmdMail());
//		System.out.print(dem3.getDmdCounty());
//		System.out.print(dem3.getDmdRegion());
//		System.out.print(dem3.getDmdAddress());
//		System.out.print(dem3.getDmdSpaceClass());
//		System.out.print(dem3.getDmdSquare());
//		System.out.print(dem3.getDmdBudget());
//		System.out.print(dem3.getDmdIntro());
//		System.out.print(dem3.getDmdPic());

		// 查詢2 測試OK
		List<SerDmdVO> list = dao.getAll();
		for (SerDmdVO dem4 : list) {
			System.out.print(dem4.getDmdID() + " ");
			System.out.print(dem4.getDmdStatus() + " ");
			System.out.print(dem4.getDmdMemID() + " ");
			System.out.print(dem4.getDmdSerClaID() + " ");
			System.out.print(dem4.getDmdName() + " ");
			System.out.print(dem4.getDmdTel() + " ");
			System.out.print(dem4.getDmdMail() + " ");
			System.out.print(dem4.getDmdCounty() + " ");
			System.out.print(dem4.getDmdRegion() + " ");
			System.out.print(dem4.getDmdAddress() + " ");
			System.out.print(dem4.getDmdSpaceClass() + " ");
			System.out.print(dem4.getDmdSquare() + " ");
			System.out.print(dem4.getDmdBudget() + " ");
			System.out.print(dem4.getDmdIntro() + " ");
			System.out.print(dem4.getDmdPic() + " ");
			System.out.println();
		}

	}

}
