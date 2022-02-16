package ezs.ser_ord.model;

import java.math.BigDecimal;
import java.util.List;

public class SerOrdTest {
	public static void main(String[] args) {
		SerOrdJDBCDAO dao = new SerOrdJDBCDAO();
		//insert 
//		SerOrdVO s1 = new SerOrdVO();
//		s1.setOrdStatus((byte)0);
//		s1.setOrdPayStatus((byte)1);
//		s1.setOrdDmdID(4);
//		s1.setOrdQuoID(4);
//		s1.setOrdMemID(4);
//		s1.setOrdVdrID(2);
//		s1.setOrdSerClaID(2);
//		s1.setOrdMemVatno("12345678");
//		s1.setOrdVdrVatno("87654321");
//		s1.setOrdClnName("吳冠宏");
//		s1.setOrdClnTel("0987654321");
//		s1.setOrdWorkDate(java.sql.Date.valueOf("2021-01-29"));
//		s1.setOrdCounty("台北市");
//		s1.setOrdDist("文山區");
//		s1.setOrdAddr("木柵路一段一號");
//		s1.setOrdItem("青仔500");
//		s1.setOrdTotalPrice(new BigDecimal(500));
//		s1.setOrdPrePay(new BigDecimal(50));
//		s1.setOrdPayType((byte)1);
//		s1.setOrdPayDate(java.sql.Date.valueOf("2021-01-28"));
//		s1.setOrdFpay(new BigDecimal(450));
//		s1.setOrdFpayType((byte)1);
//		s1.setOrdFpayDate(java.sql.Date.valueOf("2021-01-28"));
//		s1.setOrdBuyerScore(4);
//		s1.setOrdBuyerTxt("孩子你還活著嗎？");
//		s1.setOrdVdrScore(5);
//		s1.setOrdVdrTxt("郭龍女潘過");
//		s1.setOrdNote("喂！去煮飯！");
//		dao.insert(s1);
		//update
		SerOrdVO s2 = new SerOrdVO();
		s2.setOrdStatus((byte)0);
		s2.setOrdPayStatus((byte)1);
		s2.setOrdDmdID(4);
		s2.setOrdQuoID(4);
		s2.setOrdMemID(4);
		s2.setOrdVdrID(2);
		s2.setOrdSerClaID(2);
		s2.setOrdMemVatno("12345678");
		s2.setOrdVdrVatno("87654321");
		s2.setOrdClnName("吳冠宏");
		s2.setOrdClnTel("0987654321");
		s2.setOrdWorkDate(java.sql.Date.valueOf("2021-01-29"));
		s2.setOrdCounty("台北市");
		s2.setOrdDist("文山區");
		s2.setOrdAddr("木柵路一段一號");
		s2.setOrdItem("青仔500");
		s2.setOrdTotalPrice(new BigDecimal(500));
		s2.setOrdPrePay(new BigDecimal(50));
		s2.setOrdPayType((byte)1);
		s2.setOrdPayDate(java.sql.Date.valueOf("2021-01-28"));
		s2.setOrdFpay(new BigDecimal(450));
		s2.setOrdFpayType((byte)1);
		s2.setOrdFpayDate(java.sql.Date.valueOf("2021-01-28"));
		s2.setOrdBuyerScore(4);
		s2.setOrdBuyerTxt("孩子你還活著嗎？");
		s2.setOrdVdrScore(5);
		s2.setOrdVdrTxt("郭龍女潘過");
		s2.setOrdNote("去死吧鳥鳥小小的");
		s2.setOrdID(4);
		dao.update(s2);
		//delete
//		dao.delete(1);
		//findone
//		SerOrdVO s3 = dao.findByPrimaryKey(1);
//		System.out.println(s3.getOrdAddr());
//		System.out.println(s3.getOrdDmdID());
		
		//findall
//		List<SerOrdVO> list = dao.getAll();
//		for(SerOrdVO s4:list) {
//			System.out.println(s4.getOrdID());
//			System.out.println(s4.getOrdClnName());
//		}
	}
}
