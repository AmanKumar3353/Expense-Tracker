package com.expensetracker.service;

import java.math.BigDecimal;
import java.util.List;
import com.expensetracker.dao.IncomeDao;
import com.expensetracker.model.Income;
import org.springframework.stereotype.Service;

@Service
public class IncomeService {
    private final IncomeDao dao;
    public IncomeService(IncomeDao dao) { this.dao = dao; }
    public List<Income> getAll(long userId) { return dao.findAll(userId); }
    public BigDecimal total(long userId) { return dao.total(userId); }

    public void save(Income income) {
        if (income.getSource() == null || income.getSource().isBlank()
                || income.getAmount() == null
                || income.getAmount().compareTo(BigDecimal.ZERO) <= 0
                || income.getIncomeDate() == null) {
            throw new IllegalArgumentException("Enter an income source, valid amount and date.");
        }
        dao.save(income);
    }
}
