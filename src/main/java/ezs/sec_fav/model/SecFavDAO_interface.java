package ezs.sec_fav.model;

import java.util.List;


public interface SecFavDAO_interface {

	public void insert(SecFavVO secFavVO);
    public void update(SecFavVO secFavVO);
    public void delete(Integer shMemID,Integer shID);
    public SecFavVO findByPrimaryKey(Integer shMemID,Integer shID);
    
    public List<SecFavVO> getAll();
}
