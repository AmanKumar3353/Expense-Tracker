PERSONAL EXPENSE TRACKER - SETUP GUIDE
======================================

TECHNOLOGIES
------------
Java 17, Spring MVC 6, Servlet 6, JSP 3.1, JSTL 3, JDBC,
MySQL 8, Maven, Apache Tomcat 10.1, Java Swing.

IMPORTANT COMPATIBILITY NOTE
----------------------------
This project uses Jakarta packages (jakarta.servlet.*), so use Tomcat 10.1.
Do not use Tomcat 9 with this project. Tomcat 9 uses the older javax APIs.

STEP 1 - INSTALL SOFTWARE
-------------------------
1. Install JDK 17.
2. Install Eclipse IDE for Enterprise Java and Web Developers.
3. Install Apache Tomcat 10.1 and extract it.
4. Install MySQL Server and MySQL Workbench.
5. Maven support is included in Eclipse. No separate Maven installation is
   needed when using Eclipse's embedded Maven integration.

STEP 2 - CREATE DATABASE
------------------------
1. Start MySQL Server.
2. Open MySQL Workbench and connect to localhost.
3. Open database/expense_tracker.sql.
4. Execute the whole script.
5. In src/main/resources/db.properties, change:
       db.password=YOUR_MYSQL_PASSWORD
   to your actual local MySQL password.

STEP 3 - IMPORT INTO ECLIPSE
----------------------------
1. Extract ExpenseTracker.zip.
2. Open Eclipse.
3. Choose File > Import > Maven > Existing Maven Projects.
4. Browse to the extracted ExpenseTracker folder.
5. Select the pom.xml and click Finish.
6. Right-click the project > Maven > Update Project.
7. Set project JRE to Java 17:
   Project > Properties > Java Build Path > Libraries.
8. In Eclipse Servers view, add Apache Tomcat v10.1 and point to the
   extracted Tomcat directory.

STEP 4 - RUN THE WEB APPLICATION
--------------------------------
1. Right-click project > Run As > Run on Server.
2. Select Tomcat v10.1 and click Finish.
3. Open:
   http://localhost:8080/ExpenseTracker/
4. Register a new account, then log in.
5. Add income and expenses from the dashboard.

Servlet test:
   http://localhost:8080/ExpenseTracker/health

If your Tomcat uses another port, replace 8080 with that port.

STEP 5 - RUN THE SWING APPLICATION
----------------------------------
1. Open SwingExpenseTracker.java in Eclipse.
2. Change DB_PASSWORD in that file to your MySQL password.
3. Right-click the file > Run As > Java Application.
4. Use the numeric user ID from the users table in MySQL Workbench.
   For a first test, run:
       SELECT id, name, email FROM expense_tracker.users;
5. Add an expense in the desktop window.

The Swing app and web app use the same MySQL tables. The Swing app is a
simple demonstration client. It does not yet have its own login screen.

COMMON ERRORS
-------------
1. Access denied for user:
   Check db.username and db.password in db.properties. Also update
   DB_USER and DB_PASSWORD in SwingExpenseTracker.java.

2. Unknown database expense_tracker:
   Execute database/expense_tracker.sql in MySQL Workbench.

3. HTTP 404:
   Confirm the app context path is /ExpenseTracker and Tomcat is started.

4. Servlet class not found / javax.servlet errors:
   Use Tomcat 10.1 and Java 17. This project uses jakarta.servlet.

5. JSP tag library error:
   Confirm Maven dependencies downloaded. Right-click project >
   Maven > Update Project, then Project > Clean.

6. Port 8080 already in use:
   In Eclipse Servers view, double-click Tomcat and change its HTTP port.

PROJECT MODULES
---------------
- AuthController: registration, login and logout.
- DashboardController: totals and recent expenses.
- ExpenseController: add, list, edit and delete expenses.
- IncomeController: add and list income.
- DAO classes: SQL database operations through JdbcTemplate.
- Service classes: validation and application logic.
- HealthCheckServlet: a simple servlet endpoint.
- SwingExpenseTracker: desktop client.

SECURITY / COLLEGE PROJECT NOTE
-------------------------------
Passwords in the web application are hashed using PBKDF2. This is a learning
project, not a production-ready financial application. Before public hosting,
add CSRF protection, stronger session controls, server-side authorization
filters, input/output hardening, and production database credentials.
