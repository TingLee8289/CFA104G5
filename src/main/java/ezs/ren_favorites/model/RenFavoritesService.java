package ezs.ren_favorites.model;

import java.util.List;
import java.util.Map;

public class RenFavoritesService {

	private RenFavoritesDAO_interface dao;

	public RenFavoritesService() {
		dao = new RenFavoritesDAO();
	}

	public RenFavoritesVO addRenFav(Integer favLisId, Integer favMemId, java.sql.Timestamp favAddTime) {

		RenFavoritesVO renFavoritesVO = new RenFavoritesVO();

		renFavoritesVO.setFavLisId(favLisId);
		renFavoritesVO.setFavMemId(favMemId);
		renFavoritesVO.setFavAddTime(favAddTime);
		dao.insert(renFavoritesVO);

		return renFavoritesVO;
	}

	public RenFavoritesVO updateRenFav(Integer favLisId, Integer favMemId, java.sql.Timestamp favAddTime) {

		RenFavoritesVO renFavoritesVO = new RenFavoritesVO();

		renFavoritesVO.setFavLisId(favLisId);
		renFavoritesVO.setFavMemId(favMemId);
		renFavoritesVO.setFavAddTime(favAddTime);
		dao.update(renFavoritesVO);

		return renFavoritesVO;
	}
	
	public void deleteRenFav(Integer favLisId, Integer favMemId) {
		dao.delete(favLisId, favMemId);
	}
	
	public RenFavoritesVO getOneRenFav(Integer favLisId, Integer favMemId) {
		return dao.findByPK(favLisId, favMemId);
	}
	
	public List<RenFavoritesVO> getAll(){
		return dao.getAll();
	}
	
	public List<RenFavoritesVO> getAll(Integer favMemId) {
		return dao.getAll(favMemId);
	}
	
	public List<RenFavoritesVO> getAll(Map<String, String[]> map){
		return dao.getAll(map);
	}


}
