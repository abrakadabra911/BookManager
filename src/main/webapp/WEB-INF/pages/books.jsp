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

        .layer1 {
            background-color: #F4E482; /* ???? ???? ???? */
            padding: 5px; /* ???? ?????? ?????? */
            float: left; /* ????????? ?? ??????? ???? */
            width: 300px; /* ?????? ???? */
        }
        .layer2 {
            background-color: #c0c0c0; /* ???? ???? ???? */
            padding: 5px; /* ???? ?????? ?????? */
            width: 300px; /* ?????? ???? */
            float: left; /* ????????? ?? ??????? ???? */
        }

    </style>

    <%-- <script src="paggingscript.js"></script>--%>
    <script type="text/javascript">

        function Pager(tableName, itemsPerPage) {
            this.tableName = tableName;
            this.itemsPerPage = itemsPerPage;
            this.currentPage = 1;
            this.pages = 0;
            this.inited = false;
            this.showRecords = function (from, to) {
                var rows = document.getElementById(tableName).rows;
// i starts from 1 to skip table header row
                for (var i = 1; i < rows.length; i++) {
                    if (i < from || i > to)
                        rows[i].style.display = 'none';
                    else
                        rows[i].style.display = '';
                }
            }
            this.showPage = function (pageNumber) {
                if (!this.inited) {
                    alert("not inited");
                    return;
                }
                var oldPageAnchor = document.getElementById('pg' + this.currentPage);
                oldPageAnchor.className = 'pg-normal';
                this.currentPage = pageNumber;
                var newPageAnchor = document.getElementById('pg' + this.currentPage);
                newPageAnchor.className = 'pg-selected';
                var from = (pageNumber - 1) * itemsPerPage + 1;
                var to = from + itemsPerPage - 1;
                this.showRecords(from, to);
            }
            this.prev = function () {
                if (this.currentPage > 1)
                    this.showPage(this.currentPage - 1);
            }
            this.next = function () {
                if (this.currentPage < this.pages) {
                    this.showPage(this.currentPage + 1);
                }
            }
            this.init = function () {
                var rows = document.getElementById(tableName).rows;
                var records = (rows.length - 1);
                this.pages = Math.ceil(records / itemsPerPage);
                this.inited = true;
            }
            this.showPageNav = function (pagerName, positionId) {
                if (!this.inited) {
                    alert("not inited");
                    return;
                }
                var element = document.getElementById(positionId);
                var pagerHtml = '<span onclick="' + pagerName + '.prev();" class="pg-normal"> « Prev </span> ';
                for (var page = 1; page <= this.pages; page++)
                    pagerHtml += '<span id="pg' + page + '" class="pg-normal" onclick="' + pagerName + '.showPage(' + page + ');">' + page + '</span> ';
                pagerHtml += '<span onclick="' + pagerName + '.next();" class="pg-normal"> Next »</span>';
                element.innerHTML = pagerHtml;
            }
        }
    </script>
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

<script type="text/javascript">
    var pager = new Pager('mypaggingtable', 10);
    pager.init();
    pager.showPageNav('pager', 'pageNavPosition');
    pager.showPage(1);
</script>

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

<form action="/books/filtering" method="POST">
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
