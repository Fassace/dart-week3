// Abstraction
abstract class PaymentMethod {
  void makePayment(double amount);
}

// Encapsulation
class BankAccount {
  // Private variables
  double _balance = 0.0;
  int _accountNumber = 0;

  // Public constructor
  BankAccount({required int accountNumber, double initialBalance = 0.0}) {
    _accountNumber = accountNumber;
    _balance = initialBalance;
  }

  // Controlled access methods
  double getBalance() => _balance;
  void deposit(double amount) => _balance += amount;
  void withdraw(double amount) {
    if (_balance >= amount) {
      _balance -= amount;
    } else {
      print("Insufficient balance");
    }
  }
}

// Inheritance
class CheckingAccount extends BankAccount {
  int _overdraftLimit = 0;

  CheckingAccount({required int accountNumber, required int overdraftLimit, double initialBalance = 0.0})
      : super(accountNumber: accountNumber, initialBalance: initialBalance) {
    _overdraftLimit = overdraftLimit;
  }

  @override
  void withdraw(double amount) {
    if (_balance + _overdraftLimit >= amount) {
      _balance -= amount;
    } else {
      print("Insufficient balance");
    }
  }
}

class SavingsAccount extends BankAccount {
  int _interestRate = 0;

  SavingsAccount({required int accountNumber, required int interestRate, double initialBalance = 0.0})
      : super(accountNumber: accountNumber, initialBalance: initialBalance) {
    _interestRate = interestRate;
  }

  void addInterest() {
    _balance += _balance * (_interestRate / 100);
  }
}

// Polymorphism
class CreditCardPayment extends PaymentMethod {
  @override
  void makePayment(double amount) => print("Paid \$${amount} using credit card");
}

class BankTransferPayment extends PaymentMethod {
  @override
  void makePayment(double amount) => print("Paid \$${amount} using bank transfer");
}

void main() {
  // Create accounts
  BankAccount account = BankAccount(accountNumber: 12345, initialBalance: 1000.0);
  CheckingAccount checkingAccount = CheckingAccount(accountNumber: 67890, overdraftLimit: 500, initialBalance: 500.0);
  SavingsAccount savingsAccount = SavingsAccount(accountNumber: 34567, interestRate: 5, initialBalance: 2000.0);

  // Perform transactions
  account.deposit(500.0);
  checkingAccount.withdraw(200.0);
  savingsAccount.addInterest();

  // Make payments
  PaymentMethod payment = CreditCardPayment();
  payment.makePayment(100.0);
  payment = BankTransferPayment();
  payment.makePayment(50.0);

  // Print balances
  print("Account balance: ${account.getBalance()}");
  print("Checking account balance: ${checkingAccount.getBalance()}");
  print("Savings account balance: ${savingsAccount.getBalance()}");
}