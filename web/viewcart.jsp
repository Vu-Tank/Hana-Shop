<%-- 
    Document   : viewcart
    Created on : Jan 19, 2021, 1:34:25 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
    </head>
    <body>
    <c:set var="role" value="US" scope="page"/>
    <c:choose>            
        <c:when test="${not empty sessionScope.USER and sessionScope.USER.roleID eq role}">
            <h3 style="text-align: center">Hello <font style="color: blue">${sessionScope.USER.userName}</font></h3>
            <div style="text-align: center"><a href="MainController?btnAction=LogOut" style="text-decoration: none">LogOut</a></div>
            <c:set var="cart" value="${sessionScope.CART}"/>
            <c:choose>
                <c:when test="${cart!=null && cart.getCart().size()!=0}">
                    <h3>Your Cart</h3>
                    <h3> <font style="color: greenyellow">${requestScope.MESSAGE}</font> </h3>
                    <a href="viewproducts.jsp">Add more</a>
                    <table border="0">
                        <thead>
                            <tr>
                                <th>Product Name</th>
                                <th>Amount</th>
                                <th>Quantity</th>
                                <th>Total Price</th>
                                <th>Action</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:set var="total" value="${0}"></c:set>
                        <c:forEach var="product" items="${sessionScope.CART.getCart().values()}">                       
                            <tr>
                            <form action="MainController">
                                <td style="text-align: center; width: 200px">${product.productName}</td>
                                <td style="text-align: center; width: 200px">${product.price} VND</td>
                                <td style="text-align: center; width: 200px">
                                    <input type="number" name="txtQuantity" value="${product.quantity}" max="999999999"/>                                    
                                </td>
                                <td style="text-align: right; width: 200px">${product.price * product.quantity} VND</td>
                                <c:set var="total" value="${total+ product.price * product.quantity}"></c:set>
                                <td style="text-align: center; width: 300px">
                                    <input type="hidden" name="txtProductID" value="${product.productID}" />
                                    <input type="hidden" name="txtProductName" value="${product.productName}" />
                                    <input type="hidden" name="txtProductprice" value="${product.price}" />
                                    <input type="hidden" name="btnAction" value="updateCart" />
                                    <input type="submit" value="Update" />
                                </td>
                            </form>
                            <form action="MainController">
                                <td style="text-align: center; width: 200px">
                                    <input type="hidden" name="txtProductID" value="${product.productID}" />
                                    <input type="hidden" name="btnAction" value="deleteCart" "/>
                                    <input type="submit" value="Delete" onclick="return confirm('Do you want to delete ?')"/>
                                </td>
                            </form>
                            </tr>

                        </c:forEach>
                        <tr>
                            <td colspan="3" style="text-align: center">Total</td>
                            <td style="text-align: right;width: 100px"><font style="">${total}</font> VND</td>
                        </tr>
                        </tbody>
                    </table>
                    <form action="MainController">
                        <select name="cbxPayment">
                            <c:forEach var="payment" items="${sessionScope.PAYMENTS}" >
                                <c:choose>
                                    <c:when test="${payment.paymentID eq cbxPayment}">
                                        <option value="${payment.paymentID}" selected="">${payment.payName}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${payment.paymentID}">${payment.payName}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                        <input type="submit" value="Pay Now" name="btnAction" />
                    </form>
                </c:when>
                <c:otherwise>
                    <h5>You have not bought any products</h5>
                    <form action="MainController">
                        <input type="submit" name="btnAction" value="View Product" />
                    </form>
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
