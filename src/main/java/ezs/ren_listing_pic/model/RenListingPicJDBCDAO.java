package ezs.ren_listing_pic.model;

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

import ezs.ren_location.model.RenLocationVO;
import util.Util;

public class RenListingPicJDBCDAO implements RenListingPicDAO_interface {
	private static final String INSERT_STMT = "INSERT INTO `CFA104G5`.`REN_LISTING_PIC` (LSP_LIS_ID, LSP_PIC) VALUES (?,?)";
	private static final String GET_ALL_STMT = "SELECT LSP_ID, LSP_LIS_ID, LSP_PIC FROM `CFA104G5`.`REN_LISTING_PIC` ORDER BY LSP_ID";
	private static final String GET_ONE_STMT = "SELECT LSP_ID, LSP_LIS_ID, LSP_PIC FROM `CFA104G5`.`REN_LISTING_PIC` WHERE LSP_ID = ?";
	private static final String DELETE = "DELETE FROM `CFA104G5`.`REN_LISTING_PIC` WHERE LSP_LIS_ID = ?";
	private static final String UPDATE = "UPDATE `CFA104G5`.`REN_LISTING_PIC` SET  LSP_PIC = ? WHERE LSP_LIS_ID = ?";
	private static final String GET_EACH_FIRST_STMT =  "SELECT * FROM (select *, row_number() over (partition by LSP_LIS_ID order by LSP_ID asc) sn from `CFA104G5`.`REN_LISTING_PIC`) r where r.sn=1";

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
	String path;

	@Override
	public void insert(RenListingPicVO listingpicVO) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, listingpicVO.getLspLisID());
			byte[] pic = getPictureByteArray(path);
			pstmt.setBytes(2, pic);

			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void update(RenListingPicVO listingpicVO) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			
//		byte[] pic = getPictureByteArray(path);
			pstmt.setBytes(1, listingpicVO.getLspPic());
			pstmt.setInt(2, listingpicVO.getLspLisID());
			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public void delete(Integer LSP_LIS_ID) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, LSP_LIS_ID);

			pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	@Override
	public RenListingPicVO findByPrimaryKey(Integer lspID) {
		RenListingPicVO renListingPicVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, lspID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				renListingPicVO = new RenListingPicVO();
				renListingPicVO.setLspID(rs.getInt("LSP_ID"));
				renListingPicVO.setLspLisID(rs.getInt("LSP_LIS_ID"));
				renListingPicVO.setLspPic(rs.getBytes("LSP_PIC"));
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return renListingPicVO;
	}

	@Override
	public List<RenListingPicVO> getAll() {
		List<RenListingPicVO> list = new ArrayList<RenListingPicVO>();
		RenListingPicVO renListingPicVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				renListingPicVO = new RenListingPicVO();
				renListingPicVO.setLspID(rs.getInt("LSP_ID"));
				renListingPicVO.setLspLisID(rs.getInt("LSP_LIS_ID"));
				renListingPicVO.setLspPic(rs.getBytes("LSP_PIC"));
				list.add(renListingPicVO); // Store the row in the list
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}

	public static byte[] getPictureByteArray(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		byte[] buffer = new byte[fis.available()];
		fis.read(buffer);
		fis.close();
		return buffer;
	}
	
	@Override
	public List<RenListingPicVO> getEachListingFirstPic() {
		List<RenListingPicVO> list = new ArrayList<RenListingPicVO>();
		RenListingPicVO renListingPicVO = null;

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_EACH_FIRST_STMT);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				renListingPicVO = new RenListingPicVO();
				renListingPicVO.setLspID(rs.getInt("LSP_ID"));
				renListingPicVO.setLspLisID(rs.getInt("LSP_LIS_ID"));
				renListingPicVO.setLspPic(rs.getBytes("LSP_PIC"));
				list.add(renListingPicVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
		return list;
	}



}
