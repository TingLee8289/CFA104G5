package ezs.member.model;

import java.util.List;

public class MemberTest {

	public static void main(String[] args) {
		MemberJDBCDAO dao = new MemberJDBCDAO();
		// insert
		MemberVO m1 = new MemberVO();
		m1.setMemUsername("jimmy");
		m1.setMemPassword("1234567");
		m1.setMemName("NNNN");
		m1.setMemLandlord((byte)1);
		m1.setMemSupplier((byte)1);
		m1.setMemSeller((byte)1);
		m1.setMemPhone("0987654321");
		m1.setMemAddress("台南市新市區八八八路一二三號");
		m1.setMemEmail("jimmypc12345@gmail.com");
		m1.setMemPID("H232873556");
		m1.setMemStatus((byte)1);
		m1.setMemHeadshot(null);
		m1.setMemRevCount(0);
		m1.setMemRevScore(0);
		m1.setMemRedCount(0);
		m1.setMemRedScore(0);
		m1.setMemReported(0);
		m1.setMemLddReported(0);
		m1.setMemSelReported(0);
		m1.setMemSupReported(0);
		m1.setMemVatno(null);
		dao.insert(m1);
		// update
//		MemberVO m2 = new MemberVO();
//		m2.setMemID(18);
//		m2.setMemUsername("jimmy");
//		m2.setMemPassword("1234567");
//		m2.setMemName("JJJJ");
//		m2.setMemLandlord((byte)1);
//		m2.setMemSupplier((byte)1);
//		m2.setMemSeller((byte)1);
//		m2.setMemPhone("0987654321");
//		m2.setMemAddress("台南市新市區八八八路一二三號");
//		m2.setMemEmail("jimmypc12345@gmail.com");
//		m2.setMemPID("H232873556");
//		m2.setMemStatus((byte)1);
//		m2.setMemHeadshot(null);
//		m2.setMemRevCount(0);
//		m2.setMemRevScore(0);
//		m2.setMemRedCount(0);
//		m2.setMemRedScore(0);
//		m2.setMemReported(0);
//		m2.setMemLddReported(0);
//		m2.setMemSelReported(0);
//		m2.setMemSupReported(0);
//		m2.setMemVatno(null);
//		dao.update(m2);

//		MemberVO aMem = dao.findByPrimaryKey(2);//findByPrimaryKey測試完成
//		
		dao.delete(17);// delete測試完成

		List<MemberVO> list = dao.getAll();
		for (MemberVO aMem : list) {
			System.out.print(aMem.getMemID() + ",");
			System.out.print(aMem.getMemUsername() + ",");
			System.out.print(aMem.getMemPassword() + ",");
			System.out.print(aMem.getMemName() + ",");
			System.out.print(aMem.getMemLandlord() + ",");
			System.out.print(aMem.getMemSupplier() + ",");
			System.out.print(aMem.getMemSeller() + ",");
			System.out.print(aMem.getMemPhone() + ",");
			System.out.print(aMem.getMemAddress() + ",");
			System.out.print(aMem.getMemEmail() + ",");
			System.out.print(aMem.getMemPID() + ",");
			System.out.print(aMem.getMemStatus() + ",");
			System.out.print(aMem.getMemHeadshot() + ",");
			System.out.print(aMem.getMemRevCount() + ",");
			System.out.print(aMem.getMemRevScore() + ",");
			System.out.print(aMem.getMemRedCount() + ",");
			System.out.print(aMem.getMemRedScore() + ",");
			System.out.print(aMem.getMemReported() + ",");
			System.out.print(aMem.getMemLddReported() + ",");
			System.out.print(aMem.getMemSupReported() + ",");
			System.out.print(aMem.getMemSelReported() + ",");
			System.out.println();
		}
		MemberVO memberVO4 = dao.Search("Gwen02", "Gwen02");
		System.out.println(memberVO4.getMemUsername());
		System.out.println(memberVO4.getMemPassword());
	}
}
