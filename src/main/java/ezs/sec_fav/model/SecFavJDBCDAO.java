package ezs.sec_fav.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.Util;

public class SecFavJDBCDAO implements SecFavDAO_interface {

	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`SEC_FAV` (sh_mem_id,sh_id,sh_addfavtime) VALUES (?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT sh_mem_id,sh_id,sh_addfavtime FROM `CFA104G5`.`SEC_FAV` ORDER BY sh_mem_id,sh_id";
	private static final String GET_ONE_STMT = "SELECT sh_mem_id,sh_id,sh_addfavtime FROM `CFA104G5`.`SEC_FAV` WHERE (sh_mem_id ,sh_id )= ( ?,?)";
	private static final String DELETE = "DELETE FROM `CFA104G5`.`SEC_FAV` WHERE (sh_mem_id ,sh_id )= ( ?,?)";
	private static final String UPDATE = "UPDATE `CFA104G5`.`SEC_FAV` SET sh_addfavtime=? WHERE (sh_mem_id ,sh_id )= ( ?,?)";

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
	public void insert(SecFavVO shfavVO) {

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);

			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, shfavVO.getShMemID());
			pstmt.setInt(2, shfavVO.getShID());
			pstmt.setDate(3, shfavVO.getShAddFavTime());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public void update(SecFavVO shfavVO) {

		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setDate(1, shfavVO.getShAddFavTime());
			pstmt.setInt(2, shfavVO.getShMemID());
			pstmt.setInt(3, shfavVO.getShID());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public void delete(Integer shMemID, Integer shID) {

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, shMemID);
			pstmt.setInt(2, shID);

			pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();

		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public SecFavVO findByPrimaryKey(Integer shMemID, Integer shID) {
		SecFavVO shfavVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, shMemID);
			pstmt.setInt(2, shID);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				shfavVO = new SecFavVO();

				shfavVO.setShMemID(rs.getInt("sh_mem_id"));
				shfavVO.setShID(rs.getInt("sh_id"));
				shfavVO.setShAddFavTime(rs.getDate("sh_addfavtime"));

			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return shfavVO;
	}

	@Override
	public List<SecFavVO> getAll() {
		List<SecFavVO> list = new ArrayList<SecFavVO>();
		SecFavVO shfavVO = null;


		try {

			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				shfavVO = new SecFavVO();

				shfavVO.setShMemID(rs.getInt("sh_mem_id"));
				shfavVO.setShID(rs.getInt("sh_id"));
				shfavVO.setShAddFavTime(rs.getDate("sh_addfavtime"));

				list.add(shfavVO); // Store the row in the list
			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

	

}
