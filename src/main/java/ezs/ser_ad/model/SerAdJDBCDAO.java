package ezs.ser_ad.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.Util;

public class SerAdJDBCDAO implements SerAdDAO_interface{
	public static final String INSERT = "INSERT INTO ser_ad(ad_vdr_id, ad_status, ad_ser_cla_id, ad_dist, ad_txt, ad_pic) VALUES(? ,? ,?, ?, ?, ?)";
	public static final String UPDATE = "UPDATE ser_ad SET ad_status = ?,ad_dist = ?,ad_txt = ?,ad_pic = ? WHERE (ad_vdr_id ,ad_ser_cla_id) = (?,?)";
	public static final String DELETE = "DELETE FROM ser_ad WHERE (ad_vdr_id ,ad_ser_cla_id) = (?,?)";
	public static final String FIND_BY_PK = "SELECT * FROM ser_ad WHERE (ad_vdr_id,ad_ser_cla_id) = (?,?)";
	public static final String GET_ALL = "SELECT * FROM ser_ad";
	public static final String GET_AD_BY_SER_CLA_ID = "SELECT * FROM CFA104G5.SER_AD where AD_SER_CLA_ID =?";
	
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
	public void insert(SerAdVO serAdVO) {
		
		try {
			con = DriverManager.getConnection(Util.URL,Util.USER,Util.PASSWORD);
			pstmt = con.prepareStatement(INSERT);
			
			pstmt.setInt(1, serAdVO.getAdVdrID());
			pstmt.setInt(2, serAdVO.getAdStatus());
			pstmt.setInt(3, serAdVO.getAdSerClaID());
			pstmt.setString(4, serAdVO.getAdDist());
			pstmt.setString(5, serAdVO.getAdTxt());
			pstmt.setBytes(6, serAdVO.getAdPic());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Util.closeResource(con, pstmt, rs);
		}
		
		
	}
	@Override
	public void update(SerAdVO seviceAdVO) {
		
		try {
			con = DriverManager.getConnection(Util.URL,Util.USER,Util.PASSWORD);
			pstmt = con.prepareStatement(UPDATE);
			
			
			pstmt.setInt(1, seviceAdVO.getAdStatus());
			pstmt.setString(2, seviceAdVO.getAdDist());
			pstmt.setString(3, seviceAdVO.getAdTxt());
			pstmt.setBytes(4, seviceAdVO.getAdPic());
			pstmt.setInt(5, seviceAdVO.getAdVdrID());
			pstmt.setInt(6, seviceAdVO.getAdSerClaID());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Util.closeResource(con, pstmt, rs);
		}
		
		
	}
	@Override
	public void delete(Integer adVdrID, Integer adSerClaID) {
		
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setInt(1, adVdrID);
			pstmt.setInt(2, adSerClaID);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Util.closeResource(con, pstmt, rs);
		}
		
		
	}
	@Override
	public SerAdVO findByPrimartKey(Integer adVdrID, Integer adSerClaID) {
		SerAdVO serAdVO = null;
		
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(FIND_BY_PK);
			pstmt.setInt(1, adVdrID);
			pstmt.setInt(2, adSerClaID);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				serAdVO = new SerAdVO(); 
				serAdVO.setAdVdrID(adVdrID);
				serAdVO.setAdStatus(rs.getByte("ad_status"));
				serAdVO.setAdSerClaID(adSerClaID);
				serAdVO.setAdDist(rs.getString("ad_dist"));
				serAdVO.setAdTxt(rs.getString("ad_txt"));
				serAdVO.setAdPic(rs.getBytes("ad_pic"));
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Util.closeResource(con, pstmt, rs);
		}
		
		return serAdVO;
	}
	@Override
	public List<SerAdVO> getAll() {
		List<SerAdVO> serAdVOList = new ArrayList<>();
		
		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				SerAdVO serAdVO = new SerAdVO();
				
				
				serAdVO.setAdVdrID(rs.getInt("ad_vdr_id"));
				serAdVO.setAdStatus(rs.getByte("ad_status"));
				serAdVO.setAdSerClaID(rs.getInt("ad_ser_cla_id"));
				serAdVO.setAdDist(rs.getString("ad_dist"));
				serAdVO.setAdTxt(rs.getString("ad_txt"));
				serAdVO.setAdPic(rs.getBytes("ad_pic"));
				
				serAdVOList.add(serAdVO);
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Util.closeResource(con, pstmt, rs);
		}
	
		return serAdVOList;
	}
	@Override
	
	public List<SerAdVO> getAdBySerClaID(Integer adSerClaID) {
		List<SerAdVO> serAdVOList = new ArrayList<SerAdVO>();

		try {
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(GET_AD_BY_SER_CLA_ID);
			pstmt.setInt(1,adSerClaID );
			rs = pstmt.executeQuery();

			while (rs.next()) {
				SerAdVO serAdVO = new SerAdVO();

				serAdVO.setAdVdrID(rs.getInt("ad_vdr_id"));
				serAdVO.setAdStatus(rs.getByte("ad_status"));
				serAdVO.setAdSerClaID(rs.getInt("ad_ser_cla_id"));
				serAdVO.setAdDist(rs.getString("ad_dist"));;
				serAdVO.setAdTxt(rs.getString("ad_txt"));
				serAdVO.setAdPic(rs.getBytes("ad_pic"));

				serAdVOList.add(serAdVO);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

		return serAdVOList;
	}
}
