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

import util.Util;

public class SecPicsJDBCDAO implements SecPicsDAO_interface {

	private static final String INSERT_STMT = "INSERT INTO "
			+ "`CFA104G5`.`SEC_PICS` (sh_id, sh_pic) VALUES (?, ?)";
	private static final String DELETE_STMT = "DELETE FROM `CFA104G5`.`SEC_PICS` WHERE sh_id = ?";
	private static final String UPDATE_STMT = "UPDATE `CFA104G5`.`SEC_PICS` SET  sh_id=?, sh_pic=? WHERE sh_id = ?";
	private static final String GET_ONE_STMT = "SELECT * FROM `CFA104G5`.`SEC_PICS` WHERE sh_pic_id = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM `CFA104G5`.`SEC_PICS` ORDER BY sh_pic_id";
	private static final String GET_EACH_FIRST_STMT ="SELECT * FROM (select *, row_number() over (partition by sh_id order by sh_pic_id asc) sn from sec_pics) r where r.sn=1";
	private static final String GET_BY_SHID_STMT = "SELECT * FROM `CFA104G5`.`SEC_PICS` WHERE sh_id = ?";
	private static final String GET_BY_SHCATEID_STMT = "SELECT * FROM CFA104G5.`sec_pics` pic JOIN `sec_items` items ON pic.sh_id=items.sh_id WHERE sh_cate_id = ?";

	
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
	public void insert(SecPicsVO secPicsVO) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
//			宣告要綁定的欄位  綁定對應到的商品ID  SecItemsService INSERT進來
			String[] cols = { "ShID" };
			
//			陣列跟著敘述綁定給資料庫   PreparedStatement 執行前就要預先給資料庫SQL指令 所以連同版為綁定資訊一起給資料庫
//			可以不用透過SQL指令執行了
			pstmt = con.prepareStatement(INSERT_STMT, cols);
		
			pstmt.setInt(1, secPicsVO.getShID());
			pstmt.setBytes(2, secPicsVO.getShPic());
			pstmt.executeUpdate();
			
	

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Util.closeResource(con, pstmt, rs);
		}

	}

	@Override
	public void delete(Integer shID) {
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(DELETE_STMT);
			pstmt.setInt(1, shID);
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
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
//			宣告要綁定的欄位  綁定對應到的商品ID  SecItemsService INSERT進來
			String[] cols = { "ShID" };
			
			pstmt = con.prepareStatement(UPDATE_STMT, cols);
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
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
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
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
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
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
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
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
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
	
	@Override
	public List<SecPicsVO> getByShCateID(Integer shCateID) {
		List<SecPicsVO> list = new ArrayList<SecPicsVO>();
		SecPicsVO secPicsVO = null;
		
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_BY_SHCATEID_STMT);
			pstmt.setInt(1, shCateID);
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
