// Encapsulation: Define a BankAccount class with private variables and controlled access.
class BankAccount {
  // Private variables (using underscore to keep them hidden)
  double _balance = 0;
  
  // Getter for balance (no setter to restrict direct access)
  double get balance => _balance;

  // Method to deposit money (adds to balance)
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
    }
  }

  // Method to withdraw money (checks if balance is sufficient)
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
    }
  }
}

// Abstraction: Define an abstract Account class
abstract class Account {
  // Abstract method for displaying account details
  void displayAccountInfo();
}

// Inheritance: Define a CheckingAccount subclass that inherits from BankAccount and implements Account
class CheckingAccount extends BankAccount implements Account {
  String accountType = "Checking";

  @override
  void displayAccountInfo() {
    print("Account Type: $accountType");
    print("Balance: \$${balance.toStringAsFixed(2)}");
  }
}

// Inheritance and Polymorphism: Define a SavingsAccount subclass that overrides displayAccountInfo
class SavingsAccount extends BankAccount implements Account {
  String accountType = "Savings";

  @override
  void displayAccountInfo() {
    print("Account Type: $accountType");
    print("Balance: \$${balance.toStringAsFixed(2)} (Savings with interest)");
  }
}

// Main function to demonstrate functionality
void main() {
  // Create instances of CheckingAccount and SavingsAccount
  CheckingAccount checking = CheckingAccount();
  SavingsAccount savings = SavingsAccount();

  // Deposit money into both accounts
  checking.deposit(200);
  savings.deposit(500);

  // Display account information (Polymorphism in action)
  print("Checking Account:");
  checking.displayAccountInfo();
  
  print("\nSavings Account:");
  savings.displayAccountInfo();
}
