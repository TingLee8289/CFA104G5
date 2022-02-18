package ezs.ser_cla.model;

import java.util.List;
import java.util.Scanner;

public class SerClaTest {
	public static void main(String[] args) {

		SerClaDAO_interface dao = new SerClaJDBCDAO();

		// 新增 -測試OK
//        SerClaVO ser1 = new SerClaVO();
//        ser1.setSerClaID(18);
//        ser1.setSerClaName("水泥工程");
//        dao.insert(ser1);

		// 修改 -測試OK
//        SerClaVO ser2 = new SerClaVO();
//        ser2.setSerClaID(18);
//        ser2.setSerClaName("水電工程");
//        dao.update(ser2);

		// 刪除 -測試OK
        dao.delete(2);

		// 查詢 -測試OK
//        SerClaVO ser4 = dao.findByPrimaryKey(2);
//        System.out.print(ser4.getSerClaID()+" ");
//        System.out.print(ser4.getSerClaName());

		// 查詢2 -測試OK
//		List<SerClaVO> list = dao.getAll();
//		for (SerClaVO ser5 : list) {
//			System.out.print(ser5.getSerClaID());
//			System.out.print(ser5.getSerClaName() + " ");
//		}

	}

}
