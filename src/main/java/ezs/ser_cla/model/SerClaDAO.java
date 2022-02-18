package ezs.ser_cla.model;

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

public class SerClaDAO implements SerClaDAO_interface {

	public static final String INSERT = "INSERT INTO ser_cla(ser_cla_name) VALUES(?)";
	public static final String UPDATE = "UPDATE ser_cla SET ser_cla_name = ? WHERE ser_cla_id = ?";
	public static final String DELETE = "DELETE FROM ser_cla WHERE ser_cla_id = ?";
	public static final String FIND_BY_PK = "SELECT * FROM ser_cla WHERE ser_cla_id = ? ";
	public static final String GET_ALL = "SELECT * FROM ser_cla";

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CFA104G5");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public void insert(SerClaVO serClaVO) {

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);

			
			pstmt.setString(1, serClaVO.getSerClaName());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public void update(SerClaVO serClaVO) {

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, serClaVO.getSerClaName());
			pstmt.setInt(2, serClaVO.getSerClaID());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public void delete(Integer serClaID) {

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, serClaID);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public SerClaVO findByPrimaryKey(Integer serClaID) {
		SerClaVO serClaVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_BY_PK);
			pstmt.setInt(1, serClaID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				serClaVO = new SerClaVO();
				serClaVO.setSerClaID(serClaID);
				serClaVO.setSerClaName(rs.getString("ser_cla_name"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return serClaVO;
	}

	@Override
	public List<SerClaVO> getAll() {
		List<SerClaVO> serClaVOList = new ArrayList<>();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				SerClaVO serClaVO = new SerClaVO();
				serClaVO.setSerClaID(rs.getInt("ser_cla_id"));
				serClaVO.setSerClaName(rs.getString("ser_cla_name"));

				serClaVOList.add(serClaVO);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

		return serClaVOList;
	}

}
