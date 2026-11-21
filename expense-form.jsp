<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Expense form | ExpenseFlow</title><link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"></head><body>
<div class="app-shell"><aside class="sidebar">
<a class="brand" href="${pageContext.request.contextPath}/dashboard"><span class="brand-mark">₹</span><span>ExpenseFlow</span></a>
<div class="nav-label">Workspace</div><nav class="nav-links">
<a class="" href="${pageContext.request.contextPath}/dashboard"><span class="nav-icon">▦</span>Dashboard</a>
<a class="active" href="${pageContext.request.contextPath}/expenses"><span class="nav-icon">↗</span>Expenses</a>
<a class="" href="${pageContext.request.contextPath}/income"><span class="nav-icon">↙</span>Income</a></nav>
<div class="nav-label">Account</div><nav class="nav-links"><a href="${pageContext.request.contextPath}/logout"><span class="nav-icon">⇥</span>Logout</a></nav>
<div class="sidebar-bottom">PERSONAL FINANCE MANAGER<br>Stay on top of your money.</div></aside>
<div class="main-area"><header class="topbar"><div class="breadcrumb">Workspace&nbsp; / &nbsp;<strong>Expense form</strong></div>
<div class="profile"><div class="avatar">₹</div><div><div class="profile-name"><c:out value="${user.name}"/></div><div class="profile-sub">Personal account</div></div></div></header>
<main class="content">
<div class="page-heading"><div><div class="eyebrow">SPENDING DETAILS</div><h1>${pageTitle}</h1><p>Add the details below to keep your records accurate.</p></div></div>
<div class="panel form-panel"><div class="panel-head"><div><h2>Expense information</h2><p>Complete the fields below.</p></div></div><div class="panel-body">
<c:if test="${not empty error}"><p class="error"><c:out value="${error}"/></p></c:if>
<form method="post" action="${pageContext.request.contextPath}/expenses/save"><input type="hidden" name="id" value="${expense.id}"><div class="form-grid">
<div class="field full"><label>Expense title</label><input type="text" name="title" maxlength="100" placeholder="e.g. Grocery shopping" value="<c:out value='${expense.title}'/>" required></div>
<div class="field"><label>Amount (₹)</label><input type="number" name="amount" min="0.01" step="0.01" placeholder="0.00" value="${expense.amount}" required></div>
<div class="field"><label>Category</label><select name="category" required><option value="">Choose category</option><option value="Food" <c:if test="${expense.category == 'Food'}">selected</c:if>>Food</option><option value="Travel" <c:if test="${expense.category == 'Travel'}">selected</c:if>>Travel</option><option value="Shopping" <c:if test="${expense.category == 'Shopping'}">selected</c:if>>Shopping</option><option value="Bills" <c:if test="${expense.category == 'Bills'}">selected</c:if>>Bills</option><option value="Education" <c:if test="${expense.category == 'Education'}">selected</c:if>>Education</option><option value="Health" <c:if test="${expense.category == 'Health'}">selected</c:if>>Health</option><option value="Other" <c:if test="${expense.category == 'Other'}">selected</c:if>>Other</option></select></div>
<div class="field full"><label>Date</label><input type="date" name="expenseDate" value="${expense.expenseDate}" required></div>
<div class="field full"><label>Description (optional)</label><textarea name="description" maxlength="255" placeholder="Add a note about this expense..."><c:out value="${expense.description}"/></textarea></div></div>
<div class="form-actions"><button class="button" type="submit">Save expense</button><a class="button light" href="${pageContext.request.contextPath}/expenses">Cancel</a></div></form></div></div></main></div></div></body></html>