package ezs.ren_listing_pic.model;

import java.util.List;

import ezs.sec_pics.model.SecPicsVO;

public class RenListingPicService {
	
	private RenListingPicDAO_interface dao;

	
	public RenListingPicService() {
		dao = new RenListingPicJNDIDAO();
	}
	//新增
	public RenListingPicVO addRenListingPic(Integer lspLisID,byte[] lspPic) {
		
		RenListingPicVO renListingPicVO = new RenListingPicVO();
		
		renListingPicVO.setLspLisID(lspLisID);
		renListingPicVO.setLspPic(lspPic);
		dao.insert(renListingPicVO);
		
		return renListingPicVO;
	}
	//修改
	public RenListingPicVO updateRenListingPic(Integer lspID,Integer lspLisID,byte[] lspPic) {
		
		RenListingPicVO renListingPicVO = new RenListingPicVO();
		
		renListingPicVO.setLspID(lspID);
		renListingPicVO.setLspLisID(lspLisID);
		renListingPicVO.setLspPic(lspPic);
		dao.update(renListingPicVO);
		
		return  renListingPicVO;
		
	}
	
	public void deleteRenListingPic(Integer lspLisID) {
		dao.delete(lspLisID);
	}
	
	public RenListingPicVO getOneRenListingPic(Integer lspID){
		return dao.findByPrimaryKey(lspID);
	}
	
	public List<RenListingPicVO> getAll(){
		return dao.getAll();
	}
		
    public List<RenListingPicVO> getEachListingFirstPic(){
    	return dao.getEachListingFirstPic();
    }
//		
//
//		public List<SecPicsVO> getByShID(Integer shID) {
//			return dao.getByShID(shID);
//		}
	
	
}
