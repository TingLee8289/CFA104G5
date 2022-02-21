package ezs.ser_repo.model;

import java.util.List;

import ezs.sec_refund.model.SecRefundJDBCDAO;

public class SerRepoService {
	private SerRepoDAO_interface dao;

	public SerRepoService() {
		dao = new SerRepoDAO();

	}

	public SerRepVO addSerRepo(Integer rpOrdID, Integer rpMemID, String rpTxt, java.sql.Date rpDate,
			Integer rpStatus) {

		SerRepVO serRepVO = new SerRepVO();

		
		serRepVO.setRpOrdID(rpOrdID);
		serRepVO.setRpMemID(rpMemID);
		serRepVO.setRpTxt(rpTxt);
		serRepVO.setRpDate(rpDate);
		serRepVO.setRpStatus(rpStatus);
		dao.insert(serRepVO);

		return serRepVO;

	}

	public SerRepVO updateSerRepo(Integer rpID, Integer rpOrdID,Integer rpMemID, String rpTxt, java.sql.Date rpDate,
			Integer rpStatus) {
		SerRepVO serRepVO = new SerRepVO();

		serRepVO.setRpID(rpID);
		serRepVO.setRpOrdID(rpOrdID);
		serRepVO.setRpMemID(rpMemID);
		serRepVO.setRpTxt(rpTxt);
		serRepVO.setRpDate(rpDate);
		serRepVO.setRpStatus(rpStatus);
		dao.update(serRepVO);

		return serRepVO;
	}

	public void deleteSerRep(Integer rpID) {
		dao.delete(rpID);
	}

	public SerRepVO getoneSerRep(Integer rpID) {
		return dao.findByPrimaryKey(rpID);
	}

	public List<SerRepVO> getAll() {
		return dao.getAll();
	}
	
	public void updateMemSupReported(Integer memID) { //檢舉次數
		dao.updateMemSupReport(memID);
	}

}
