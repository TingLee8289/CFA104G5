package ezs.ser_ord.model;

import java.util.List;


public interface SerOrdDAO_interface {
	 public void insert(SerOrdVO serOrdVO);
     public void update(SerOrdVO serOrdVO);
     public void delete(Integer ordID);
     public SerOrdVO findByPrimaryKey(Integer ordID);
     public List<SerOrdVO> getAll();
     //萬用複合查詢(傳入參數型態Map)(回傳 List)
//   public List<EmpVO> getAll(Map<String, String[]> map); 
}
