package ezs.ren_listing_pic.model;

public class RenListingPicTest {
	public static void main(String[] args) {
		RenListingPicJDBCDAO dao = new RenListingPicJDBCDAO();
		String path;
		// 新增
		RenListingPicVO listingPicVO1 = new RenListingPicVO();
		listingPicVO1.setLspLisID(9);
		path = "items/1-4.jpg";
		dao.insert(listingPicVO1);

		// 修改
		RenListingPicVO listingPicVO2 = new RenListingPicVO();
		listingPicVO2.setLspID(6);
		listingPicVO2.setLspLisID(3);
		path = "items/1-3.jpg";
		dao.update(listingPicVO2);

		// 查詢
//		try {
//		ListingPicVO listingPicVO2 = new ListingPicVO();
//		listingPicVO2.setLspID(2);
//		listingPicVO2.setLspLisID(2);
//		byte[] i = getPictureByteArray("image/2-1.jpg");
//		listingPicVO2.setLspPic(i);
//		dao.update(listingPicVO2);
//		}catch(IOException ie) {
//			System.out.println(ie);
//		}

		// 刪除
//		dao.delete(5);

		// PK查詢
//		ListingPicVO listingPicVO3 = dao.findByPrimaryKey(3);
//		System.out.print(listingPicVO3.getLspID() + ",");
//		System.out.print(listingPicVO3.getLspLisID() + ",");
//		System.out.println(listingPicVO3.getLspPic() + ",");
//		
//		System.out.println("---------------------");

		// 全部查詢
//		List<ListingPicVO> list = dao.getAll();
//		for (ListingPicVO aListingPic : list) {
//			System.out.print(aListingPic.getLspID() + ",");
//			System.out.print(aListingPic.getLspLisID() + ",");
//			System.out.print(aListingPic.getLspPic() );			
//			System.out.println();
//		}
	}
}
