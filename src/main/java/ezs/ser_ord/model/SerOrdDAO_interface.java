package ezs.ser_ord.model;

import java.util.List;



public interface SerOrdDAO_interface {
	 public void insert(SerOrdVO serOrdVO);
     public void update(SerOrdVO serOrdVO);
     public void finishOrd(Integer ordID);
     public void jobCompleted(Integer ordID);
     public void creditPay(Integer ordID);
     public void delete(Integer ordID);
     public SerOrdVO findByPrimaryKey(Integer ordID);
     public List<SerOrdVO> findOrdByVdrID(Integer ordVdrID);
     public List<SerOrdVO> findOrdByMemID(Integer ordMemID);
     public List<SerOrdVO> getAll();
     //萬用複合查詢(傳入參數型態Map)(回傳 List)
//   public List<EmpVO> getAll(Map<String, String[]> map); 
}
