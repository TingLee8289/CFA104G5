package ezs.ser_dmd.model;

import java.util.List;


public class SerDmdService {
	private SerDmdDAO_interface dao;//為框架作準備，目的為降低相依性
	
	public SerDmdService() {
		dao = new SerDmdDAO();
	}
	//由service來組合出物件
	public SerDmdVO addSerDmd(Byte dmdStatus, Integer dmdMemID, Integer dmdSerClaID, String dmdName, String dmdTel,
			String dmdMail, String dmdCounty, String dmdRegion, String dmdAddress, String dmdSpaceClass,
			Integer dmdSquare, Integer dmdBudget, String dmdIntro, byte[] dmdPic) {
		SerDmdVO serDmdVO = new SerDmdVO();
		serDmdVO.setDmdStatus(dmdStatus);
		serDmdVO.setDmdMemID(dmdMemID);
		serDmdVO.setDmdSerClaID(dmdSerClaID);
		serDmdVO.setDmdName(dmdName);
		serDmdVO.setDmdTel(dmdTel);
		serDmdVO.setDmdMail(dmdMail);
		serDmdVO.setDmdCounty(dmdCounty);
		serDmdVO.setDmdRegion(dmdRegion);
		serDmdVO.setDmdAddress(dmdAddress);
		serDmdVO.setDmdSpaceClass(dmdSpaceClass);
		serDmdVO.setDmdSquare(dmdSquare);
		serDmdVO.setDmdBudget(dmdBudget);
		serDmdVO.setDmdIntro(dmdIntro);
		serDmdVO.setDmdPic(null);
		serDmdVO.setDmdPic(dmdPic);
		dao.insert(serDmdVO);
		
		return serDmdVO;
	}
	public SerDmdVO updateSerDmd(Integer dmdID, Byte dmdStatus, Integer dmdMemID, Integer dmdSerClaID, String dmdName, String dmdTel,
			String dmdMail, String dmdCounty, String dmdRegion, String dmdAddress, String dmdSpaceClass,
			Integer dmdSquare, Integer dmdBudget, String dmdIntro, byte[] dmdPic) {
		SerDmdVO serDmdVO = new SerDmdVO();
		serDmdVO.setDmdID(dmdID);
		serDmdVO.setDmdStatus(dmdStatus);
		serDmdVO.setDmdMemID(dmdMemID);
		serDmdVO.setDmdSerClaID(dmdSerClaID);
		serDmdVO.setDmdName(dmdName);
		serDmdVO.setDmdTel(dmdTel);
		serDmdVO.setDmdMail(dmdMail);
		serDmdVO.setDmdCounty(dmdCounty);
		serDmdVO.setDmdRegion(dmdRegion);
		serDmdVO.setDmdAddress(dmdAddress);
		serDmdVO.setDmdSpaceClass(dmdSpaceClass);
		serDmdVO.setDmdSquare(dmdSquare);
		serDmdVO.setDmdBudget(dmdBudget);
		serDmdVO.setDmdIntro(dmdIntro);
		serDmdVO.setDmdPic(dmdPic);
		dao.update(serDmdVO);
		
		return serDmdVO;
	}
	public void deleteSerDmd(Integer dmdID) {
		dao.delete(dmdID);
	}

	public SerDmdVO getOneSerDmd(Integer dmdID) {
		return dao.findByPrimaryKey(dmdID);
	}

	public List<SerDmdVO> findByMemID(Integer dmdMemID) {
		return dao.findByMemID(dmdMemID);
	}
	public List<SerDmdVO> getAll() {
		return dao.getAll();
	}
	
	public void setDmdStatus(Integer dmdID) {
		dao.setDmdStatus(dmdID);
		}
}
