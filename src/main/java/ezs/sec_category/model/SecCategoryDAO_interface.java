package ezs.sec_category.model;

import java.util.List;

public interface SecCategoryDAO_interface {
    public void insert(SecCategoryVO secCategoryVO);
    public void update(SecCategoryVO secCategoryVO);
    public void delete(Integer shCateID);
    public SecCategoryVO findByPrimaryKey(Integer shCateID);
    public List<SecCategoryVO> getAll();
}
