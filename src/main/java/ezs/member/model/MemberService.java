package ezs.member.model;

import java.util.List;

public class MemberService {
	private MemberDAO_interface dao;

	public MemberService() {
		dao = new MemberDAO();
	}

public MemberVO addMember(String memUsername, String memPassword, String memName, String memPhone,
			String memAddress, String memEmail, String memPID, String memVatno, byte[] memHeadshot) {

		MemberVO memberVO = new MemberVO();
		memberVO.setMemUsername(memUsername);
		memberVO.setMemPassword(memPassword);
		memberVO.setMemName(memName);
		memberVO.setMemLandlord((byte) 0);
		memberVO.setMemSupplier((byte) 1);
		memberVO.setMemSeller((byte) 1);
		memberVO.setMemPhone(memPhone);
		memberVO.setMemAddress(memAddress);
		memberVO.setMemEmail(memEmail);
		memberVO.setMemPID(memPID);
		memberVO.setMemStatus((byte) 0);
		memberVO.setMemHeadshot(null);
		memberVO.setMemHeadshot(memHeadshot);
		memberVO.setMemRevCount(0);
		memberVO.setMemRevScore(0);
		memberVO.setMemRedCount(0);
		memberVO.setMemRedScore(0);
		memberVO.setMemReported(0);
		memberVO.setMemLddReported(0);
		memberVO.setMemSelReported(0);
		memberVO.setMemSupReported(0);
		memberVO.setMemVatno(memVatno);

		dao.insert(memberVO);
		return memberVO;
	}


	public MemberVO updateMemberVO(Integer memID, String memUsername, String memPassword, String memName,
			Byte memLandlord, Byte memSupplier, Byte memSeller, String memPhone, String memAddress, String memEmail,
			String memPID, Byte memStatus, byte[] memheadshot, Integer memRevCount, Integer memRevScore,
			Integer memRedCount, Integer memredscore, Integer memReported, Integer memLddReported,
			Integer memSupReported, Integer memSelReported, String memVatno) {
		MemberVO memberVO = new MemberVO();

		memberVO.setMemID(memID);
		memberVO.setMemUsername(memUsername);
		memberVO.setMemPassword(memPassword);
		memberVO.setMemName(memName);
		memberVO.setMemLandlord(memLandlord);
		memberVO.setMemSupplier(memSupplier);
		memberVO.setMemSeller(memSeller);
		memberVO.setMemPhone(memPhone);
		memberVO.setMemAddress(memAddress);
		memberVO.setMemEmail(memEmail);
		memberVO.setMemPID(memPID);
		memberVO.setMemStatus(memStatus);
		memberVO.setMemHeadshot(null);
		memberVO.setMemRevCount(memRevCount);
		memberVO.setMemRevScore(memRevScore);
		memberVO.setMemRedCount(memRedCount);
		memberVO.setMemRedScore(memredscore);
		memberVO.setMemReported(memReported);
		memberVO.setMemLddReported(memLddReported);
		memberVO.setMemSupReported(memSupReported);
		memberVO.setMemSelReported(memSelReported);
		memberVO.setMemVatno(memVatno);
		dao.update(memberVO);

		return memberVO;
	}

	// for Struts2
	public void updateMember(MemberVO memberVO) {
		dao.update(memberVO);
	}

	public void deleteMember(Integer memID) {
		dao.delete(memID);
	}

	public MemberVO getOneMember(Integer memID) {
		return dao.findByPrimaryKey(memID);

	}

	public List<MemberVO> getAll() {
		return dao.getAll();
	}

	public MemberVO Search(String memUsername, String memPassword) {
		return dao.Search(memUsername, memPassword);
	}
	
	public void verifyMember(String memName) {
		dao.verifyMember(memName);
	}
}
