package ezs.admin_priv.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.Util;

public class AdminPrivJDBCDAO implements AdminPriv_interface {

	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`ADMIN_PRIV` (adm_id, fun_id) VALUES (?, ?)";
	private static final String DELETE = "DELETE FROM `CFA104G5`.`ADMIN_PRIV` WHERE adm_id = ?";
	private static final String GET_ONE_STMT = "SELECT adm_id, fun_id FROM `CFA104G5`.`ADMIN_PRIV` WHERE (adm_id,fun_id) = (?,?)";
	private static final String GET_ALL_FROM_ONE_STMT = "SELECT adm_id, fun_id FROM `CFA104G5`.`ADMIN_PRIV` WHERE adm_id = ?";
	private static final String GET_ALL_STMT = "SELECT adm_id, fun_id FROM `CFA104G5`.`ADMIN_PRIV` ORDER BY adm_id";

	static {
		try {
			Class.forName(Util.DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public void insert(AdminPrivVO adminFUNCTIONVO) {

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, adminFUNCTIONVO.getAdmID());
			pstmt.setInt(2, adminFUNCTIONVO.getFunID());

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

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
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
	public AdminPrivVO findByPrimaryKey(Integer admID, Integer funID) {
		AdminPrivVO adminFUNCTIONVO = null;

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, admID);
			pstmt.setInt(2, funID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				adminFUNCTIONVO = new AdminPrivVO();
				adminFUNCTIONVO.setAdmID(rs.getInt("ADM_ID"));
				adminFUNCTIONVO.setFunID(rs.getInt("FUN_ID"));
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return adminFUNCTIONVO;
	}
	@Override
	public List<AdminPrivVO> getAllFromID (Integer admID) {
		List<AdminPrivVO> list = new ArrayList<AdminPrivVO>();
		AdminPrivVO adminFUNCTIONVO = null;
		
		try {
			
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_FROM_ONE_STMT);
			
			pstmt.setInt(1, admID);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				adminFUNCTIONVO = new AdminPrivVO();
				adminFUNCTIONVO.setAdmID(rs.getInt("ADM_ID"));
				adminFUNCTIONVO.setFunID(rs.getInt("FUN_ID"));
				list.add(adminFUNCTIONVO);
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

	@Override
	public List<AdminPrivVO> getAll() {
		List<AdminPrivVO> list = new ArrayList<AdminPrivVO>();
		AdminPrivVO adminFUNCTIONVO = null;

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				adminFUNCTIONVO = new AdminPrivVO();
				adminFUNCTIONVO.setAdmID(rs.getInt("ADM_ID"));
				adminFUNCTIONVO.setFunID(rs.getInt("FUN_ID"));
				list.add(adminFUNCTIONVO); // Store the row in the list
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

}
