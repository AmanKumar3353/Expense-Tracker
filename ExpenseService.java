package com.expensetracker.service;

import java.math.BigDecimal;
import java.util.List;
import com.expensetracker.dao.ExpenseDao;
import com.expensetracker.model.Expense;
import org.springframework.stereotype.Service;

@Service
public class ExpenseService {
    private final ExpenseDao dao;
    public ExpenseService(ExpenseDao dao) { this.dao = dao; }

    public List<Expense> getAll(long userId) { return dao.findAll(userId); }
    public Expense get(long id, long userId) { return dao.findById(id, userId); }
    public BigDecimal total(long userId) { return dao.total(userId); }

    public void save(Expense e) {
        validate(e);
        if (e.getId() == 0) dao.save(e); else dao.update(e);
    }

    public void delete(long id, long userId) { dao.delete(id, userId); }

    private void validate(Expense e) {
        if (e.getTitle() == null || e.getTitle().isBlank()
                || e.getCategory() == null || e.getCategory().isBlank()
                || e.getAmount() == null || e.getAmount().compareTo(BigDecimal.ZERO) <= 0
                || e.getExpenseDate() == null) {
            throw new IllegalArgumentException("Enter a title, category, valid amount and date.");
        }
    }
}
