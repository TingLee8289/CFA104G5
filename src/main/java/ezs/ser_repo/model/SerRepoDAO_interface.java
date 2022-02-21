package ezs.ser_repo.model;

import java.util.List;

import ezs.member.model.MemberVO;


public interface SerRepoDAO_interface {
	public void insert(SerRepVO serRepVO);
    public void update(SerRepVO serRepVO);
    public void delete(Integer rpID);
    public SerRepVO findByPrimaryKey(Integer rpID);
    public List<SerRepVO> getAll();
    public void updateMemSupReport(Integer memID);//檢舉次數
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<EmpVO> getAll(Map<String, String[]> map);
}
