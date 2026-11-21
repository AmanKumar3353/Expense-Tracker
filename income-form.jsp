<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add income | ExpenseFlow</title><link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"></head><body>
<div class="app-shell"><aside class="sidebar">
<a class="brand" href="${pageContext.request.contextPath}/dashboard"><span class="brand-mark">₹</span><span>ExpenseFlow</span></a>
<div class="nav-label">Workspace</div><nav class="nav-links">
<a class="" href="${pageContext.request.contextPath}/dashboard"><span class="nav-icon">▦</span>Dashboard</a>
<a class="" href="${pageContext.request.contextPath}/expenses"><span class="nav-icon">↗</span>Expenses</a>
<a class="active" href="${pageContext.request.contextPath}/income"><span class="nav-icon">↙</span>Income</a></nav>
<div class="nav-label">Account</div><nav class="nav-links"><a href="${pageContext.request.contextPath}/logout"><span class="nav-icon">⇥</span>Logout</a></nav>
<div class="sidebar-bottom">PERSONAL FINANCE MANAGER<br>Stay on top of your money.</div></aside>
<div class="main-area"><header class="topbar"><div class="breadcrumb">Workspace&nbsp; / &nbsp;<strong>Add income</strong></div>
<div class="profile"><div class="avatar">₹</div><div><div class="profile-name"><c:out value="${user.name}"/></div><div class="profile-sub">Personal account</div></div></div></header>
<main class="content">
<div class="page-heading"><div><div class="eyebrow">MONEY RECEIVED</div><h1>Add income</h1><p>Record salary, scholarship, freelance payments or other income.</p></div></div>
<div class="panel form-panel"><div class="panel-head"><div><h2>Income information</h2><p>Enter the details of the money received.</p></div></div><div class="panel-body">
<c:if test="${not empty error}"><p class="error"><c:out value="${error}"/></p></c:if>
<form method="post" action="${pageContext.request.contextPath}/income/save"><div class="form-grid">
<div class="field full"><label>Income source</label><input type="text" name="source" maxlength="100" placeholder="e.g. Monthly salary" required></div>
<div class="field"><label>Amount (₹)</label><input type="number" name="amount" min="0.01" step="0.01" placeholder="0.00" required></div>
<div class="field"><label>Date received</label><input type="date" name="incomeDate" value="${today}" required></div></div>
<div class="form-actions"><button class="button" type="submit">Save income</button><a class="button light" href="${pageContext.request.contextPath}/income">Cancel</a></div></form></div></div></main></div></div></body></html>