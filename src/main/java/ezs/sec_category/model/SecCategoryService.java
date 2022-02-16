package ezs.sec_category.model;

import java.util.List;

public class SecCategoryService {
	
	private SecCategoryDAO_interface dao;

	public SecCategoryService() {
		dao = new SecCategoryJDBCDAO();
	}

	public SecCategoryVO addSecCategory(String shCateName) {

		SecCategoryVO secCategoryVO = new SecCategoryVO();

		secCategoryVO.setShCateName(shCateName);
		
		dao.insert(secCategoryVO);

		return secCategoryVO;
	}

	public SecCategoryVO updateSecCategory(Integer shCateID, String shCateName) {

		SecCategoryVO secCategoryVO = new SecCategoryVO();
		secCategoryVO.setShCateID(shCateID);
		secCategoryVO.setShCateName(shCateName);
		dao.update(secCategoryVO);

		return secCategoryVO;
	}

	public void deleteSecCategory(Integer shCateID) {
		dao.delete(shCateID);
	}

	public SecCategoryVO getOneSecCategory(Integer shCateID) {
		return dao.findByPrimaryKey(shCateID);
	}

	public List<SecCategoryVO> getAll() {
		return dao.getAll();
	}

}
