package ezs.sec_fav.model;

import java.sql.Date;
import java.util.List;

public class SecFavTest {
	public static void main(String[] args) {

		SecFavJDBCDAO dao = new SecFavJDBCDAO();

//		1. 新增
//		SecFavVO secFavVO1 = new SecFavVO();
//		secFavVO1.setShMemID(1);
//		secFavVO1.setShID(3);
//		secFavVO1.setShAddFavTime(Date.valueOf("2021-01-01"));
//
//		dao.insert(secFavVO1);

//		2. 刪除
//		dao.delete(1, 3);

//		3. 修改
//		SecFavVO secFavVO2 = new SecFavVO();
//
//		secFavVO2.setShAddFavTime(Date.valueOf("2020-12-11"));
//		secFavVO2.setShMemID(2);
//		secFavVO2.setShID(1);
//		dao.update(secFavVO2);


//		4. 單筆查詢
//		SecFavVO secFavVO3 = dao.findByPrimaryKey(1, 2);
//		System.out.print(secFavVO3.getShMemID() + ",");
//		System.out.print(secFavVO3.getShID() + ",");
//		System.out.print(secFavVO3.getShAddFavTime());
//
//		System.out.println("---------------------");

//		5. 多筆查詢
//		List<SecFavVO> list = dao.getAll();
//		for (SecFavVO asecFavVO : list) {
//			System.out.print(asecFavVO.getShMemID() + ",");
//			System.out.print(asecFavVO.getShID() + ",");
//			System.out.print(asecFavVO.getShAddFavTime());
//
//			System.out.println();
//		}
	}
}
