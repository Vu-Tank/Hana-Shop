<%-- 
    Document   : shopinghistory
    Created on : Jan 19, 2021, 1:33:24 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History Page</title>
    </head>
    <body>
        <div style="text-align: center">
            <a href="MainController?btnAction=View Product" style="text-decoration: none;margin-right: 20px" >Home</a>
            <a href="MainController?btnAction=LogOut" style="text-decoration: none;margin-right: 20px" >LogOut</a>
        </div>
    <c:choose>
        <c:when test="${not empty sessionScope.USER}">
            <h3 style="text-align: center">Hello <font style="color: blue">${sessionScope.USER.userName}</font></h3>                
            <c:set var="historyCart" value="${sessionScope.HISTORY}"/>
            <table border="0">
                <thead>
                    <tr>
                        <th>Date(dd/MM/yyyy)</th>
                        <th>Name</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                <form action="MainController">
                    <tr>
                        <td> <input type="text" name="txtOrderDate" value="${param.txtOrderDate}" /> </td>
                        <td> <input type="text" name="txtOrderSearch" value="${param.txtOrderSearch}" /> </td>
                        <td>
                            <input type="hidden" name="btnAction" value="Shopping history" />
                            <input type="submit" value="Search" /> 
                        </td>
                    </tr>
                </form>
                <tr>
                    <td><font style="color: red"/>${DATEERROR}</td>
                    <td></td>
                    <td></td>
                </tr>
                </tbody>
            </table>
            <c:choose>
                <c:when test="${historyCart!=null && historyCart.size()>0}">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Total price</th>
                                <th>Order date</th>
                                <th>Payment</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="cartH" items="${historyCart}">
                            <form action="MainController">
                                <tr>
                                    <td>${cartH.orderID}</td>
                                    <td>${cartH.price} VND</td>
                                    <td>${cartH.orderDate}</td>
                                    <td>
                                <c:forEach var="payment" items="${sessionScope.PAYMENTS}">
                                    <c:if test="${payment.paymentID eq cartH.paymentID}">
                                        ${payment.payName}
                                    </c:if>
                                </c:forEach>
                                </td>
                                <td>
                                    <input type="hidden" name="txtOrderDate" value="${param.txtOrderDate}" />
                                    <input type="hidden" name="txtOrderSearch" value="${param.txtOrderSearch}" /> 
                                    <input type="hidden" name="txtOrderID" value="${cartH.orderID}" />
                                    <input type="hidden" name="btnAction" value="Shopping history" />
                                    <input type="submit" value="View"  />
                                </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                    <c:if test="${orderDetais!=null}">
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="product" items="${orderDetais}">
                                <tr>
                                    <td>${product.productName}</td>
                                    <td>${product.price} VND</td>
                                    <td>${product.quantity}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </c:if>
                </c:when>
                <c:otherwise>
                    <h5>No order</h5>
                </c:otherwise>
            </c:choose>
        </c:when>
        <c:otherwise>
            <h1> <font style="color: red">You are not authorized to perform this action</font> </h1>
            <a href="MainController?btnAction=LogOut">Login</a>
        </c:otherwise>
    </c:choose>
</body>
</html>
