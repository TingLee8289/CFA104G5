package ezs.chat.model;

import java.util.List;

public class ChatService {

	private ChatDAO_interface dao;

	public ChatService() {
		dao = new ChatDAO();
	}

	public ChatVO addChat(Integer chatFromMemId, Integer chatToMemId, String chatContent, java.sql.Timestamp chatTime,
			byte[] chatImages) {

		ChatVO chatVO = new ChatVO();

		chatVO.setChatFromMemId(chatFromMemId);
		chatVO.setChatToMemId(chatToMemId);
		chatVO.setChatContent(chatContent);
		chatVO.setChatTime(chatTime);
		chatVO.setChatImages(chatImages);
		dao.insert(chatVO);

		return chatVO;
	}

	public ChatVO updateChat(Integer chatMsgId, Integer chatFromMemId, Integer chatToMemId, String chatContent,
			java.sql.Timestamp chatTime, byte[] chatImages) {

		ChatVO chatVO = new ChatVO();

		chatVO.setChatMsgId(chatMsgId);
		chatVO.setChatFromMemId(chatFromMemId);
		chatVO.setChatToMemId(chatToMemId);
		chatVO.setChatContent(chatContent);
		chatVO.setChatTime(chatTime);
		chatVO.setChatImages(chatImages);
		dao.update(chatVO);

		return chatVO;
	}
	
	public void deleteChat(Integer chatMsgId) {
		dao.delete(chatMsgId);
	}
	
	public ChatVO getOneChat(Integer chatMsgId) {
		return dao.findByPK(chatMsgId);
	}
	
	public List<ChatVO> getAll(){
		return dao.getAll();
	}

}
