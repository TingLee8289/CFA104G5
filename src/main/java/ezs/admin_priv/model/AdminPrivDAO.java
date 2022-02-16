package ezs.admin_priv.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import util.Util;

public class AdminPrivDAO implements AdminPriv_interface {

	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`ADMIN_PRIV` (adm_id, fun_id) VALUES (?, ?)";
	private static final String DELETE = "DELETE FROM `CFA104G5`.`ADMIN_PRIV` WHERE (adm_id,fun_id) = (?,?)";
	private static final String GET_ONE_STMT = "SELECT adm_id, fun_id FROM `CFA104G5`.`ADMIN_PRIV` WHERE (adm_id,fun_id) = (?,?)";
	private static final String GET_ALL_STMT = "SELECT adm_id, fun_id FROM `CFA104G5`.`ADMIN_PRIV` ORDER BY adm_id";

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
	public void insert(AdminPrivVO adminFUNCTIONVO) {

		try {
			con = ds.getConnection();
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
	public void delete(Integer admID, Integer funID) {

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, admID);
			pstmt.setInt(2, funID);

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
	public List<AdminPrivVO> getAll() {
		List<AdminPrivVO> list = new ArrayList<AdminPrivVO>();
		AdminPrivVO adminFUNCTIONVO = null;

		try {
			con = ds.getConnection();
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
