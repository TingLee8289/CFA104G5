package ezs.sec_ord.model;

import java.util.List;
import java.util.Set;

import ezs.sec_ord_details.model.SecOrdDetailsVO;

public interface SecOrdDAO_interface {
    public void insert(SecOrdVO secOrdVO);
    public void update(SecOrdVO secOrdVO);
    public void delete(Integer shOrdID);
    public SecOrdVO findByPrimaryKey(Integer shOrdID);
    public List<SecOrdVO> getAll();
    public Set<SecOrdVO> getSecOrdByShBuyerID(Integer shBuyerID);
    public void updateCompleteOrder(Integer shOrdID);
    public void refundOrder(Integer shOrdID);
    public Set<SecOrdVO> getSecOrdByShSellerID(Integer shSellerID);
    
    //查詢某訂單主檔的訂單明細(一對多)(回傳 Set)
    public Set<SecOrdDetailsVO> getSecAllOrdDeatails(Integer shOrdID);

    public void updateCancleOrder(Integer shOrdID) ;
    
    public void updateOrderStatus(SecOrdVO secOrdVO);
    
    public void insertWithSecOrdDetails(SecOrdVO secOrdVO , List<SecOrdDetailsVO> list);
    
}
