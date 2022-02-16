package ezs.sec_pics.model;

import java.io.IOException;
import java.util.List;

public class SecPicsTest {

	public static void main(String[] args) {
		SecPicsJDBCDAO dao = new SecPicsJDBCDAO();
		SecPicsVO secPicsVO = new SecPicsVO();
		
//		1. 新增
//		try {
//			secPicsVO.setShPicID(5);
//			secPicsVO.setShID(1);
//			byte[] pic = dao.getPictureByteArray("C:/CFA104_WebApp/eclipse_WTP_workspace1/CFA104G5/src/main/webapp/images/1.jpg");
//			secPicsVO.setShPic(pic);
//			dao.insert(secPicsVO);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//
//		2. 刪除
//		Integer shPicID = 4;
//		dao.delete(shPicID);
//		
//		3.修改
//		try {
//			secPicsVO.setShPicID(3);
//			secPicsVO.setShID(2);
//			byte[] pic = dao.getPictureByteArray("C:/CFA104_WebApp/eclipse_WTP_workspace1/CFA104G5/src/main/webapp/images/1.jpg");
//			secPicsVO.setShPic(null);
//			dao.update(secPicsVO);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		4. 單筆查詢
//		secPicsVO = dao.findByPrimaryKey(1);
//		System.out.print(secPicsVO.getShPicID() + "\t");
//		System.out.print(secPicsVO.getShID() + "\t");
//		System.out.print(secPicsVO.getShPic() + "\t");
//		
//		5. 多筆查詢
//		List<SecPicsVO> list = dao.getAll();
//		for (SecPicsVO asecPicsVO : list) {
//			System.out.print(asecPicsVO.getShPicID() + "\t");
//			System.out.print(asecPicsVO.getShID() + "\t");
//			System.out.print(asecPicsVO.getShPic() + "\t");
//			System.out.println();
//		}
	}

}
