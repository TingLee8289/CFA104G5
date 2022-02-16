package ezs.sec_items.model;

import java.util.List;


public interface SecItemsDAO_interface {
	public Integer insert(SecItemsVO secItemsVO);
    public void update(SecItemsVO secItemsVO);
    public void delete(Integer shID);
    public SecItemsVO findByPrimaryKey(Integer shID);
    public List<SecItemsVO> findByShCategory(Integer shCateID);
    public List<SecItemsVO> getAll();
    public List<SecItemsVO> getShStatusAll(Integer shStatus);
}

