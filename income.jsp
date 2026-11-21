<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Income | ExpenseFlow</title><link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"></head><body>
<div class="app-shell"><aside class="sidebar">
<a class="brand" href="${pageContext.request.contextPath}/dashboard"><span class="brand-mark">₹</span><span>ExpenseFlow</span></a>
<div class="nav-label">Workspace</div><nav class="nav-links">
<a class="" href="${pageContext.request.contextPath}/dashboard"><span class="nav-icon">▦</span>Dashboard</a>
<a class="" href="${pageContext.request.contextPath}/expenses"><span class="nav-icon">↗</span>Expenses</a>
<a class="active" href="${pageContext.request.contextPath}/income"><span class="nav-icon">↙</span>Income</a></nav>
<div class="nav-label">Account</div><nav class="nav-links"><a href="${pageContext.request.contextPath}/logout"><span class="nav-icon">⇥</span>Logout</a></nav>
<div class="sidebar-bottom">PERSONAL FINANCE MANAGER<br>Stay on top of your money.</div></aside>
<div class="main-area"><header class="topbar"><div class="breadcrumb">Workspace&nbsp; / &nbsp;<strong>Income</strong></div>
<div class="profile"><div class="avatar">₹</div><div><div class="profile-name"><c:out value="${user.name}"/></div><div class="profile-sub">Personal account</div></div></div></header>
<main class="content">
<div class="page-heading"><div><div class="eyebrow">MONEY IN</div><h1>My income</h1><p>See the money coming into your account.</p></div><a class="button" href="${pageContext.request.contextPath}/income/add">＋ Add income</a></div>
<div class="panel"><div class="panel-head"><div><h2>Income history</h2><p>Your recorded sources of income</p></div></div><div class="table-wrap"><table><thead><tr><th>Date</th><th>Source</th><th>Amount</th></tr></thead><tbody>
<c:forEach items="${incomes}" var="i"><tr><td><c:out value="${i.incomeDate}"/></td><td><strong><c:out value="${i.source}"/></strong></td><td class="amount" style="color:#16a879">＋ ₹ <c:out value="${i.amount}"/></td></tr></c:forEach>
<c:if test="${empty incomes}"><tr><td colspan="3"><div class="empty-state"><div class="empty-icon">💰</div><strong>No income records yet</strong><br>Add your income to get a complete financial picture.</div></td></tr></c:if></tbody></table></div></div></main></div></div></body></html>