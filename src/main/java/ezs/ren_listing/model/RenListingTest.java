package ezs.ren_listing.model;

import java.util.List;

public class RenListingTest {
	public static void main(String[] args) {
		RenListingJDBCDAO dao = new RenListingJDBCDAO();

		// 新增
//		RenListingVO listingVO1 = new RenListingVO();
//		listingVO1.setLisLddID(3);
//		listingVO1.setLisRtID(3);
//		listingVO1.setLisAreaID(2);
//		listingVO1.setLisTitle("近sogo");
//		listingVO1.setLisAbt("生活機能佳");
//		listingVO1.setLisAddress("中央西路");
//		listingVO1.setLisRent(new BigDecimal(7000));				
//	    listingVO1.setLisMngFee(new BigDecimal(0));
//		listingVO1.setLisPfee(new BigDecimal(1200));
//		listingVO1.setLisSqft(4.6);
//		listingVO1.setLisFlr("4F/7F");
//		listingVO1.setLisRmNo(1);
//		listingVO1.setLisCmnArea(0);
//		listingVO1.setLisBrNo(1);
//		listingVO1.setLisEthernet(1);
//		listingVO1.setLisWifi(1);
//		listingVO1.setLisWh(1);
//		listingVO1.setLisShenc(0);
//		listingVO1.setLisAc(1);
//		listingVO1.setLisFridge(1);
//		listingVO1.setLisTv(1);
//		listingVO1.setLisWasher(1);
//		listingVO1.setLisDryer(0);
//		listingVO1.setLisTc(1);
//		listingVO1.setLisBed(1);
//		listingVO1.setLisCabinet(1);
//		listingVO1.setLisSofa(0);
//		listingVO1.setLisParking(1);
//		listingVO1.setLisCook(0);
//		listingVO1.setLisPet(1);
//		listingVO1.setLisSmoking(0);
//		listingVO1.setLisMonly(0);
//		listingVO1.setLisFonly(1);
//		listingVO1.setLisSonly(0);
//		listingVO1.setLisStatus(0);
//		listingVO1.setLisApproval(2);
//		dao.insert(listingVO1);

		// 修改
//		RenListingVO listingVO2 = new RenListingVO();	
//		listingVO2.setLisID(11);
//		listingVO2.setLisLddID(3);
//		listingVO2.setLisRtID(3);
//		listingVO2.setLisAreaID(2);
//		listingVO2.setLisTitle("近sogo123456");
//		listingVO2.setLisAbt("生活機能佳123");
//		listingVO2.setLisAddress("中央西路123");
//		listingVO2.setLisRent(new BigDecimal(6500));				
//	    listingVO2.setLisMngFee(new BigDecimal(0));
//		listingVO2.setLisPfee(new BigDecimal(1500));
//		listingVO2.setLisSqft(4.6);
//		listingVO2.setLisFlr("4F/7F");
//		listingVO2.setLisRmNo(1);
//		listingVO2.setLisCmnArea(0);
//		listingVO2.setLisBrNo(1);
//		listingVO2.setLisEthernet(1);
//		listingVO2.setLisWifi(1);
//		listingVO2.setLisWh(1);
//		listingVO2.setLisShenc(1);
//		listingVO2.setLisAc(1);
//		listingVO2.setLisFridge(1);
//		listingVO2.setLisTv(1);
//		listingVO2.setLisWasher(1);
//		listingVO2.setLisDryer(1);
//		listingVO2.setLisTc(1);
//		listingVO2.setLisBed(1);
//		listingVO2.setLisCabinet(1);
//		listingVO2.setLisSofa(1);
//		listingVO2.setLisParking(1);
//		listingVO2.setLisCook(0);
//		listingVO2.setLisPet(1);
//		listingVO2.setLisSmoking(0);
//		listingVO2.setLisMonly(0);
//		listingVO2.setLisFonly(1);
//		listingVO2.setLisSonly(0);
//		listingVO2.setLisStatus(0);
//		listingVO2.setLisApproval(2);
//		dao.update(listingVO2);

		// 刪除
//		dao.delete(11);

		// PK查詢
//		RenListingVO listingVO3 = dao.findByPrimaryKey(10);
//		System.out.print(listingVO3.getLisID() + ",");
//		System.out.print(listingVO3.getLisLddID() + ",");
//		System.out.print(listingVO3.getLisRtID() + ",");
//		System.out.print(listingVO3.getLisAreaID() + ",");
//		System.out.print(listingVO3.getLisTitle() + ",");
//		System.out.print(listingVO3.getLisAbt() + ",");
//		System.out.print(listingVO3.getLisAddress());
//		System.out.print(listingVO3.getLisRent() + ",");
//		System.out.print(listingVO3.getLisMngFee() + ",");
//		System.out.print(listingVO3.getLisPfee() + ",");
//		System.out.print(listingVO3.getLisSqft() + ",");
//		System.out.print(listingVO3.getLisFlr() + ",");
//		System.out.print(listingVO3.getLisRmNo() + ",");
//		System.out.print(listingVO3.getLisCmnArea() + ",");
//		System.out.print(listingVO3.getLisBrNo() + ",");
//		System.out.print(listingVO3.getLisEthernet() + ",");
//		System.out.print(listingVO3.getLisWifi() + ",");
//		System.out.print(listingVO3.getLisWh() + ",");
//		System.out.print(listingVO3.getLisShenc() + ",");
//		System.out.print(listingVO3.getLisAc() + ",");
//		System.out.print(listingVO3.getLisFridge() + ",");
//		System.out.print(listingVO3.getLisTv() + ",");
//		System.out.print(listingVO3.getLisWasher() + ",");
//		System.out.print(listingVO3.getLisDryer() + ",");
//		System.out.print(listingVO3.getLisTc() + ",");
//		System.out.print(listingVO3.getLisBed() + ",");
//		System.out.print(listingVO3.getLisCabinet() + ",");
//		System.out.print(listingVO3.getLisSofa() + ",");
//		System.out.print(listingVO3.getLisParking() + ",");
//		System.out.print(listingVO3.getLisCook() + ",");
//		System.out.print(listingVO3.getLisPet() + ",");
//		System.out.print(listingVO3.getLisSmoking() + ",");
//		System.out.print(listingVO3.getLisMonly() + ",");
//		System.out.print(listingVO3.getLisFonly() + ",");
//		System.out.print(listingVO3.getLisSonly() + ",");
//		System.out.print(listingVO3.getLisStatus() + ",");
//		System.out.println(listingVO3.getLisApproval() + ",");
//
//		System.out.println("---------------------");

		// 全查詢
		List<RenListingVO> list = dao.getAll();
		for (RenListingVO aListing : list) {
			System.out.print(aListing.getLisID() + ",");
			System.out.print(aListing.getLisLddID() + ",");
			System.out.print(aListing.getLisRtID() + ",");
			System.out.print(aListing.getLisAreaID() + ",");
			System.out.print(aListing.getLisTitle() + ",");
			System.out.print(aListing.getLisAbt() + ",");
			System.out.print(aListing.getLisAddress());
			System.out.print(aListing.getLisRent() + ",");
			System.out.print(aListing.getLisMngFee() + ",");
			System.out.print(aListing.getLisPfee() + ",");
			System.out.print(aListing.getLisSqft() + ",");
			System.out.print(aListing.getLisFlr() + ",");
			System.out.print(aListing.getLisRmNo() + ",");
			System.out.print(aListing.getLisCmnArea() + ",");
			System.out.print(aListing.getLisBrNo() + ",");
			System.out.print(aListing.getLisEthernet() + ",");
			System.out.print(aListing.getLisWifi() + ",");
			System.out.print(aListing.getLisWh() + ",");
			System.out.print(aListing.getLisShenc() + ",");
			System.out.print(aListing.getLisAc() + ",");
			System.out.print(aListing.getLisFridge() + ",");
			System.out.print(aListing.getLisTv() + ",");
			System.out.print(aListing.getLisWasher() + ",");
			System.out.print(aListing.getLisDryer() + ",");
			System.out.print(aListing.getLisTc() + ",");
			System.out.print(aListing.getLisBed() + ",");
			System.out.print(aListing.getLisCabinet() + ",");
			System.out.print(aListing.getLisSofa() + ",");
			System.out.print(aListing.getLisParking() + ",");
			System.out.print(aListing.getLisCook() + ",");
			System.out.print(aListing.getLisPet() + ",");
			System.out.print(aListing.getLisSmoking() + ",");
			System.out.print(aListing.getLisMonly() + ",");
			System.out.print(aListing.getLisFonly() + ",");
			System.out.print(aListing.getLisSonly() + ",");
			System.out.print(aListing.getLisStatus() + ",");
			System.out.println(aListing.getLisApproval() + ",");
			System.out.println();
		}
	}
}
