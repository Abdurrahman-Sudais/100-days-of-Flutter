void main() {
  BankAccount sudais = BankAccount("sudais", 5000);
  sudais.deposit(200);
  sudais.withdraw(500);
  sudais.showdata();
  BankAccount muhammad = BankAccount("Muhammad", 50);
  muhammad.deposit(10);
  muhammad.withdraw(2000);
  muhammad.showdata();
}

class BankAccount {
  String? accountHolder;
  double balance = 0;

  BankAccount(this.accountHolder, this.balance);

  deposit(double amount) {
    balance += amount;
    print("deposited $amount into $accountHolder's account");
  }

  withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
      print("withdrawn $amount from $accountHolder's account");
    } else {
      print("Insufficient Funds");
    }
  }

  void showdata() {
    print("$accountHolder's Current Balance:  $balance");
  }
}


// deposit(amount)
// withdraw(amount)
// displayBalance()