package ezs.sec_items.model;

import java.math.BigDecimal;
import java.util.List;

public class SecItemsTest {

	public static void main(String[] args) {
		SecItemsDAO dao = new SecItemsDAO();
		SecItemsVO secItemsVO  = new SecItemsVO();

//		1. 新增
//		secItemsVO.setShCateID(3);
//		secItemsVO.setShSellerID(2);
//		secItemsVO.setShName("測試測試");
//		secItemsVO.setShPrice(new BigDecimal(10));
//		secItemsVO.setShQTY(1);
//		secItemsVO.setShSize("測試測試");
//		secItemsVO.setShDescription("xxx");
//		secItemsVO.setShCondition("yyy");
//		secItemsVO.setShTime("zzz");
//		secItemsVO.setShGuarantee("no");
//		secItemsVO.setShStatus(1);
//		secItemsVO.setShCounty("桃園市");
//		secItemsVO.setShDist("龍潭區");
//	
//		dao.insert(secItemsVO);
		
//		2. 刪除
//		Integer shID = 5;
//		dao.delete(shID);
//		
//		3. 修改
//		secItemsVO.setShCateID(3);
//		secItemsVO.setShSellerID(3);
//		secItemsVO.setShName("測試測試");
//		secItemsVO.setShPrice(new BigDecimal(10));
//		secItemsVO.setShQTY(2);
//		secItemsVO.setShSize("測試測試");
//		secItemsVO.setShDescription("xxx");
//		secItemsVO.setShCondition("yyy");
//		secItemsVO.setShTime("zzz");
//		secItemsVO.setShGuarantee("no");
//		secItemsVO.setShStatus(1);
//		secItemsVO.setShCounty("宜蘭縣");
//		secItemsVO.setShDist("釣魚台");
//		secItemsVO.setShID(6);
//		dao.update(secItemsVO);	
//		
//		4. 單筆查詢
//		secItemsVO = dao.findByPrimaryKey(1);
//		System.out.print(secItemsVO.getShID() + "\t");
//		System.out.print(secItemsVO.getShCateID() + "\t");
//		System.out.print(secItemsVO.getShSellerID() + "\t");
//		System.out.print(secItemsVO.getShName() + "\t");
//		System.out.print(secItemsVO.getShPrice() + "\t");
//		System.out.print(secItemsVO.getShQTY() + "\t");
//		System.out.print(secItemsVO.getShSize() + "\t");
//		System.out.print(secItemsVO.getShDescription() + "\t");
//		System.out.print(secItemsVO.getShCondition() + "\t");
//		System.out.print(secItemsVO.getShTime() + "\t");
//		System.out.print(secItemsVO.getShGuarantee() + "\t");
//		System.out.print(secItemsVO.getShStatus() + "\t");
//		System.out.print(secItemsVO.getShCounty() + "\t");
//		System.out.print(secItemsVO.getShDist() + "\t");
//		
//		5. 多筆查詢
		List<SecItemsVO> list = dao.getAll();
		for (SecItemsVO aSecItem : list) {
			System.out.print(aSecItem.getShID() + "\t");
			System.out.print(aSecItem.getShCateID() + "\t");
			System.out.print(aSecItem.getShSellerID() + "\t");
			System.out.print(aSecItem.getShName() + "\t");
			System.out.print(aSecItem.getShPrice() + "\t");
			System.out.print(aSecItem.getShQTY() + "\t");
			System.out.print(aSecItem.getShSize() + "\t");
			System.out.print(aSecItem.getShDescription() + "\t");
			System.out.print(aSecItem.getShCondition() + "\t");
			System.out.print(aSecItem.getShTime() + "\t");
			System.out.print(aSecItem.getShGuarantee() + "\t");
			System.out.print(aSecItem.getShStatus() + "\t");
			System.out.print(aSecItem.getShCounty() + "\t");
			System.out.print(aSecItem.getShDist() + "\t");
			System.out.println();
		}
	}
}
