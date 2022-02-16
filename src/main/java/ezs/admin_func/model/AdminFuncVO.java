package ezs.admin_func.model;

import java.io.Serializable;

public class AdminFuncVO implements Serializable{
	private Integer funID;
	private String funName;
	
	public Integer getFunID() {
		return funID;
	}
	public void setFunID(Integer funID) {
		this.funID = funID;
	}
	public String getFunName() {
		return funName;
	}
	public void setFunName(String funName) {
		this.funName = funName;
	}


}
