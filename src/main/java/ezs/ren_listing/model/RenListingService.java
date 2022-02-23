package ezs.ren_listing.model;

import java.math.BigDecimal;
import java.util.List;
import java.util.Set;

import ezs.ren_listing_pic.model.RenListingPicDAO_interface;
import ezs.ren_listing_pic.model.RenListingPicJNDIDAO;
import ezs.ren_listing_pic.model.RenListingPicVO;

public class RenListingService  {

	private RenListingDAO_interface dao;
	private RenListingPicDAO_interface daolspPic;
	
	public RenListingService() {
		dao = new RenListingJNDIDAO();
		daolspPic = new RenListingPicJNDIDAO();
	}
	
	public void addRenListing(RenListingPicVO renListingPicVO) {
		
//		Integer id = dao.insert(renListingVO);
////		DAO新增出來才會產生的ShID 讓它對應Pics
//		renListingPicVO.setLspLisID(id);
		//picDao 傳到關聯表格
//		System.out.print(renListingPicVO);
		daolspPic.insert(renListingPicVO);
	}
	
	public RenListingVO addRenListing(Integer lisLddID,Integer lisRtID,Integer lisAreaID,String lisTitle,String lisAbt,
			String lisAddress,BigDecimal lisRent,BigDecimal lisMngFee,BigDecimal lisPfee,Double lisSqft,String lisFlr,Integer lisRmNo,
			Integer lisCmnArea,Integer lisBrNo,Integer lisEthernet,Integer lisWifi,Integer lisWh,Integer lisShenc,Integer lisAc,Integer lisFridge,
			Integer lisTv,Integer lisWasher,Integer lisDryer,Integer lisTc,Integer lisBed,Integer lisCabinet,Integer lisSofa,Integer lisParking,
			Integer lisCook,Integer lisPet,Integer lisSmoking,Integer lisMonly,Integer lisFonly,Integer lisSonly) {
		
		RenListingVO renListingVO = new RenListingVO();
		
		renListingVO.setLisLddID(lisLddID);
		renListingVO.setLisRtID(lisRtID);
		renListingVO.setLisAreaID(lisAreaID);
		renListingVO.setLisTitle(lisTitle);
		renListingVO.setLisAbt(lisAbt);
		renListingVO.setLisAddress(lisAddress);
		renListingVO.setLisRent(lisRent);
		renListingVO.setLisMngFee(lisMngFee);
		renListingVO.setLisPfee(lisPfee);
		renListingVO.setLisSqft(lisSqft);
		renListingVO.setLisFlr(lisFlr);
		renListingVO.setLisRmNo(lisRmNo);
		renListingVO.setLisCmnArea(lisCmnArea);
		renListingVO.setLisBrNo(lisBrNo);
		renListingVO.setLisEthernet(lisEthernet);
		renListingVO.setLisWifi(lisWifi);
		renListingVO.setLisWh(lisWh);
		renListingVO.setLisShenc(lisShenc);
		renListingVO.setLisAc(lisAc);
		renListingVO.setLisFridge(lisFridge);
		renListingVO.setLisTv(lisTv);
		renListingVO.setLisWasher(lisWasher);
		renListingVO.setLisDryer(lisDryer);
		renListingVO.setLisTc(lisTc);
		renListingVO.setLisBed(lisBed);
		renListingVO.setLisCabinet(lisCabinet);
		renListingVO.setLisSofa(lisSofa);
		renListingVO.setLisParking(lisParking);
		renListingVO.setLisCook(lisCook);
		renListingVO.setLisPet(lisPet);
		renListingVO.setLisSmoking(lisSmoking);
		renListingVO.setLisMonly(lisMonly);
		renListingVO.setLisFonly(lisFonly);
		renListingVO.setLisSonly(lisSonly);
//		renListingVO.setLisStatus(lisStatus);
//		renListingVO.setLisApproval(lisApproval);
		
		Integer lisID = dao.insert(renListingVO);
		renListingVO.setLisID(lisID);
		
		return renListingVO;
	}
	
	public RenListingVO updateRenListing(Integer lisID,Integer lisLddID,Integer lisRtID,Integer lisAreaID,String lisTitle,String lisAbt,
			String lisAddress,BigDecimal lisRent,BigDecimal lisMngFee,BigDecimal lisPfee,Double lisSqft,String lisFlr,Integer lisRmNo,
			Integer lisCmnArea,Integer lisBrNo,Integer lisEthernet,Integer lisWifi,Integer lisWh,Integer lisShenc,Integer lisAc,Integer lisFridge,
			Integer lisTv,Integer lisWasher,Integer lisDryer,Integer lisTc,Integer lisBed,Integer lisCabinet,Integer lisSofa,Integer lisParking,
			Integer lisCook,Integer lisPet,Integer lisSmoking,Integer lisMonly,Integer lisFonly,Integer lisSonly,Integer lisStatus,Integer lisApproval) {
		
		RenListingVO renListingVO = new RenListingVO();
		
		renListingVO.setLisID(lisID);
		renListingVO.setLisLddID(lisLddID);
		renListingVO.setLisRtID(lisRtID);
		renListingVO.setLisAreaID(lisAreaID);
		renListingVO.setLisTitle(lisTitle);
		renListingVO.setLisAbt(lisAbt);
		renListingVO.setLisAddress(lisAddress);
		renListingVO.setLisRent(lisRent);
		renListingVO.setLisMngFee(lisMngFee);
		renListingVO.setLisPfee(lisPfee);
		renListingVO.setLisSqft(lisSqft);
		renListingVO.setLisFlr(lisFlr);
		renListingVO.setLisRmNo(lisRmNo);
		renListingVO.setLisCmnArea(lisCmnArea);
		renListingVO.setLisBrNo(lisBrNo);
		renListingVO.setLisEthernet(lisEthernet);
		renListingVO.setLisWifi(lisWifi);
		renListingVO.setLisWh(lisWh);
		renListingVO.setLisShenc(lisShenc);
		renListingVO.setLisAc(lisAc);
		renListingVO.setLisFridge(lisFridge);
		renListingVO.setLisTv(lisTv);
		renListingVO.setLisWasher(lisWasher);
		renListingVO.setLisDryer(lisDryer);
		renListingVO.setLisTc(lisTc);
		renListingVO.setLisBed(lisBed);
		renListingVO.setLisCabinet(lisCabinet);
		renListingVO.setLisSofa(lisSofa);
		renListingVO.setLisParking(lisParking);
		renListingVO.setLisCook(lisCook);
		renListingVO.setLisPet(lisPet);
		renListingVO.setLisSmoking(lisSmoking);
		renListingVO.setLisMonly(lisMonly);
		renListingVO.setLisFonly(lisFonly);
		renListingVO.setLisSonly(lisSonly);
		renListingVO.setLisStatus(lisStatus);
		renListingVO.setLisApproval(lisApproval);
		dao.update(renListingVO);
		
		return renListingVO;
	}
	
	public void deleteRenListing(Integer lisID) {
		dao.delete(lisID);
	}
	
	public RenListingVO getOneRenListing(Integer lisID) {
		return dao.findByPrimaryKey(lisID);
	}
	public Set<RenListingVO>getRenListingByLisLddID(Integer lisLddID){
		return dao.getRenListingByLisLddID(lisLddID);
	}
	
	public List<RenListingVO> getAll(){
		return dao.getAll();
	}

}