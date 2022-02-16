package ezs.ren_roomtype.model;

import java.util.List;

public class RenRoomtypeService {
	
	private RenRoomtypeDAO_interface dao;
	
	public RenRoomtypeService() {
		dao = new RenRoomtypeJNDIDAO();
	}
	
	public RenRoomtypeVO addRenRoomtype(String rtType) {
		
		RenRoomtypeVO renRoomtypeVO = new RenRoomtypeVO();
		
		renRoomtypeVO.setRtType(rtType);
		dao.insert(renRoomtypeVO);
		
		return renRoomtypeVO;
	}
	
	public RenRoomtypeVO updateRenRoomtype(Integer rtID,String rtType) {
		
		RenRoomtypeVO renRoomtypeVO = new RenRoomtypeVO();
		
		renRoomtypeVO.setRtID(rtID);
		renRoomtypeVO.setRtType(rtType);
		dao.update(renRoomtypeVO);
		
		return renRoomtypeVO;
 	}
	
	public void deleteRenRoomtype (Integer rtID) {
		dao.delete(rtID);
	}
	
	public RenRoomtypeVO getOneRenRoomtype (Integer rtID) {
		return dao.findByPrimaryKey(rtID);
	}
	
	public List<RenRoomtypeVO> getAll(){
		return dao.getAll();
	}

}
