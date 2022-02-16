package ezs.sec_refund.model;

import java.util.List;

public interface SecRefundDAO_interface {
	public void insert(SecRefundVO secRefundVO);
    public void update(SecRefundVO secRefundVO);
    public void delete(Integer shRefID);
    public SecRefundVO findByPrimaryKey(Integer shRefID);
    public List<SecRefundVO> getAll();
}
