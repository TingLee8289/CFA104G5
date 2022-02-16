package ezs.ren_lease_pic.model;

import java.io.IOException;
import java.util.List;

public class RenLeasePicTest {
	public static void main(String[] args) throws IOException {

		RenLeasePicJDBCDAO dao = new RenLeasePicJDBCDAO();

		// 新增
//		RenLeasePicVO lease_picVO1 = new RenLeasePicVO();
//		lease_picVO1.setLpLeaseId(3);
//		path = "items/logo.JPG";
//		dao.insert(lease_picVO1);

		// 修改
//		RenLeasePicVO lease_picVO2 = new RenLeasePicVO();
//		lease_picVO2.setLpId(9);
//		lease_picVO2.setLpLeaseId(2);
//		path = "items/IMG_5766.JPG";
//		dao.update(lease_picVO2);

		// 刪除
//		dao.delete(10);

		// PK查詢
		RenLeasePicVO llease_picVO3 = dao.findByPrimaryKey(4);
		System.out.print(llease_picVO3.getLpId() + ",");
		System.out.println(llease_picVO3.getLpLeaseId());

		System.out.println("---------------------");

		// 查詢全部
		List<RenLeasePicVO> list = dao.getAll();
		for (RenLeasePicVO alease_pic : list) {
			System.out.print(alease_pic.getLpId() + ",");
			System.out.print(alease_pic.getLpLeaseId());
			System.out.println();
		}
	}
}
