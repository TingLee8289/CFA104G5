package ezs.sec_category.model;

import java.util.List;
import java.util.Scanner;

public class SecCategoryTest {
	
	public static void main(String[] args) {
		SecCategoryJDBCDAO dao = new SecCategoryJDBCDAO();
		SecCategoryVO secCategoryVO = new SecCategoryVO();
		
//		1. 新增
//		secCategoryVO.setShCateID(6);
//		secCategoryVO.setShCateName("xxx");
//		dao.insert(secCategoryVO);
//		
//		2. 刪除
//		Integer shCateID= 6;
//		dao.delete(shCateID);
//
//		3. 修改
		secCategoryVO.setShCateID(5);
		secCategoryVO.setShCateName("xxx");
		dao.update(secCategoryVO);
//		
//		4. 單筆查詢
		Integer shCateID = 1;
		secCategoryVO = dao.findByPrimaryKey(shCateID); 
		System.out.println(secCategoryVO.getShCateID());
		System.out.println(secCategoryVO.getShCateName());
		
//		5. 多筆查詢
		List<SecCategoryVO> list = dao.getAll();
		for (SecCategoryVO aSecCategory : list) {
			System.out.print(aSecCategory.getShCateID() + "\t");
			System.out.print(aSecCategory.getShCateName()+ "\t");
			System.out.println();
		}
		
		
		
	}
}
