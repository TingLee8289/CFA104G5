package ezs.ser_quo.model;

import java.util.List;

public interface SerQuoDAO_interface {
	public void insert(SerQuoVO serQuoVO);

	public void update(SerQuoVO serQuoVO);

	public void delete(Integer quoID);

	public SerQuoVO findByPrimaryKey(Integer quoID);

	public List<SerQuoVO> findByDmdID(Integer dmdID);

	public List<SerQuoVO> findByVdrID(Integer quoVdrID);

	public List<SerQuoVO> getAll();
	
	
	// 萬用複合查詢(傳入參數型態Map)(回傳 List)
//   public List<EmpVO> getAll(Map<String, String[]> map); 
}
