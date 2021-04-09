<%-- 
    Document   : viewproducts
    Created on : Jan 19, 2021, 1:35:22 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
    </head>
    <body>
        <h1 style="text-align: center">Welcome Hana Shop</h1>
        <c:if test="${sessionScope.USER!=null}">
            <h5 style="text-align: center">Hello <font style="color: green">${sessionScope.USER.userName}</font></h5>
            <div class="action" style="text-align: center">
                <a href="MainController?btnAction=LogOut" style="text-decoration: none;margin-right: 20px">Log Out</a>
                <c:set var="roleUS" scope="page" value="US"></c:set>
                <c:if test="${sessionScope.USER.roleID eq roleUS}">
                    <a href="MainController?btnAction=ViewCart" style="text-decoration: none;margin-right: 20px">View Cart</a>
                    <a href="MainController?btnAction=Shopping history" style="text-decoration: none;margin-right: 20px">Shopping history</a>
                </c:if>
                <c:set var="roleAD" scope="page" value="AD"></c:set>
                <c:if test="${sessionScope.USER.roleID eq roleAD}"><a href="MainController?btnAction=adminMode" style="text-decoration: none">Admin mode</a></c:if>
                </div>
        </c:if>
        <c:if test="${sessionScope.USER==null}">
            <div style="text-align: center"><a href="login.jsp" style="text-decoration: none">Login</a></div>
        </c:if>

        <table border="0" style="margin-left: auto;margin-right: auto">
            <thead>
                <tr>
                    <th>Category</th>
                    <th>Name</th>
                    <th>Min</th>
                    <th>Max</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            <form action="MainController">
                <tr>
                    <td>
                        <select name="cbxCategory">
                            <option value="all">All</option>
                            <c:forEach var="category" items="${sessionScope.CATEGORYS}">
                                <c:choose>
                                    <c:when test="${pageScope.category.categoryID eq requestScope.cbxCategory}">
                                        <option value="${pageScope.category.categoryID}" selected="">${pageScope.category.categoryName}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${pageScope.category.categoryID}" >${pageScope.category.categoryName}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>                                
                    </td>
                    <td>
                        <input type="text" name="txtSearch" value="${param.txtSearch}" />
                    </td>
                    <td>
                        <input type="number" name="txtMin" value="${param.txtMin}" min="0"/>
                    </td>
                    <td>
                        <input type="number" name="txtMax" value="${param.txtMax}" mix="0" />
                    </td>
                    <td>
                        <input type="submit" value="Search" name="btnAction" />
                    </td>
                </tr>
            </form>
        </tbody>
    </table>

    <h1> <font style="color: red">${requestScope.MESSAGE}</font> </h1>
    <table border="0">
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Product Image</th>
                <th style="width: 600px">Description</th>
                <th style="width: 200px">Price</th>
                <th style="width: 100px">Create Date</th>
                <th style="width: 100px">Category</th>
                <th style="width: 100px">Quantity</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:set var="productCarts" value="${sessionScope.CART.getCart().values()}"></c:set>
            <c:forEach var="product" items="${sessionScope.PRODUCTS}">   
            <form action="MainController">
                <tr>                        
                    <td style="text-align: center">
                        ${product.productName}
                        <input type="hidden" name="productName" value="${product.productName}" />
                    </td>
                    <td><img src="image/${product.imageName}" style="width:200px ;height:200px"></img> </td>
                    <td style="width:  600px">${product.description}</td>
                    <td style="text-align: center">
                        ${product.price} VND
                        <input type="hidden" name="productPrice" value="${product.price}" />
                    </td>
                    <td style="text-align: center">${product.createDate}</td>
                    <td style="text-align: center">
                        <c:forEach var="category" items="${sessionScope.CATEGORYS}">
                            <c:if test="${product.caegoryID eq category.categoryID}">
                                ${category.categoryName}
                            </c:if>
                        </c:forEach>
                    </td>
                    <td style="text-align: center">
                        <c:set var="quantity" value="${product.quantity}"></c:set>
                        <c:forEach var="productCart" items="${productCarts}">
                            <c:if test="${product.productID eq productCart.productID}">
                                <c:set var="quantity" value="${product.quantity - productCart.quantity}"></c:set>
                            </c:if>
                        </c:forEach>
                        ${pageScope.quantity}
                    </td>
                    <td>
                        <input type="hidden" name="txtQuantityt" value="${quantity}" />
                        <input type="hidden" name="productID" value="${product.productID}" />       
                        <input type="submit" value="Add to cart" name="btnAction" />                                                                                                                      
                    </td>                        
                </tr> 
            </form>
        </c:forEach> 
    </tbody>
</table>
<div class="paging">
    <c:forEach begin="1" end="${endPage}" var="i">

        <c:url var="paging" value="MainController">
            <c:param name="btnAction" value="Search"></c:param>
            <c:param name="txtSearch" value="${txtSearch}"></c:param>
            <c:param name="txtMax" value="${txtMax}"></c:param>
            <c:param name="txtMin" value="${txtMin}"></c:param>
            <c:param name="cbxCategory" value="${cbxCategory}"></c:param>
            <c:param name="pageIndex" value="${i}"></c:param>
        </c:url>
        <a href="${paging}">${i}</a>
    </c:forEach>
</div>
</body>
</html>
