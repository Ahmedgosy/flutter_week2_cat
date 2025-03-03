dynamic safeDivide(num numerator, num? denominator) {
  if (denominator == null || denominator == 0) {
    return "Cannot divide by zero!";
  }
  return numerator / denominator;
}

void main() {
  print('safeDivide(10, 2)  → Output: ${safeDivide(10, 2)}');
  print('safeDivide(8, 0)   → Output: ${safeDivide(8, 0)}');
  print('safeDivide(7, null) → Output: ${safeDivide(7, null)}');
}