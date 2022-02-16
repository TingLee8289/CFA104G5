package ezs.ren_location.model;

import java.util.List;

public class RenLocationService {
	
	private RenLocationDAO_interface dao;
	
	public RenLocationService() {
		dao = new RenLocationJNDIDAO();
	}
	
	public RenLocationVO addRenLocation(String locCity,String locDist) {
		
		RenLocationVO  renLocationVO = new RenLocationVO();
		
		renLocationVO.setLocCity(locCity);
		renLocationVO.setLocDist(locDist);
		dao.insert(renLocationVO);
		
		return renLocationVO;
	}
	
	public RenLocationVO updateRenLocation(Integer locID,String locCity,String locDist) {
		
		RenLocationVO renLocationVO = new RenLocationVO();
		
		renLocationVO.setLocID(locID);
		renLocationVO.setLocCity(locCity);
		renLocationVO.setLocCity(locDist);
		dao.update(renLocationVO);
		
		return renLocationVO;
	}
	
	public void deleteRenloction(Integer locID) {
		dao.delete(locID);
	}
	
	public RenLocationVO getOneRenLoction(Integer locID) {
		return dao.findByPrimaryKey(locID);
	}
	
	public List<RenLocationVO> getALL(){
		return dao.getAll();
	}

}
