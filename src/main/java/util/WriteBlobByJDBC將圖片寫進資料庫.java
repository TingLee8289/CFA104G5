package util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class WriteBlobByJDBC將圖片寫進資料庫 {

	public static final String URLheader = "src/main/webapp/NoData/";

	public static void main(String[] args) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(Util.DRIVER);
			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);

			// 請先到SQL下指令找出你的PIC欄位

			pstmt = con.prepareStatement("UPDATE sec_pics SET sh_pic = ? WHERE sh_pic_id = ? ");

			File file = new File("src/main/webapp/images/sec/sh_pic/");
			File[] listFile = file.listFiles();
			for (int i = 0; i < file.listFiles().length; i++) {
				String url = listFile[i].toString();
				System.out.println(url);
				// 2. setBytes 萬用做法
				byte[] pic = getPictureByteArray(url);
				pstmt.setBytes(1, pic);
				pstmt.setInt(2, i+1);
				pstmt.executeUpdate();
			}

			System.out.println("二手商品圖片新增成功");
			
			pstmt = con.prepareStatement("UPDATE Member SET mem_Headshot = ? WHERE mem_ID = ? ");

			File file2 = new File("src/main/webapp/images/cmn/member_pic/");
			File[] listFile2 = file2.listFiles();
			for (int i = 0; i < file2.listFiles().length; i++) {
				String url = listFile2[i].toString();
				System.out.println(url);
				byte[] pic = getPictureByteArray(url);
				pstmt.setBytes(1, pic);
				pstmt.setInt(2, i+1);
				pstmt.executeUpdate();
			}
      System.out.println("會員頭相新增成功");


			// 請先到SQL下指令找出你的PIC欄位
			pstmt = con.prepareStatement("UPDATE CFA104G5.REN_LISTING_PIC SET LSP_LIS_ID = ?, LSP_PIC = ? WHERE LSP_ID = ?");


			File file1 = new File("src/main/webapp/images/ren/listingPic/");
			File[] listFile1 = file1.listFiles();
			for (int i = 0; i < file1.listFiles().length; i++) {
				String url = listFile1[i].toString();
				System.out.println(url);
				// 2. setBytes 萬用做法
				byte[] pic = getPictureByteArray(url);
				pstmt.setBytes(2, pic);
				pstmt.setInt(1, i + 1);
				pstmt.setInt(3, i + 1);
				pstmt.executeUpdate();
			}

			System.out.println("房源圖片新增成功");

			pstmt = con.prepareStatement("UPDATE `CFA104G5`.`REN_LANDLORD` SET LDD_PIC = ? WHERE LDD_ID = ?");

			File file3 = new File("src/main/webapp/images/ren/landlordPic/");
			File[] listFile3 = file3.listFiles();
			for (int i = 0; i < file3.listFiles().length; i++) {
				String url = listFile3[i].toString();
				System.out.println(url);
				// 2. setBytes 萬用做法
				byte[] pic = getPictureByteArray(url);
				pstmt.setBytes(1, pic);
				pstmt.setInt(2, i + 1);
				pstmt.executeUpdate();
			}

			System.out.println("房東圖片新增成功");

			pstmt = con.prepareStatement("UPDATE `CFA104G5`.`REN_LEASE` SET LSE_PIC = ? WHERE LSE_ID = ?");

			File file4 = new File("src/main/webapp/images/ren/leasePic/");
			File[] listFile4 = file4.listFiles();
			for (int i = 0; i < file4.listFiles().length; i++) {
				String url = listFile4[i].toString();
				System.out.println(url);
				// 2. setBytes 萬用做法
				byte[] pic = getPictureByteArray(url);
				pstmt.setBytes(1, pic);
				pstmt.setInt(2, i + 1);
				pstmt.executeUpdate();
			}

			System.out.println("租賃合約圖片新增成功");

			pstmt = con.prepareStatement("UPDATE `CFA104G5`.`SER_VDR` SET VDR_PIC = ? WHERE VDR_ID = ?");

			File file5 = new File("src/main/webapp/images/ser/ser_vdr/");
			File[] listFile5 = file5.listFiles();
			for (int i = 0; i < file5.listFiles().length; i++) {
				String url = listFile5[i].toString();
				System.out.println(url);
				// 2. setBytes 萬用做法
				byte[] pic = getPictureByteArray(url);
				pstmt.setBytes(1, pic);
				pstmt.setInt(2, i + 1);
				pstmt.executeUpdate();
			}
			System.out.println("廠商圖片新增成功");

			pstmt = con.prepareStatement("UPDATE `CFA104G5`.`SER_DMD` SET DMD_PIC = ? WHERE DMD_ID = ?");

			File file6 = new File("src/main/webapp/images/ser/ser_dmd/");
			File[] listFile6 = file6.listFiles();
			for (int i = 0; i < file6.listFiles().length; i++) {
				String url = listFile6[i].toString();
				System.out.println(url);
				// 2. setBytes 萬用做法
				byte[] pic = getPictureByteArray(url);
				pstmt.setBytes(1, pic);
				pstmt.setInt(2, i + 1);
				pstmt.executeUpdate();
			}
			System.out.println("需求單圖片新增成功");

		} catch (ClassNotFoundException ce) {
			System.out.println(ce);
		} catch (SQLException se) {
			System.out.println(se);
		} catch (IOException ie) {
			System.out.println(ie);
		} finally {
			Util.closeResource(con, pstmt, rs);
		}
	}

	// 使用byte[]方式
	public static byte[] getPictureByteArray(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		byte[] buffer = new byte[fis.available()];// 資料流有多少byte資料
		fis.read(buffer);
		fis.close();
		return buffer;
	}
}