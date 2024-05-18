package com.freshgarden.model;

public class PaymentDetails {
	
	private String paymentMethod;
	private String paymentStatus;
	private String paymentId;
	private String paypalPaymentLinkId;
	private String paypalPaymentLinkReferenceId;
	private String paypalPaymentLinkStatus;
	private String paypalPaymentId;
	
	public PaymentDetails() {
		// TODO Auto-generated constructor stub
	}
	
	public PaymentDetails(String paymentMethod, String paymentStatus, String paymentId, String paypalPaymentLinkId,
			String paypalPaymentLinkReferenceId, String paypalPaymentLinkStatus, String paypalPaymentId) {
		super();
		this.paymentMethod = paymentMethod;
		this.paymentStatus = paymentStatus;
		this.paymentId = paymentId;
		this.paypalPaymentLinkId = paypalPaymentLinkId;
		this.paypalPaymentLinkReferenceId = paypalPaymentLinkReferenceId;
		this.paypalPaymentLinkStatus = paypalPaymentLinkStatus;
		this.paypalPaymentId = paypalPaymentId;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	public String getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}
	public String getPaypalPaymentLinkId() {
		return paypalPaymentLinkId;
	}
	public void setPaypalPaymentLinkId(String paypalPaymentLinkId) {
		this.paypalPaymentLinkId = paypalPaymentLinkId;
	}
	public String getPaypalPaymentLinkReferenceId() {
		return paypalPaymentLinkReferenceId;
	}
	public void setPaypalPaymentLinkReferenceId(String paypalPaymentLinkReferenceId) {
		this.paypalPaymentLinkReferenceId = paypalPaymentLinkReferenceId;
	}
	public String getPaypalPaymentLinkStatus() {
		return paypalPaymentLinkStatus;
	}
	public void setPaypalPaymentLinkStatus(String paypalPaymentLinkStatus) {
		this.paypalPaymentLinkStatus = paypalPaymentLinkStatus;
	}
	public String getPaypalPaymentId() {
		return paypalPaymentId;
	}
	public void setPaypalPaymentId(String paypalPaymentId) {
		this.paypalPaymentId = paypalPaymentId;
	}
	
	
}
