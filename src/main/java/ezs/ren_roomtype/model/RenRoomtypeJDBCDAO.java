package ezs.ren_roomtype.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.Util;

public class RenRoomtypeJDBCDAO implements RenRoomtypeDAO_interface {
	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`REN_ROOMTYPE` (rt_type) VALUES (?)";
	private static final String GET_ALL_STMT = "SELECT * FROM `CFA104G5`.`REN_ROOMTYPE` ORDER BY rt_id";
	private static final String GET_ONE_STMT = "SELECT * FROM `CFA104G5`.`REN_ROOMTYPE` WHERE rt_id = ?";
	private static final String DELETE = "DELETE FROM `CFA104G5`.`REN_ROOMTYPE` WHERE rt_id = ?";
	private static final String UPDATE = "UPDATE `CFA104G5`.`REN_ROOMTYPE` SET rt_type = ? WHERE rt_id = ?";

	static {
		try {
			Class.forName(Util.DRIVER);
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		}
	}

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public void insert(RenRoomtypeVO roomtypeVO) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, roomtypeVO.getRtType());
			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void update(RenRoomtypeVO roomtypeVO) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, roomtypeVO.getRtType());
			pstmt.setInt(2, roomtypeVO.getRtID());
			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void delete(Integer rtID) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, rtID);

			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public RenRoomtypeVO findByPrimaryKey(Integer rtID) {
		RenRoomtypeVO roomtypeVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, rtID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				roomtypeVO = new RenRoomtypeVO();
				roomtypeVO.setRtID(rs.getInt("rt_id"));
				roomtypeVO.setRtType(rs.getString("rt_type"));
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return roomtypeVO;
	}

	@Override
	public List<RenRoomtypeVO> getAll() {
		List<RenRoomtypeVO> list = new ArrayList<RenRoomtypeVO>();
		RenRoomtypeVO roomtypeVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				roomtypeVO = new RenRoomtypeVO();
				roomtypeVO.setRtID(rs.getInt("rt_id"));
				roomtypeVO.setRtType(rs.getString("rt_type"));

				list.add(roomtypeVO); // Store the row in the list
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

}
