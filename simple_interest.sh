#!/bin/bash
# This script calculates simple interest given principal, annual interest rate, and time period in years.

# Do not use this in a production environment. It is a sample script for educational purposes.
# Author: Your Name
# Additional Contributors: Micro-finance Startup Team

echo "--- Simple Interest Calculator ---"

# Prompt user for input
read -p "Enter the principal amount (P): " principal
read -p "Enter the annual interest rate (R) in %: " rate
read -p "Enter the time period (T) in years: " time

# Calculate simple interest using basic arithmetic
# Note: Bash doesn't natively handle decimals well, so we use 'bc' for floating-point math if available, 
# or standard integer math if not. Here is a clean way to do it:

interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc 2>/dev/null)

# Fallback if 'bc' utility is not installed on the system
if [ -z "$interest" ]; then
    interest=$(( principal * rate * time / 100 ))
fi

total=$(echo "scale=2; $principal + $interest" | bc 2>/dev/null)
if [ -z "$total" ]; then
    total=$(( principal + interest ))
fi

echo "----------------------------------"
echo "Principal Amount: $principal"
echo "Interest Rate:    $rate%"
echo "Time Period:      $time year(s)"
echo "----------------------------------"
echo "Calculated Interest: $interest"
echo "Total Amount Due:    $total"
echo "----------------------------------"
