<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Expenses | ExpenseFlow</title><link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"></head><body>
<div class="app-shell"><aside class="sidebar">
<a class="brand" href="${pageContext.request.contextPath}/dashboard"><span class="brand-mark">₹</span><span>ExpenseFlow</span></a>
<div class="nav-label">Workspace</div><nav class="nav-links">
<a class="" href="${pageContext.request.contextPath}/dashboard"><span class="nav-icon">▦</span>Dashboard</a>
<a class="active" href="${pageContext.request.contextPath}/expenses"><span class="nav-icon">↗</span>Expenses</a>
<a class="" href="${pageContext.request.contextPath}/income"><span class="nav-icon">↙</span>Income</a></nav>
<div class="nav-label">Account</div><nav class="nav-links"><a href="${pageContext.request.contextPath}/logout"><span class="nav-icon">⇥</span>Logout</a></nav>
<div class="sidebar-bottom">PERSONAL FINANCE MANAGER<br>Stay on top of your money.</div></aside>
<div class="main-area"><header class="topbar"><div class="breadcrumb">Workspace&nbsp; / &nbsp;<strong>Expenses</strong></div>
<div class="profile"><div class="avatar">₹</div><div><div class="profile-name"><c:out value="${user.name}"/></div><div class="profile-sub">Personal account</div></div></div></header>
<main class="content">
<div class="page-heading"><div><div class="eyebrow">TRANSACTION HISTORY</div><h1>My expenses</h1><p>Keep track of where your money goes.</p></div><a class="button" href="${pageContext.request.contextPath}/expenses/add">＋ Add expense</a></div>
<div class="panel"><div class="panel-head"><div><h2>All expenses</h2><p>Your recorded spending activity</p></div></div><div class="table-wrap"><table><thead><tr><th>Date</th><th>Title</th><th>Category</th><th>Amount</th><th>Description</th><th>Actions</th></tr></thead><tbody>
<c:forEach items="${expenses}" var="e"><tr><td><c:out value="${e.expenseDate}"/></td><td><strong><c:out value="${e.title}"/></strong></td><td><span class="category-pill"><c:out value="${e.category}"/></span></td><td class="amount">₹ <c:out value="${e.amount}"/></td><td><c:out value="${e.description}"/></td><td class="action-cell"><a href="${pageContext.request.contextPath}/expenses/edit/${e.id}">Edit</a><form method="post" action="${pageContext.request.contextPath}/expenses/delete/${e.id}" onsubmit="return confirm('Delete this expense?');"><button class="link-button" type="submit">Delete</button></form></td></tr></c:forEach>
<c:if test="${empty expenses}"><tr><td colspan="6"><div class="empty-state"><div class="empty-icon">🧾</div><strong>No expenses found</strong><br>Your expenses will appear here after you add them.</div></td></tr></c:if></tbody></table></div></div></main></div></div></body></html>