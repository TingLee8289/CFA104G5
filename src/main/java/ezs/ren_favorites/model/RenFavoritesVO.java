package ezs.ren_favorites.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class RenFavoritesVO implements Serializable{
	
	private Integer favLisId;
	private Integer favMemId;
	private Timestamp favAddTime;
	
	public RenFavoritesVO() {
		super();
	}

	public Integer getFavLisId() {
		return favLisId;
	}

	public void setFavLisId(Integer favLisId) {
		this.favLisId = favLisId;
	}

	public Integer getFavMemId() {
		return favMemId;
	}

	public void setFavMemId(Integer favMemId) {
		this.favMemId = favMemId;
	}

	public Timestamp getFavAddTime() {
		return favAddTime;
	}

	public void setFavAddTime(Timestamp favAddTime) {
		this.favAddTime = favAddTime;
	}
}
