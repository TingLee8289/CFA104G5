package ezs.sec_ord_details.model;

import java.util.List;



public interface SecOrdDetailsDAO_interface {
	
	 public void insert(SecOrdDetailsVO secOrdDetailsVO);
     public void update(SecOrdDetailsVO secOrdDetailsVO);
     public void delete(Integer shOrdID,Integer shID);
     public SecOrdDetailsVO findByPrimaryKey(Integer shOrdID,Integer shID);
     public List<SecOrdDetailsVO> getAll();
     public List<SecOrdDetailsVO> findByShOrdID(Integer shOrdID);
     
   //同時新增訂單與訂單明細
     public void insert2 (SecOrdDetailsVO secOrdDetailsVO , java.sql.Connection con);
     
}
