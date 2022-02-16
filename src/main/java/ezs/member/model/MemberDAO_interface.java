package ezs.member.model;

import java.util.List;

public interface MemberDAO_interface {
	 public void insert(MemberVO memberVO);
     public void update(MemberVO memberVO);
     public void delete(Integer memID);
     public MemberVO findByPrimaryKey(Integer MemID);
     public List<MemberVO> getAll();
     public MemberVO Search(String memUsername ,String memPassword);
     //萬用複合查詢(傳入參數型態Map)(回傳 List)
//   public List<EmpVO> getAll(Map<String, String[]> map); 
}
