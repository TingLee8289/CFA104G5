package ezs.admin_func.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.Util;

public class AdminFuncJDBCDAO implements AdminFuncDAO_interface {

	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`ADMIN_FUNC` (fun_name) VALUES (?) ";
	private static final String DELETE_STMT = "DELETE FROM `CFA104G5`.`ADMIN_FUNC` WHERE fun_id = ?";
	private static final String UPDATE_STMT = "UPDATE `CFA104G5`.`ADMIN_FUNC` SET fun_name =? WHERE fun_id =?";
	private static final String GET_ONE_STMT = "SELECT fun_id, fun_name FROM `CFA104G5`.`ADMIN_FUNC` WHERE fun_id = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM `CFA104G5`.`ADMIN_FUNC` ORDER BY fun_id";

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
	public void insert(AdminFuncVO admFuncVO) {

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, admFuncVO.getFunName());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public void update(AdminFuncVO admFuncVO) {

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setInt(2, admFuncVO.getFunID());
			pstmt.setString(1, admFuncVO.getFunName());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void delete(Integer FunID) {

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(DELETE_STMT);

			pstmt.setInt(1, FunID);

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public AdminFuncVO findByPrimaryKey(Integer funID) {
		AdminFuncVO admFuncVO = null;

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, funID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				admFuncVO = new AdminFuncVO();
				admFuncVO.setFunID(rs.getInt("fun_id"));
				admFuncVO.setFunName(rs.getString("fun_name"));
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return admFuncVO;
	}

	@Override
	public List<AdminFuncVO> getAll() {
		List<AdminFuncVO> list = new ArrayList<AdminFuncVO>();
		AdminFuncVO admFuncVO = null;

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				admFuncVO = new AdminFuncVO();
				admFuncVO.setFunID(rs.getInt("fun_id"));
				admFuncVO.setFunName(rs.getString("fun_name"));
				list.add(admFuncVO); // Store the row in the list
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

}
