package com.expensetracker.swing;

import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDate;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;

/*
 * A small desktop client for the same expense_tracker database.
 * Update DB_PASSWORD before running this class.
 */
public class SwingExpenseTracker extends JFrame {
    private static final String DB_URL =
        "jdbc:mysql://localhost:3306/expense_tracker?useSSL=false&serverTimezone=Asia/Kolkata";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "YOUR_MYSQL_PASSWORD";

    private final JTextField userIdField = new JTextField("1");
    private final JTextField titleField = new JTextField();
    private final JTextField amountField = new JTextField();
    private final JComboBox<String> categoryBox =
        new JComboBox<>(new String[]{"Food", "Travel", "Shopping", "Bills", "Education", "Other"});
    private final JTextField dateField = new JTextField(LocalDate.now().toString());
    private final DefaultTableModel tableModel =
        new DefaultTableModel(new String[]{"ID", "Title", "Amount", "Category", "Date"}, 0);

    public SwingExpenseTracker() {
        setTitle("Personal Expense Tracker - Desktop");
        setSize(750, 500);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        JPanel form = new JPanel(new GridLayout(0, 2, 8, 8));
        form.add(new JLabel("User ID (from web registration)"));
        form.add(userIdField);
        form.add(new JLabel("Expense title"));
        form.add(titleField);
        form.add(new JLabel("Amount"));
        form.add(amountField);
        form.add(new JLabel("Category"));
        form.add(categoryBox);
        form.add(new JLabel("Date (yyyy-mm-dd)"));
        form.add(dateField);

        JButton addButton = new JButton("Add Expense");
        JButton refreshButton = new JButton("Refresh List");
        form.add(addButton);
        form.add(refreshButton);

        JTable table = new JTable(tableModel);
        add(form, BorderLayout.NORTH);
        add(new JScrollPane(table), BorderLayout.CENTER);

        addButton.addActionListener(e -> addExpense());
        refreshButton.addActionListener(e -> loadExpenses());
        loadExpenses();
    }

    private Connection connect() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    private long getUserId() {
        return Long.parseLong(userIdField.getText().trim());
    }

    private void addExpense() {
        try {
            long userId = getUserId();
            String title = titleField.getText().trim();
            BigDecimal amount = new BigDecimal(amountField.getText().trim());
            String category = (String) categoryBox.getSelectedItem();
            Date date = Date.valueOf(dateField.getText().trim());

            if (title.isEmpty() || amount.compareTo(BigDecimal.ZERO) <= 0) {
                JOptionPane.showMessageDialog(this, "Enter a title and an amount greater than zero.");
                return;
            }

            String sql = "INSERT INTO expenses(user_id,title,amount,category,expense_date) VALUES(?,?,?,?,?)";
            try (Connection con = connect(); PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setLong(1, userId);
                ps.setString(2, title);
                ps.setBigDecimal(3, amount);
                ps.setString(4, category);
                ps.setDate(5, date);
                ps.executeUpdate();
            }
            titleField.setText("");
            amountField.setText("");
            loadExpenses();
            JOptionPane.showMessageDialog(this, "Expense added.");
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this,
                "Could not add expense. Check the user ID, date and database settings.\n" + ex.getMessage());
        }
    }

    private void loadExpenses() {
        tableModel.setRowCount(0);
        try {
            String sql = "SELECT id,title,amount,category,expense_date FROM expenses WHERE user_id=? ORDER BY expense_date DESC";
            try (Connection con = connect(); PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setLong(1, getUserId());
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        tableModel.addRow(new Object[]{
                            rs.getLong("id"), rs.getString("title"), rs.getBigDecimal("amount"),
                            rs.getString("category"), rs.getDate("expense_date")
                        });
                    }
                }
            }
        } catch (Exception ex) {
            // The table remains empty until a valid database connection is available.
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new SwingExpenseTracker().setVisible(true));
    }
}
