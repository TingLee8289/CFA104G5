package ezs.chat.model;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.Serializable;
import java.sql.Timestamp;

public class ChatVO implements Serializable{

	private Integer chatMsgId;
	private Integer chatFromMemId;
	private Integer chatToMemId;
	private String chatContent;
	private Timestamp chatTime;
	private byte[] chatImages;
	
	public ChatVO() {
		super();
	}

	public Integer getChatMsgId() {
		return chatMsgId;
	}

	public void setChatMsgId(Integer chatMsgId) {
		this.chatMsgId = chatMsgId;
	}

	public Integer getChatFromMemId() {
		return chatFromMemId;
	}

	public void setChatFromMemId(Integer chatFromMemId) {
		this.chatFromMemId = chatFromMemId;
	}

	public Integer getChatToMemId() {
		return chatToMemId;
	}

	public void setChatToMemId(Integer chatToMemId) {
		this.chatToMemId = chatToMemId;
	}

	public String getChatContent() {
		return chatContent;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	public Timestamp getChatTime() {
		return chatTime;
	}

	public void setChatTime(Timestamp chatTime) {
		this.chatTime = chatTime;
	}
	
	public byte[] getChatImages() {
		return chatImages;
	}

	public void setChatImages(byte[] chatImages) {
		this.chatImages = chatImages;
	}

	
	
//	public void setChatImagesOut(byte[] chatImages) {
//		this.chatImages = chatImages;
//	}
//
//	public void setChatImages(String path) {
//		try {
//			if (path != null) {
//				byte[] pic = getPictureByteArray(path);
//				this.chatImages = pic;
//			} else {
//				this.chatImages = null;
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//	
//	public static byte[] getPictureByteArray(String path) throws IOException {
//		FileInputStream fis = new FileInputStream(path);
//		byte[] buffer = new byte[fis.available()];
//		fis.read(buffer);
//		fis.close();
//		return buffer;
//	}
}
