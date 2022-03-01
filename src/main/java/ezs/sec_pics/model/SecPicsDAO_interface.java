package ezs.sec_pics.model;

import java.util.List;

public interface SecPicsDAO_interface {
	 public void insert(SecPicsVO secPicsVO);
	    public void update(SecPicsVO secPicsVO);
	    public void delete(Integer shID);
	    public SecPicsVO findByPrimaryKey(Integer shPicID);
	    public List<SecPicsVO> getAll();
	    public List<SecPicsVO> getEachItemFirstPic();
	    public List<SecPicsVO> getByShID(Integer shID);
	    public List<SecPicsVO> getByShCateID(Integer shCateID);
}
