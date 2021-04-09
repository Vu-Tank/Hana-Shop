/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuha.dtos;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class PaymentDTO implements Serializable{
    private String paymentID;
    private String payName;

    public PaymentDTO() {
    }

    public PaymentDTO(String paymentID, String payName) {
        this.paymentID = paymentID;
        this.payName = payName;
    }

    public String getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(String paymentID) {
        this.paymentID = paymentID;
    }

    public String getPayName() {
        return payName;
    }

    public void setPayName(String payName) {
        this.payName = payName;
    }
}
