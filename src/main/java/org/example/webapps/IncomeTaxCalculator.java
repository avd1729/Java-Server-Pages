package org.example.webapps;

public class IncomeTaxCalculator {
    private double income;
    private double tax;

    public IncomeTaxCalculator() {
        // Default constructor
    }

    // Getters and setters
    public double getIncome() {
        return income;
    }

    public void setIncome(double income) {
        this.income = income;
    }

    public double getTax() {
        return tax;
    }

    // Method to calculate tax
    public void calculateTax() {
        if (income <= 500000) {
            tax = 0;
        } else if (income <= 1000000) {
            tax = (income - 500000) * 0.1;
        } else {
            tax = 500000 * 0.1 + (income - 1000000) * 0.2;
        }
    }
}

