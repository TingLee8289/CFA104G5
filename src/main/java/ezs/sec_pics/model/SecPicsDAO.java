package ezs.sec_pics.model;

import java.io.FileInputStream;
import java.io.IOException;
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

public class SecPicsDAO implements SecPicsDAO_interface {

	private static final String INSERT_STMT = "INSERT INTO "
			+ "`CFA104G5`.`SEC_PICS` (sh_pic_id, sh_id, sh_pic) VALUES (?, ?, ?)";
	private static final String DELETE_STMT = "DELETE FROM `CFA104G5`.`SEC_PICS` WHERE sh_pic_id = ?";
	private static final String UPDATE_STMT = "UPDATE `CFA104G5`.`SEC_PICS` SET  sh_id=?, sh_pic=? WHERE sh_pic_id = ?";
	private static final String GET_ONE_STMT = "SELECT * FROM `CFA104G5`.`SEC_PICS` WHERE sh_pic_id = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM `CFA104G5`.`SEC_PICS` ORDER BY sh_pic_id";
	private static final String GET_EACH_FIRST_STMT ="SELECT * FROM (select *, row_number() over (partition by sh_id order by sh_pic_id asc) sn from sec_pics) r where r.sn=1";
	private static final String GET_BY_SHID_STMT = "SELECT * FROM `CFA104G5`.`SEC_PICS` WHERE sh_id = ?";

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
	public void insert(SecPicsVO secPicsVO) {
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, secPicsVO.getShPicID());
			pstmt.setInt(2, secPicsVO.getShID());
			pstmt.setBytes(3, secPicsVO.getShPic());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public void delete(Integer shPicID) {
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1, shPicID);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public void update(SecPicsVO secPicsVO) {
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);
			pstmt.setInt(1, secPicsVO.getShID());
			pstmt.setBytes(2, secPicsVO.getShPic());
			pstmt.setInt(3, secPicsVO.getShPicID());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public SecPicsVO findByPrimaryKey(Integer shPicID) {
		SecPicsVO secPicsVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, shPicID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				secPicsVO = new SecPicsVO();
				secPicsVO.setShPicID(rs.getInt("sh_pic_id"));
				secPicsVO.setShID(rs.getInt("sh_id"));
				secPicsVO.setShPic(rs.getBytes("sh_pic"));
			}
			return secPicsVO;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return null;
	}

	@Override
	public List<SecPicsVO> getAll() {
		List<SecPicsVO> list = new ArrayList<SecPicsVO>();
		SecPicsVO secPicsVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				secPicsVO = new SecPicsVO();
				secPicsVO.setShPicID(rs.getInt("sh_pic_id"));
				secPicsVO.setShID(rs.getInt("sh_id"));
				secPicsVO.setShPic(rs.getBytes("sh_pic"));
				list.add(secPicsVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

	public byte[] getPictureByteArray(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		byte[] buffer = new byte[fis.available()];
		fis.read(buffer);
		fis.close();
		return buffer;
	}

	@Override
	public List<SecPicsVO> getEachItemFirstPic() {
		List<SecPicsVO> list = new ArrayList<SecPicsVO>();
		SecPicsVO secPicsVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_EACH_FIRST_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				secPicsVO = new SecPicsVO();
				secPicsVO.setShPicID(rs.getInt("sh_pic_id"));
				secPicsVO.setShID(rs.getInt("sh_id"));
				secPicsVO.setShPic(rs.getBytes("sh_pic"));
				list.add(secPicsVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

	@Override
	public List<SecPicsVO> getByShID(Integer shID) {
		List<SecPicsVO> list = new ArrayList<SecPicsVO>();
		SecPicsVO secPicsVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_BY_SHID_STMT);
			pstmt.setInt(1, shID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				secPicsVO = new SecPicsVO();
				secPicsVO.setShPicID(rs.getInt("sh_pic_id"));
				secPicsVO.setShID(rs.getInt("sh_id"));
				secPicsVO.setShPic(rs.getBytes("sh_pic"));
				list.add(secPicsVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

}
