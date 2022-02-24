package ezs.ren_appointment.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import util.Util;
import util.jdbcUtil_CompositeQuery_RenApp;

public class RenAppointmentDAO implements RenAppointmentDAO_interface {
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CFA104G5");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`REN_APPOINTMENT` (apt_mem_id, apt_ldd_id, apt_lis_id, apt_status, apt_time, apt_timestamp) VALUES (?, ?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE `CFA104G5`.`REN_APPOINTMENT` SET apt_mem_id = ?, apt_ldd_id = ?, apt_lis_id = ?, apt_status = ?, apt_time = ? WHERE apt_id = ?";
	private static final String DELETE_STMT = "DELETE FROM `CFA104G5`.`REN_APPOINTMENT` WHERE apt_id = ?";
	private static final String FIND_BY_PK = "SELECT * FROM `CFA104G5`.`REN_APPOINTMENT` WHERE apt_id = ?";
	private static final String GET_ALL = "SELECT * FROM `CFA104G5`.`REN_APPOINTMENT` ORDER BY apt_id DESC";	

	private static final String FIND_BY_LDD = "SELECT * FROM `CFA104G5`.`REN_APPOINTMENT` WHERE apt_ldd_id = ?";
	private static final String FIND_BY_MEM = "SELECT * FROM `CFA104G5`.`REN_APPOINTMENT` WHERE apt_mem_id = ?";

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public void insert(RenAppointmentVO appointmentVO) {
		
		try {
		
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setInt(1, appointmentVO.getAptMemId());
			pstmt.setInt(2, appointmentVO.getAptLddId());
			pstmt.setInt(3, appointmentVO.getAptLisId());
			pstmt.setInt(4, appointmentVO.getAptStatus());
			pstmt.setTimestamp(5, appointmentVO.getAptTime());
			pstmt.setTimestamp(6, appointmentVO.getAptTimestamp());
			
			pstmt.executeUpdate();
		
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void update(RenAppointmentVO appointmentVO) {
		
		try {
		
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setInt(1, appointmentVO.getAptMemId());
			pstmt.setInt(2, appointmentVO.getAptLddId());
			pstmt.setInt(3, appointmentVO.getAptLisId());
			pstmt.setInt(4, appointmentVO.getAptStatus());
			pstmt.setTimestamp(5, appointmentVO.getAptTime());
			pstmt.setInt(6, appointmentVO.getAptId());
			
			pstmt.executeUpdate();
		
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void delete(Integer aptId) {
		
		try {
		
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_STMT);
			
			pstmt.setInt(1, aptId);
			
			pstmt.executeUpdate();
		
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public RenAppointmentVO findByPK(Integer aptId) {
		RenAppointmentVO app = null;

		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_BY_PK);
			
			pstmt.setInt(1, aptId);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				app = new RenAppointmentVO();
				app.setAptId(rs.getInt("apt_id"));
				app.setAptMemId(rs.getInt("apt_mem_id"));
				app.setAptLddId(rs.getInt("apt_ldd_id"));
				app.setAptLisId(rs.getInt("apt_lis_id"));
				app.setAptStatus(rs.getInt("apt_status"));
				app.setAptTime(rs.getTimestamp("apt_time"));
				app.setAptTimestamp(rs.getTimestamp("apt_timestamp"));
			}
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return app;
	}

	@Override
	public List<RenAppointmentVO> getAll() {
		List<RenAppointmentVO> appList = new ArrayList<>();
		RenAppointmentVO app = null;

		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				app = new RenAppointmentVO();
				app.setAptId(rs.getInt("apt_id"));
				app.setAptMemId(rs.getInt("apt_mem_id"));
				app.setAptLddId(rs.getInt("apt_ldd_id"));
				app.setAptLisId(rs.getInt("apt_lis_id"));
				app.setAptStatus(rs.getInt("apt_status"));
				app.setAptTime(rs.getTimestamp("apt_time"));
				app.setAptTimestamp(rs.getTimestamp("apt_timestamp"));
				appList.add(app);
			}
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return appList;
	}

	@Override
	public List<RenAppointmentVO> getAll(Map<String, String[]> map) {
		List<RenAppointmentVO> list = new ArrayList<RenAppointmentVO>();
		RenAppointmentVO renAppointmentVO = null;
	
		try {
			
			con = ds.getConnection();
			String finalSQL = "select * from `CFA104G5`.`REN_APPOINTMENT` "
		          + jdbcUtil_CompositeQuery_RenApp.get_WhereCondition(map)
		          + "order by apt_id";
			pstmt = con.prepareStatement(finalSQL);
//			System.out.println("●●finalSQL(by DAO) = "+finalSQL);
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				renAppointmentVO = new RenAppointmentVO();
				renAppointmentVO.setAptId(rs.getInt("apt_id"));
				renAppointmentVO.setAptMemId(rs.getInt("apt_mem_id"));
				renAppointmentVO.setAptLddId(rs.getInt("apt_ldd_id"));
				renAppointmentVO.setAptLisId(rs.getInt("apt_lis_id"));
				renAppointmentVO.setAptStatus(rs.getInt("apt_status"));
				renAppointmentVO.setAptTime(rs.getTimestamp("apt_time"));
				renAppointmentVO.setAptTimestamp(rs.getTimestamp("apt_timestamp"));
				list.add(renAppointmentVO); // Store the row in the List
			}
	
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}
	
	
	@Override
	public List<RenAppointmentVO> getAllMEM(Integer aptMemId) {
		List<RenAppointmentVO> appList = new ArrayList<>();
		RenAppointmentVO app = null;
		System.out.println(aptMemId);
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_BY_MEM);
			pstmt.setInt(1, aptMemId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				app = new RenAppointmentVO();
				app.setAptId(rs.getInt("apt_id"));
				app.setAptMemId(rs.getInt("apt_mem_id"));
				app.setAptLddId(rs.getInt("apt_ldd_id"));
				app.setAptLisId(rs.getInt("apt_lis_id"));
				app.setAptStatus(rs.getInt("apt_status"));
				app.setAptTime(rs.getTimestamp("apt_time"));
				app.setAptTimestamp(rs.getTimestamp("apt_timestamp"));
				appList.add(app);
			}
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return appList;
	}
	
	
	@Override
	public List<RenAppointmentVO> getAllLDD(Integer aptLddId) {
		List<RenAppointmentVO> appList = new ArrayList<>();
		RenAppointmentVO app = null;

		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_BY_LDD);
			System.out.println(aptLddId);
			pstmt.setInt(1, aptLddId);		
			rs = pstmt.executeQuery();

			while (rs.next()) {
				app = new RenAppointmentVO();
				app.setAptId(rs.getInt("apt_id"));
				app.setAptMemId(rs.getInt("apt_mem_id"));
				app.setAptLddId(rs.getInt("apt_ldd_id"));
				app.setAptLisId(rs.getInt("apt_lis_id"));
				app.setAptStatus(rs.getInt("apt_status"));
				app.setAptTime(rs.getTimestamp("apt_time"));
				app.setAptTimestamp(rs.getTimestamp("apt_timestamp"));
				appList.add(app);
			}
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return appList;
	}


}