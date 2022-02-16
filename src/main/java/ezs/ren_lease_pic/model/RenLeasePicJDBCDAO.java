package ezs.ren_lease_pic.model;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.Util;

public class RenLeasePicJDBCDAO implements RenLeasePicDAO_interface {
	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`REN_LEASE_PIC` (lp_lease_id,lp_pic) VALUES (?, ?)";
	private static final String GET_ALL_STMT = "SELECT * FROM `CFA104G5`.`REN_LEASE_PIC`";
	private static final String GET_ONE_STMT = "SELECT lp_id,lp_lease_id,lp_pic FROM `CFA104G5`.`REN_LEASE_PIC` where lp_id = ?";
	private static final String DELETE = "DELETE FROM `CFA104G5`.`REN_LEASE_PIC` where lp_id = ?";
	private static final String UPDATE = "UPDATE `CFA104G5`.`REN_LEASE_PIC` set lp_lease_id =?,lp_pic =? where lp_id = ?";

	static String path;
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
	public void insert(RenLeasePicVO lease_picVO) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, lease_picVO.getLpLeaseId());
			byte[] pic;
			try {
				pic = getPictureByteArray(path);
				pstmt.setBytes(2, pic);
			} catch (IOException e) {
				e.printStackTrace();
			}

			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void update(RenLeasePicVO lease_picVO) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, lease_picVO.getLpLeaseId());
			pstmt.setInt(3, lease_picVO.getLpId());

			byte[] pic;
			try {
				pic = getPictureByteArray(path);
				pstmt.setBytes(2, pic);
			} catch (IOException e) {
				e.printStackTrace();
			}

			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void delete(Integer lpId) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, lpId);

			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public RenLeasePicVO findByPrimaryKey(Integer lpId) {
		RenLeasePicVO lease_picVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, lpId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				lease_picVO = new RenLeasePicVO();
				lease_picVO.setLpId(rs.getInt("lp_id"));
				lease_picVO.setLpLeaseId(rs.getInt("lp_lease_id"));
				lease_picVO.setLpPic(rs.getBytes("lp_pic"));
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return lease_picVO;
	}

	@Override
	public List<RenLeasePicVO> getAll() {
		List<RenLeasePicVO> list = new ArrayList<RenLeasePicVO>();
		RenLeasePicVO renLeasePicVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				renLeasePicVO = new RenLeasePicVO();
				renLeasePicVO.setLpId(rs.getInt("lp_id"));
				renLeasePicVO.setLpLeaseId(rs.getInt("lp_lease_id"));
				renLeasePicVO.setLpPic(rs.getBytes("lp_pic"));
				list.add(renLeasePicVO);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

	public static InputStream getPictureStream(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		return fis;
	}

	public static byte[] getPictureByteArray(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		byte[] buffer = new byte[fis.available()];
		fis.read(buffer);
		fis.close();
		return buffer;
	}
}
