<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dashboard | ExpenseFlow</title><link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"></head><body>
<div class="app-shell"><aside class="sidebar">
<a class="brand" href="${pageContext.request.contextPath}/dashboard"><span class="brand-mark">₹</span><span>ExpenseFlow</span></a>
<div class="nav-label">Workspace</div><nav class="nav-links">
<a class="active" href="${pageContext.request.contextPath}/dashboard"><span class="nav-icon">▦</span>Dashboard</a>
<a class="" href="${pageContext.request.contextPath}/expenses"><span class="nav-icon">↗</span>Expenses</a>
<a class="" href="${pageContext.request.contextPath}/income"><span class="nav-icon">↙</span>Income</a></nav>
<div class="nav-label">Account</div><nav class="nav-links"><a href="${pageContext.request.contextPath}/logout"><span class="nav-icon">⇥</span>Logout</a></nav>
<div class="sidebar-bottom">PERSONAL FINANCE MANAGER<br>Stay on top of your money.</div></aside>
<div class="main-area"><header class="topbar"><div class="breadcrumb">Workspace&nbsp; / &nbsp;<strong>Dashboard</strong></div>
<div class="profile"><div class="avatar">₹</div><div><div class="profile-name"><c:out value="${user.name}"/></div><div class="profile-sub">Personal account</div></div></div></header>
<main class="content">
<div class="page-heading"><div><div class="eyebrow">YOUR FINANCIAL OVERVIEW</div><h1>Welcome back, <c:out value="${user.name}"/> 👋</h1><p>Here's what's happening with your money today.</p></div><a class="button" href="${pageContext.request.contextPath}/expenses/add">＋ Add expense</a></div>
<section class="stats-grid">
<article class="stat-card"><div class="stat-top"><span>Total income</span><span class="stat-icon green">↙</span></div><div class="stat-value">₹ <c:out value="${totalIncome}"/></div><div class="stat-note">All recorded income</div></article>
<article class="stat-card"><div class="stat-top"><span>Total expenses</span><span class="stat-icon orange">↗</span></div><div class="stat-value">₹ <c:out value="${totalExpenses}"/></div><div class="stat-note">All recorded spending</div></article>
<article class="stat-card"><div class="stat-top"><span>Available balance</span><span class="stat-icon purple">◈</span></div><div class="stat-value">₹ <c:out value="${balance}"/></div><div class="stat-note"><strong>Keep it balanced</strong> · Income minus expenses</div></article></section>
<section class="dashboard-grid"><div class="panel"><div class="panel-head"><div><h2>Recent transactions</h2><p>Your latest recorded expenses</p></div><a class="button light" href="${pageContext.request.contextPath}/expenses">View all</a></div>
<div class="table-wrap"><table><thead><tr><th>Date</th><th>Description</th><th>Category</th><th>Amount</th></tr></thead><tbody>
<c:forEach items="${recentExpenses}" var="e"><tr><td><c:out value="${e.expenseDate}"/></td><td><strong><c:out value="${e.title}"/></strong></td><td><span class="category-pill"><c:out value="${e.category}"/></span></td><td class="amount">− ₹ <c:out value="${e.amount}"/></td></tr></c:forEach>
<c:if test="${empty recentExpenses}"><tr><td colspan="4"><div class="empty-state"><div class="empty-icon">🧾</div><strong>No expenses yet</strong><br>Add your first expense to see it here.</div></td></tr></c:if>
</tbody></table></div></div><div class="panel"><div class="panel-head"><div><h2>Quick actions</h2><p>Manage your money faster</p></div></div><div class="panel-body quick-actions">
<a class="quick-action" href="${pageContext.request.contextPath}/expenses/add"><span class="qa-icon">＋</span><span><strong>Add an expense</strong><small>Record a new payment</small></span><span class="arrow">›</span></a>
<a class="quick-action" href="${pageContext.request.contextPath}/income/add"><span class="qa-icon">↙</span><span><strong>Add income</strong><small>Record money received</small></span><span class="arrow">›</span></a>
<a class="quick-action" href="${pageContext.request.contextPath}/expenses"><span class="qa-icon">▤</span><span><strong>All expenses</strong><small>Review and manage spending</small></span><span class="arrow">›</span></a>
</div></div></section></main></div></div></body></html>