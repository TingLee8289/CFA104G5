package ezs.ren_favorites.model;

import java.util.List;
import java.util.Map;

public interface RenFavoritesDAO_interface {
	public void insert(RenFavoritesVO favoritesVO);
	public void update(RenFavoritesVO favoritesVO);
	public void delete(Integer favLisId, Integer favMemId);
	public RenFavoritesVO findByPK(Integer favLisId, Integer favMemId);
	public List<RenFavoritesVO> getAll();
	public List<RenFavoritesVO> getAll(Integer favMemId);
	public List<RenFavoritesVO> getAll(Map<String, String[]> map);

}
