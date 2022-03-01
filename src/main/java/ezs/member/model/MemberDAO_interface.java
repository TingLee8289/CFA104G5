package ezs.member.model;

import java.util.List;

import ezs.admin_emp.model.AdminEmpVO;

public interface MemberDAO_interface {
  
	public void insert(MemberVO memberVO);

	public void update(MemberVO memberVO);

	public void delete(Integer memID);

	public MemberVO findByPrimaryKey(Integer MemID);

	public List<MemberVO> getAll();

	public MemberVO Search(String memUsername, String memPassword);

	public void verifyMember(String memName);

	public MemberVO searchEmail(String memEmail);

	public void updateADM(MemberVO memberVO);

	public void updateMemberPassword(MemberVO memberVO);
	
	public MemberVO searchUsername(String memUsername);
	
	public MemberVO searchPID(String memPID);
	
	
    

}

