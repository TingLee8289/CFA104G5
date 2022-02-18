package ezs.ser_ad.model;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import util.Util;


public class SerAdTest {
	
	private static final String SQL = "INSERT INTO ser_ad(ad_vdr_id, ad_status, ad_ser_cla_id, ad_dist, ad_txt, ad_pic) VALUES(? ,? ,?, ?, ?, ?)";
			
	public static void main(String[] args) {
		
		
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(Util.DRIVER);
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
			pstmt = con.prepareStatement(SQL);

			pstmt.setInt(1, 4);
			pstmt.setByte(2, (byte) 1);
			pstmt.setInt(3, 7);
			pstmt.setString(4, "中南部");
			pstmt.setString(5, "為你解決居家大小事");
			byte[] pic = getPictureByteArray("src/main/webapp/images/ser/ad_pic/move.jpg");
			pstmt.setBytes(6, pic);
			

			pstmt.executeUpdate();

			System.out.println("新增成功");

		} catch (ClassNotFoundException ce) {
			System.out.println(ce);
		} catch (SQLException se) {
			System.out.println(se);
		} catch (IOException ie) {
			System.out.println(ie);
		} finally {
			// 依建立順序關閉資源 (越晚建立越早關閉)
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}
		}
	}

	// 使用byte[]方式
	public static byte[] getPictureByteArray(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		byte[] buffer = new byte[fis.available()];
		fis.read(buffer);
		fis.close();
		return buffer;
		
		
		
		
		
		
		
		
//		SerAdJDBCDAO dao = new SerAdJDBCDAO();

		// 新增 測試OK
//		SerAdVO ser1 = new SerAdVO();
//		ser1.setAdVdrID(5);
//		ser1.setAdStatus((byte) 1);
//		ser1.setAdSerClaID(1);
//		ser1.setAdDiSt("中部");
//		ser1.setAdTxt("中壢區中豐路一段一號");
//		ser1.setAdPic(null);
//		dao.insert(ser1);

		// 修改 測試ok
//		SerAdVO ser2 = new SerAdVO();
//		ser2.setAdVdrID(2);
//		ser2.setAdStatus((byte) 1);
//		ser2.setAdSerClaID(3);
//		ser2.setAdDiSt("北部");
//		ser2.setAdTxt("松山區松山路一段一號");
//		ser2.setAdPic(null);
//		dao.update(ser2);

		// 刪除 測試OK
//		dao.delete(5, 4);

//		//查詢 測試OK
//		SerAdVO ser3 = dao.findByPrimartKey(2, 3);
//		System.out.print(ser3.getAdVdrID());
//		System.out.print(ser3.getAdStatus());
//		System.out.print(ser3.getAdSerClaID());
//		System.out.print(ser3.getAdDiSt());
//		System.out.print(ser3.getAdTxt());
//		System.out.print(ser3.getAdPic());
//		
		// 查詢2 測試OK
//		List<SerAdVO> list = dao.getAll();
//		for (SerAdVO ser4 : list) {
//			System.out.print(ser4.getAdVdrID() + " ");
//			System.out.print(ser4.getAdStatus() + " ");
//			System.out.print(ser4.getAdSerClaID() + " ");
//			System.out.print(ser4.getAdDiSt() + " ");
//			System.out.print(ser4.getAdTxt() + " ");
//			System.out.print(ser4.getAdPic() + " ");
//		}

	}
}
