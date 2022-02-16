package ezs.sec_category.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.Util;

public class SecCategoryJDBCDAO implements SecCategoryDAO_interface {

	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`SEC_CATEGORY` (sh_cate_ID, sh_cate_name) VALUES (?, ?)";
	private static final String DELETE_STMT = "DELETE FROM `CFA104G5`.`SEC_CATEGORY` WHERE sh_cate_ID = ?";
	private static final String UPDATE_STMT = "UPDATE `CFA104G5`.`SEC_CATEGORY` SET  sh_cate_ID=?, sh_cate_name=? WHERE sh_cate_ID = ?";
	private static final String GET_ONE_STMT = "SELECT sh_cate_ID, sh_cate_name FROM `CFA104G5`.`SEC_CATEGORY` WHERE sh_cate_ID = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM `CFA104G5`.`SEC_CATEGORY` ORDER BY sh_cate_ID";

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
	public void insert(SecCategoryVO secCategoryVO) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, secCategoryVO.getShCateID());
			pstmt.setString(2, secCategoryVO.getShCateName());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void update(SecCategoryVO secCategoryVO) {

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STMT);
			pstmt.setInt(1, secCategoryVO.getShCateID());
			pstmt.setString(2, secCategoryVO.getShCateName());
			pstmt.setInt(3, secCategoryVO.getShCateID());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void delete(Integer shCateID) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1, shCateID);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public SecCategoryVO findByPrimaryKey(Integer shCateID) {

		SecCategoryVO secCategoryVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, shCateID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				secCategoryVO = new SecCategoryVO();
				secCategoryVO.setShCateID(rs.getInt("sh_cate_id"));
				secCategoryVO.setShCateName(rs.getString("sh_cate_name"));
			}
			return secCategoryVO;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return null;
	}

	@Override
	public List<SecCategoryVO> getAll() {

		List<SecCategoryVO> list = new ArrayList<SecCategoryVO>();
		SecCategoryVO secCategoryVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				secCategoryVO = new SecCategoryVO();
				secCategoryVO.setShCateID(rs.getInt("sh_cate_ID"));
				secCategoryVO.setShCateName(rs.getString("sh_cate_name"));
				list.add(secCategoryVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}


}
