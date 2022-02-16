package ezs.ren_favorites.model;

import java.util.List;

public class RenFavoritesTest {

	public static void main(String[] args) {

		RenFavoritesJDBCDAO dao = new RenFavoritesJDBCDAO();

		// Insert
//		RenFavoritesVO fav1 = new RenFavoritesVO();
//		fav1.setFavLisId(6);
//		fav1.setFavMemId(15);
//		fav1.setFavAddTime(java.sql.Timestamp.valueOf("2021-12-25 12:25:21"));
//		dao.insert(fav1);
		
		// Update
//		RenFavoritesVO fav2 = new RenFavoritesVO();
//		fav2.setFavLisId(6);
//		fav2.setFavMemId(15);
//		fav2.setFavAddTime(java.sql.Timestamp.valueOf("2022-02-02 19:00:00"));
//		dao.update(fav2);

		// Delete
//		dao.delete(6, 15);

//		// Find by PK
//		System.out.println("--PK查詢-------------------");
//		RenFavoritesVO fav3 = dao.findByPK(1, 4);
//		System.out.print(fav3.getFavLisId() + ",");
//		System.out.print(fav3.getFavMemId() + ",");
//		System.out.println(fav3.getFavAddTime());

		// Find All
//		System.out.println("--查詢全部-------------------");
//		List<RenFavoritesVO> favList = dao.getAll();
//		for (RenFavoritesVO fList : favList) {
//			System.out.print(fList.getFavLisId() + ",");
//			System.out.print(fList.getFavMemId() + ",");
//			System.out.println(fList.getFavAddTime());
//		}
		
		System.out.println("--查詢-------------------");
		List<RenFavoritesVO> favList2 = dao.getAll(2);
		for (RenFavoritesVO fList : favList2) {
			System.out.print(fList.getFavLisId() + ",");
			System.out.print(fList.getFavMemId() + ",");
			System.out.println(fList.getFavAddTime());
		}
	}
}
