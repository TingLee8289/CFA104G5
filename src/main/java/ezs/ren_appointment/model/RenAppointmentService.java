package ezs.ren_appointment.model;

import java.util.List;
import java.util.Map;

public class RenAppointmentService {

	private RenAppointmentDAO_interface dao;

	public RenAppointmentService() {
		dao = new RenAppointmentDAO();
	}

	public RenAppointmentVO addRenApp(Integer aptMemId, Integer aptLddId, Integer aptLisId, Integer aptStatus,
			java.sql.Timestamp aptTime, java.sql.Timestamp aptTimestamp) {

		RenAppointmentVO renAppointmentVO = new RenAppointmentVO();

		renAppointmentVO.setAptMemId(aptMemId);
		renAppointmentVO.setAptLddId(aptLddId);
		renAppointmentVO.setAptLisId(aptLisId);
		renAppointmentVO.setAptStatus(aptStatus);
		renAppointmentVO.setAptTime(aptTime);
		renAppointmentVO.setAptTimestamp(aptTimestamp);
		dao.insert(renAppointmentVO);

		return renAppointmentVO;
	}

	public RenAppointmentVO updateRenApp(Integer aptId, Integer aptMemId, Integer aptLddId, Integer aptLisId,
			Integer aptStatus, java.sql.Timestamp aptTime) {

		RenAppointmentVO renAppointmentVO = new RenAppointmentVO();

		renAppointmentVO.setAptId(aptId);
		renAppointmentVO.setAptMemId(aptMemId);
		renAppointmentVO.setAptLddId(aptLddId);
		renAppointmentVO.setAptLisId(aptLisId);
		renAppointmentVO.setAptStatus(aptStatus);
		renAppointmentVO.setAptTime(aptTime);
		dao.update(renAppointmentVO);

		return renAppointmentVO;
	}
	
	public void deleteRenApp(Integer aptId) {
		dao.delete(aptId);
	}
	
	public RenAppointmentVO getOneRenApp(Integer aptId) {
		return dao.findByPK(aptId);
	}
	
	public List<RenAppointmentVO> getAll() {
		return dao.getAll();		
	}
	
	public List<RenAppointmentVO> getAll(Map<String, String[]> map) {
		return dao.getAll(map);
	}
	
	public List<RenAppointmentVO> getAllLDD(Integer aptLddId){
		return dao.getAllLDD(aptLddId);
	}
	
	public List<RenAppointmentVO> getAllMEM(Integer aptMemId){
		return dao.getAllMEM(aptMemId);
	}

	


}