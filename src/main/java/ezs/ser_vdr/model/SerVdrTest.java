package ezs.ser_vdr.model;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import util.Util;

public class SerVdrTest {

	// 測試上傳圖片
//	private static final String SQL = "INSERT INTO ser_vdr (vdr_id, vdr_status, vdr_name, vdr_tel ,vdr_vatno, vdr_county, vdr_dist, vdr_addr, vdr_open, vdr_intro, vdr_pic, vdr_rev_count, vdr_rev_score) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	public static void main(String[] args) {

//		Connection con = null;
//		PreparedStatement pstmt = null;
//
//		try {
//			Class.forName(Util.DRIVER);
//			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
//			pstmt = con.prepareStatement(SQL);
//
//			pstmt.setInt(1, 6);
//			pstmt.setByte(2, (byte) 1);
//			pstmt.setString(3, "Gwen02");
//			pstmt.setString(4, "0955690444");
//			pstmt.setString(5, "12345678");
//			pstmt.setString(6, "嘉義縣");
//			pstmt.setString(7, "嘉義市");
//			pstmt.setString(8, "文中路");
//			pstmt.setString(9, "8:00-17:00");
//			pstmt.setString(10, "你好");
//			byte[] pic = getPictureByteArray("src/main/webapp/images/ser/vdr_pic/vendor.png");
//			pstmt.setBytes(11, pic);
//			pstmt.setInt(12, 4);
//			pstmt.setInt(13, 4);
//
//			pstmt.executeUpdate();
//
//			System.out.println("新增成功");
//
//		} catch (ClassNotFoundException ce) {
//			System.out.println(ce);
//		} catch (SQLException se) {
//			System.out.println(se);
//		} catch (IOException ie) {
//			System.out.println(ie);
//		} finally {
//			// 依建立順序關閉資源 (越晚建立越早關閉)
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					System.out.println(se);
//				}
//			}
//
//			if (con != null) {
//				try {
//					con.close();
//				} catch (SQLException se) {
//					System.out.println(se);
//				}
//			}
//		}
//	}

	// 使用byte[]方式
//	public static byte[] getPictureByteArray(String path) throws IOException {
//		FileInputStream fis = new FileInputStream(path);
//		byte[] buffer = new byte[fis.available()];
//		fis.read(buffer);
//		fis.close();
//		return buffer;

		SerVdrDAO_interface dao = new SerVdrJDBCDAO();

		// 新增 測試OK
//		SerVdrVO ven = new SerVdrVO();
//		ven.setVdrID(10);
//		ven.setVdrStatus((byte) 1);
//		ven.setVdrName("吳永智");
//		ven.setVdrTel("0944789321");
//		ven.setVdrVatno(null);
//		ven.setVdrCounty("台北市");
//		ven.setVdrDist("松山區松山路");
//		ven.setVdrAddr("一段一號");
//		ven.setVdrOpen("8:00-18:00");
//		ven.setVdrIntro("你好");
//		ven.setVdrPic(null);
//		ven.setVdrRevCount(5);
//		ven.setVdrRevScore(5);
//		dao.insert(ven);

		// 修改 測試ok
//		SerVdrVO ven2 = new SerVdrVO();
//		ven2.setVdrID(5);
//		ven2.setVdrStatus((byte) 1);
//		ven2.setVdrName("郭惠民");
//		ven2.setVdrTel("0956789899");
//		ven2.setVdrVatno(null);
//		ven2.setVdrCounty("台北市");
//		ven2.setVdrDist("大安區");
//		ven2.setVdrAddr("忠孝西路一段");
//		ven2.setVdrOpen("09:00-18:00");
//		ven2.setVdrIntro("你好喔喔");
//		ven2.setVdrPic(null);
//		ven2.setVdrRevCount(5);
//		ven2.setVdrRevScore(5);
//		dao.update(ven2);

		// 刪除 測試ok
		dao.delete(2);

		// 查詢 測試OK
//		SerVdrVO ver3 =dao.findByPrimaryKey(2);
//		System.out.print(ver3.getVdrID()+" ");
//		System.out.print(ver3.getVdrStatus()+" ");
//		System.out.print(ver3.getVdrName()+" ");
//		System.out.print(ver3.getVdrTel()+" ");
//		System.out.print(ver3.getVdrVatno()+" ");
//		System.out.print(ver3.getVdrCounty()+" ");
//		System.out.print(ver3.getVdrDist()+" ");
//		System.out.print(ver3.getVDRAddr()+" ");
//		System.out.print(ver3.getVdrOpen()+" ");
//		System.out.print(ver3.getVdrIntro()+" ");
//		System.out.print(ver3.getVdrPic()+" ");
//		System.out.print(ver3.getVdrRevCount()+" ");
//		System.out.print(ver3.getVdrRevScore()+" ");

		// 查詢2 測試ok
//		List<SerVdrVO> list = dao.getAll();
//		for (SerVdrVO ver4 : list) {
//			System.out.print(ver4.getVdrID()+" ");
//			System.out.print(ver4.getVdrStatus()+" ");
//			System.out.print(ver4.getVdrName()+" ");
//			System.out.print(ver4.getVdrTel()+" ");
//			System.out.print(ver4.getVdrVatno()+" ");
//			System.out.print(ver4.getVdrCounty()+" ");
//			System.out.print(ver4.getVdrDist()+" ");
//			System.out.print(ver4.getVdrAddr()+" ");
//			System.out.print(ver4.getVdrOpen()+" ");
//			System.out.print(ver4.getVdrIntro()+" ");
//			System.out.print(ver4.getVdrPic()+" ");
//			System.out.print(ver4.getVdrRevCount()+" ");
//			System.out.print(ver4.getVdrRevScore()+" ");
//		}

	}

}
