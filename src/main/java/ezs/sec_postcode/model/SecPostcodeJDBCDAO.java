package ezs.sec_postcode.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.Util;

public class SecPostcodeJDBCDAO implements SecPostcodeDAO_interface {
	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`SEC_POSTCODE` (sh_post_code, sh_post_county, sh_post_dist) VALUES (?, ?, ?)";
	private static final String DELETE_STMT = "DELETE FROM `CFA104G5`.`SEC_POSTCODE` WHERE sh_post_code = ?";
	private static final String UPDATE_STMT = "UPDATE `CFA104G5`.`SEC_POSTCODE` SET sh_post_county=?, sh_post_dist=? WHERE sh_post_code = ?";
	private static final String GET_ONE_STMT = "SELECT sh_post_code, sh_post_county, sh_post_dist FROM `CFA104G5`.`SEC_POSTCODE` WHERE sh_post_code = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM `CFA104G5`.`SEC_POSTCODE` ORDER BY sh_post_code";

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
	public void insert(SecPostcodeVO secPostcodeVO) {

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, secPostcodeVO.getShPostCode());
			pstmt.setString(2, secPostcodeVO.getShPostCounty());
			pstmt.setString(3, secPostcodeVO.getShPostDist());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void delete(Integer postcodeCode) {

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1, postcodeCode);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void update(SecPostcodeVO secPostcodeVO) {

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE_STMT);
			pstmt.setString(1, secPostcodeVO.getShPostCounty());
			pstmt.setString(2, secPostcodeVO.getShPostDist());
			pstmt.setInt(3, secPostcodeVO.getShPostCode());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public SecPostcodeVO findByPrimaryKey(Integer postcodeCode) {

		SecPostcodeVO secPostcodeVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, postcodeCode);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				secPostcodeVO = new SecPostcodeVO();
				secPostcodeVO.setShPostCode(rs.getInt("sh_post_code"));
				secPostcodeVO.setShPostCounty(rs.getString("sh_post_county"));
				secPostcodeVO.setShPostDist(rs.getString("sh_post_dist"));
			}
			return secPostcodeVO;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return null;
	}

	@Override
	public List<SecPostcodeVO> getAll() {
		List<SecPostcodeVO> list = new ArrayList<SecPostcodeVO>();
		SecPostcodeVO secPostcodeVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				secPostcodeVO = new SecPostcodeVO();
				secPostcodeVO.setShPostCode(rs.getInt("sh_post_code"));
				secPostcodeVO.setShPostCounty(rs.getString("sh_post_county"));
				secPostcodeVO.setShPostDist(rs.getString("sh_post_dist"));
				list.add(secPostcodeVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

}
