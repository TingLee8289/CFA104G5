package ezs.sec_items.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class SecItem implements Serializable {
	private static final long serialVersionUID = 1L;

	public SecItem() {
		shID = 0;
		shName = "";
		shPrice = new BigDecimal(0);
		shQTY = 0;
	}

	private Integer shID;
	private String shName;
	private BigDecimal shPrice;
	private Integer shQTY;

	public Integer getShID() {
		return shID;
	}

	public void setShID(Integer shID) {
		this.shID = shID;
	}

	public String getShName() {
		return shName;
	}

	public void setShName(String shName) {
		this.shName = shName;
	}

	public BigDecimal getShPrice() {
		return shPrice;
	}

	public void setShPrice(BigDecimal shPrice) {
		this.shPrice = shPrice;
	}

	public Integer getShQTY() {
		return shQTY;
	}

	public void setShQTY(Integer shQTY) {
		this.shQTY = shQTY;
	}

	@Override
	public String toString() {
		return "SecItem [shID=" + shID + ", shName=" + shName + ", shPrice=" + shPrice + ", shQTY=" + shQTY + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((shID == null) ? 0 : shID.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SecItem other = (SecItem) obj;
		if (shID == null) {
			if (other.shID != null)
				return false;
		} else if (!shID.equals(other.shID))
			return false;
		return true;
	}

}
