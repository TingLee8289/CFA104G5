package ezs.ren_liating_pic.model;

import java.util.List;

public class RenListingPicService {
	
	private RenListingPicDAO_interface dao;
	
	public RenListingPicService() {
		dao = new RenListingPicJNDIDAO();
	}
	
	public RenListingPicVO addRenListingPic(Integer lspLisID,byte[] lspPic) {
		
		RenListingPicVO renListingPicVO = new RenListingPicVO();
		
		renListingPicVO.setLspLisID(lspLisID);
		renListingPicVO.setLspPic(lspPic);
		dao.insert(renListingPicVO);
		
		return renListingPicVO;
	}
	
	public RenListingPicVO updateRenListingPic(Integer lspID,Integer lspLisID,byte[] lspPic) {
		
		RenListingPicVO renListingPicVO = new RenListingPicVO();
		
		renListingPicVO.setLspID(lspID);
		renListingPicVO.setLspLisID(lspLisID);
		renListingPicVO.setLspPic(lspPic);
		dao.update(renListingPicVO);
		
		return  renListingPicVO;
		
	}
	
	public void deleteRenListingPic(Integer lspID) {
		dao.delete(lspID);
	}
	
	public RenListingPicVO getOneRenListingPic(Integer lspID){
		return dao.findByPrimaryKey(lspID);
	}
	
	public List<RenListingPicVO> getAll(){
		return dao.getAll();
	}
	
}
