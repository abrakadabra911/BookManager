<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<html>
<head>
    <title>Books Page</title>

    <style type="text/css">

        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-style: italic;
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #F4E482;
        }

        .editable {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #ffdab9;
        }

        .pg-normal {
            color: #000000;
            font-size: 15px;
            cursor: pointer;
            background: #D0B389;
            padding: 2px 4px 2px 4px;
        }

        .pg-selected {
            color: #fff;
            font-size: 15px;
            background: #000000;
            padding: 2px 4px 2px 4px;
        }
        /* add/edit Book block */
        .layer1 {
            background-color: #F4E482;
            padding: 5px; /* padding around text */
            float: left;
            width: 300px;
        }
        /* find Book block */
        .layer2 {
            background-color: #c0c0c0;
            padding: 5px; /* padding around text */
            width: 300px;
            float: left;
        }

    </style>

</head>

<body>
<a href="../../index.jsp">Back to main menu</a>

<h1 align="center">Book List</h1>

<c:if test="${!empty listBooks}">
    <table id="mypaggingtable" class=tg align="center">
        <tr>
            <th width="80">ID</th>
            <th width="120">Title</th>
            <th width="120">Description</th>
            <th width="120">Author</th>
            <th width="120">ISBN</th>
            <th width="120">Year</th>
            <th width="120">Read Already</th>
            <th>
                <div class="editable">Reading</div>
            </th>
            <th>
                <div class="editable">Editing</div>
            </th>
            <th>
                <div class="editable">Removing</div>
            </th>
        </tr>
        <c:forEach items="${listBooks}" var="book">
            <tr>
                <td>${book.id}</td>
                <td><a href="/bookdata/${book.id}" target="_blank">${book.bookTitle}</a></td>
                <td>${book.bookDescription}</td>
                <td>${book.bookAuthor}</td>
                <td>${book.bookISBN}</td>
                <td>${book.bookPrintYear}</td>
                <c:if test="${book.bookIsRead eq 0}">
                    <td>False</td>
                </c:if>
                <c:if test="${book.bookIsRead eq 1}">
                    <td>True</td>
                </c:if>
                <td><a href="<c:url value='/read/${book.id}'/>">Read</a></td>
                <td><a href="<c:url value='/edit/${book.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${book.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<div id="pageNavPosition" style="padding-top: 20px" align="center">
</div>

<script src="../../resources/js/paging_script.js"></script>  <%--connecting javascript file from SPECIAL localisation--%>

<br/>

<div class="layer1">
    <h2>add/edit Book</h2>

    <c:url var="addAction" value="/books/add"/>

    <form:form action="${addAction}" commandName="book">
        <table>
            <c:if test="${!empty book.bookTitle}">
                <tr>
                    <td>
                        <form:label path="id">
                            <spring:message text="ID"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="id" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="id"/>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td>
                    <form:label path="bookTitle">
                        <spring:message text="Title"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="bookTitle"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="bookDescription">
                        <spring:message text="Description"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="bookDescription"/>
                </td>
            </tr>
            <c:choose>
                <c:when test="${!empty book.bookTitle}">
                    <tr>
                        <td>
                            <form:label path="bookAuthor">
                                <spring:message text="Author"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="bookAuthor" readonly="true" disabled="true"/>
                            <form:hidden path="bookAuthor"/>
                        </td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td>
                            <form:label path="bookAuthor">
                                <spring:message text="Author"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="bookAuthor"/>
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
            <tr>
                <td>
                    <form:label path="bookISBN">
                        <spring:message text="ISBN"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="bookISBN"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="bookPrintYear">
                        <spring:message text="Year"/>
                    </form:label>
                </td>
                <td>
                    <form:input type="number" step="1" min="0" max="2100" path="bookPrintYear"/>
                </td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td colspan="2">
                    <c:if test="${!empty book.bookTitle}">
                        <c:set var="bookIsRead" value="0"/>
                        <input type="submit"
                               value="<spring:message text="Edit Book"/>"/>
                    </c:if>
                    <c:if test="${empty book.bookTitle}">
                        <input type="submit"
                               value="<spring:message text="Add Book"/>"/>
                    </c:if>
                </td>
            </tr>
        </table>
    </form:form>
</div>


<div class="layer2">
    <h2>find Book</h2>
    <form action="books/filtering" method="POST">
        <table>
            <tr>
                <td>Title</td>
                <td>
                    <label for="title"></label>
                    <input name="title" type="text" id="title"/>
                </td>
            </tr>
            <tr>
                <td>Author</td>
                <td>
                    <label for="author"></label>
                    <input name="author" type="text" id="author"/>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><input type="submit" name="button" value="Search"/></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
