package org.xdemo.example.SpringActivemq.utils;


public class BaseResponse implements java.io.Serializable{
	
	private static final long serialVersionUID = -7762509511351276580L;

	private String returnCode;
	
	private String returnMessage;
	
	private Object returnObject;

	public BaseResponse(){}
	
	public BaseResponse(String returnCode){
		this.returnCode = returnCode;
	}
	
	public BaseResponse(String returnCode, Object returnObject) {
		this.returnCode = returnCode;
		this.returnObject = returnObject;
	}
	
	public BaseResponse(String returnCode, String returnMessage, Object returnObject) {
		this.returnCode = returnCode;
		this.returnMessage = returnMessage;
		this.returnObject = returnObject;
	}

	public String getReturnCode() {
		return returnCode;
	}

	public BaseResponse setReturnCode(String returnCode) {
		this.returnCode = returnCode;
		return this;
	}

	public String getReturnMessage() {
		return returnMessage;
	}

	public void setReturnMessage(String returnMessage) {
		this.returnMessage = returnMessage;
	}

	public Object getReturnObject() {
		return returnObject;
	}

	public void setReturnObject(Object returnObject) {
		this.returnObject = returnObject;
	}

}
