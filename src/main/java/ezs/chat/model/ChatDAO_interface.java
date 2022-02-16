package ezs.chat.model;

import java.util.List;

public interface ChatDAO_interface {
	public void insert(ChatVO chatVO);
	public void update(ChatVO chatVO);
	public void delete(Integer chatMsgId);
	public ChatVO findByPK(Integer chatMsgId);
	public List<ChatVO> getAll();

}
