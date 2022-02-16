package ezs.sec_postcode.model;

import java.util.List;
import java.util.Scanner;


public class SecPostcodeTest {

	public static void main(String[] args) {
		SecPostcodeJDBCDAO dao = new SecPostcodeJDBCDAO();
		SecPostcodeVO secPostcodeVO = new SecPostcodeVO();
		
//		1. 新增
//		secPostcodeVO.setShPostCode(999);
//		secPostcodeVO.setShPostCounty("test");
//		secPostcodeVO.setShPostDist("test");
//		dao.insert(secPostcodeVO);
		
//		2. 刪除
//		Integer shPostCode2 = 999;
//		dao.delete(shPostCode2);
//		
//		3. 修改
		secPostcodeVO.setShPostCode(999);
		secPostcodeVO.setShPostCounty("test2");
		secPostcodeVO.setShPostDist("test2");
		dao.update(secPostcodeVO);	
//		
//		4. 單筆查詢
//		Integer shPostCode4 = 330;
//		secPostcodeVO = dao.findByPrimaryKey(shPostCode);
//		System.out.print(secPostcodeVO.getShPostCode() + "\t");
//		System.out.print(secPostcodeVO.getShPostCounty() + "\t");
//		System.out.print(secPostcodeVO.getShPostDist());
//		
//		5. 多筆查詢
//		List<SecPostcodeVO> list = dao.getAll();
//		for (SecPostcodeVO aPost : list) {
//			System.out.print(aPost.getShPostCode() + "\t");
//			System.out.print(aPost.getShPostCounty() + "\t");
//			System.out.print(aPost.getShPostDist());
//			System.out.println();
//		}
	}

}
