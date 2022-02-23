package ezs.admin_emp.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import util.Util;

public class AdminEmpDAO implements AdminEmpDAO_interface {

	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`ADMIN_EMP` (adm_username, adm_password, adm_status) VALUES (?, ?, ?)";

	private static final String GET_ALL_STMT = "SELECT adm_id, adm_username, adm_password, adm_status FROM `CFA104G5`.`ADMIN_EMP` ORDER BY adm_id";

	private static final String GET_ONE_STMT = "SELECT adm_id, adm_username, adm_password, adm_status FROM `CFA104G5`.`ADMIN_EMP` WHERE adm_id = ?";
	
	private static final String Search = "SELECT adm_id, adm_username, adm_password, adm_status FROM `CFA104G5`.`ADMIN_EMP` WHERE (adm_username, adm_password) = (?, ?)";

	private static final String Check = "SELECT adm_username FROM `CFA104G5`.`ADMIN_EMP` WHERE adm_username = ?";

	private static final String DELETE = "DELETE FROM `CFA104G5`.`ADMIN_EMP` WHERE adm_id = ?";

	private static final String UPDATE = "UPDATE `CFA104G5`.`ADMIN_EMP` SET adm_username=?, adm_password=?, adm_status=? WHERE adm_id = ?";

	private static DataSource ds = null;
	static {
		try {
			Context ctx  = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CFA104G5");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public void insert(AdminEmpVO adminEmpVO) {

		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, adminEmpVO.getAdmUsername());
			pstmt.setString(2, adminEmpVO.getAdmPassword());
			pstmt.setInt(3, adminEmpVO.getAdmStatus());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public void update(AdminEmpVO adminEmpVO) {

		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(4, adminEmpVO.getAdmID());
			pstmt.setString(1, adminEmpVO.getAdmUsername());
			pstmt.setString(2, adminEmpVO.getAdmPassword());
			pstmt.setInt(3, adminEmpVO.getAdmStatus());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void delete(Integer admID) {

		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, admID);

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public AdminEmpVO findByPrimaryKey(Integer admID) {

		AdminEmpVO adminEmpVO = null;

		try {
			con = ds.getConnection();

			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, admID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				adminEmpVO = new AdminEmpVO();
				adminEmpVO.setAdmID(rs.getInt("ADM_ID"));
				adminEmpVO.setAdmUsername(rs.getString("ADM_USERNAME"));
				adminEmpVO.setAdmPassword(rs.getString("ADM_PASSWORD"));
				adminEmpVO.setAdmStatus(rs.getInt("ADM_STATUS"));
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return adminEmpVO;
	}

	@Override
	public AdminEmpVO Search(String admUsername ,String admPassword) {

		AdminEmpVO adminEmpVO = null;

		try {
			con = ds.getConnection();

			pstmt = con.prepareStatement(Search);

			pstmt.setString(1, admUsername);
			pstmt.setString(2, admPassword);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				adminEmpVO = new AdminEmpVO();
				adminEmpVO.setAdmID(rs.getInt("ADM_ID"));
				adminEmpVO.setAdmUsername(rs.getString("ADM_USERNAME"));
				adminEmpVO.setAdmPassword(rs.getString("ADM_PASSWORD"));
				adminEmpVO.setAdmStatus(rs.getInt("ADM_STATUS"));
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return adminEmpVO;
	}
	
	@Override
	public List<AdminEmpVO> getAll() {
		List<AdminEmpVO> list = new ArrayList<AdminEmpVO>();
		AdminEmpVO adminEmpVO = null;

		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				adminEmpVO = new AdminEmpVO();
				adminEmpVO.setAdmID(rs.getInt("ADM_ID"));
				adminEmpVO.setAdmUsername(rs.getString("ADM_USERNAME"));
				adminEmpVO.setAdmPassword(rs.getString("ADM_PASSWORD"));
				adminEmpVO.setAdmStatus(rs.getInt("ADM_STATUS"));
				list.add(adminEmpVO); // Store the row in the list
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}
	@Override
	public List<AdminEmpVO> getAll1() {
		List<AdminEmpVO> list = new ArrayList<AdminEmpVO>();
		AdminEmpVO adminEmpVO = null;
		
		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				adminEmpVO = new AdminEmpVO();
				adminEmpVO.setAdmID(rs.getInt("ADM_ID"));
				adminEmpVO.setAdmUsername(rs.getString("ADM_USERNAME"));
				adminEmpVO.setAdmPassword(rs.getString("ADM_PASSWORD"));
				adminEmpVO.setAdmStatus(rs.getInt("ADM_STATUS"));
				list.add(adminEmpVO); // Store the row in the list
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

	@Override
	public AdminEmpVO CheckAdmUsername(String admUsername) {
		AdminEmpVO adminEmpVO = null;

		try {
			con = ds.getConnection();

			pstmt = con.prepareStatement(Check);

			pstmt.setString(1, admUsername);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				adminEmpVO = new AdminEmpVO();
				adminEmpVO.setAdmUsername(rs.getString("ADM_USERNAME"));
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return adminEmpVO;
	}

}
