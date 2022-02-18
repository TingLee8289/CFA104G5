package ezs.sec_ord.model;

import java.util.List;
import java.util.Set;

public interface SecOrdDAO_interface {
    public void insert(SecOrdVO secOrdVO);
    public void update(SecOrdVO secOrdVO);
    public void delete(Integer shOrdID);
    public SecOrdVO findByPrimaryKey(Integer shOrdID);
    public List<SecOrdVO> getAll();
    public Set<SecOrdVO> getSecOrdByShBuyerID(Integer shBuyerID);

    public Set<SecOrdVO> getSecOrdByShSellerID(Integer shSellerID);

    public void updateCompleteOrder(Integer shOrdID);
	public void refundOrder(Integer shOrdID);

    
}
