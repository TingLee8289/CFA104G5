package ezs.member.model;

import java.util.List;

public class MemberService {
	private MemberDAO_interface dao;

	public MemberService() {
		dao = new MemberDAO();
	}

public MemberVO addMember(String memUsername, String memPassword, String memName, String memPhone,
			String memAddress, String memEmail, String memPID, byte[] memHeadshot) {

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
		memberVO.setMemVatno(null);

		dao.insert(memberVO);
		return memberVO;
	}


	public MemberVO updateMember(Integer memID, String memPassword, String memName,
			String memPhone, String memAddress, String memEmail, byte[] memheadshot, 
			String memVatno, String memUsername) {
		MemberVO memberVO = new MemberVO();

		memberVO.setMemID(memID);
		memberVO.setMemPassword(memPassword);
		memberVO.setMemName(memName);
		memberVO.setMemPhone(memPhone);
		memberVO.setMemAddress(memAddress);
		memberVO.setMemEmail(memEmail);
		memberVO.setMemHeadshot(memheadshot);
		memberVO.setMemVatno(memVatno);
		memberVO.setMemUsername(memUsername);
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
	

	public MemberVO searchEmail(String memEmail) {
		return dao.searchEmail(memEmail);
	}
	
	public MemberVO searchUsername(String memUsername) {
		return dao.searchUsername(memUsername);
	}
	
	public MemberVO searchPID(String memPID) {
		return dao.searchPID(memPID);
	}

	public MemberVO updateMemberADM(Integer memID, Byte memLandlord, Byte memSupplier, Byte memSeller,
			Byte memStatus, Integer memReported, Integer memSupReported,
			String memUsername, String memName, String memPhone, String memAddress,
			String memEmail, Integer memRedCount, Integer memRedScore		
			) {
		
		
		MemberVO memberVO = new MemberVO();

		memberVO.setMemID(memID);
		memberVO.setMemLandlord(memLandlord);
		memberVO.setMemSupplier(memSupplier);
		memberVO.setMemSeller(memSeller);
		memberVO.setMemStatus(memStatus);
		memberVO.setMemReported(memReported);
		memberVO.setMemSupReported(memSupReported);
		memberVO.setMemUsername(memUsername);
		memberVO.setMemName(memName);
		memberVO.setMemPhone(memPhone);
		memberVO.setMemAddress(memAddress);
		memberVO.setMemEmail(memEmail);
		memberVO.setMemRedCount(memRedCount);
		memberVO.setMemRedScore(memRedScore);
		dao.updateADM(memberVO);

		return memberVO;
	}
	
	public void updateMemberPassword(MemberVO memberVO) {
		dao.updateMemberPassword(memberVO);
	}

}
