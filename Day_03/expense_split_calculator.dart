import 'dart:io';

void main() {
  stdout.write("Enter your bill amount:  ");
  final billAmount = stdin.readLineSync();
  stdout.write("Enter the number of people:  ");
  final NumOfPeople = stdin.readLineSync();
  stdout.write("Enter Tip percentage:  ");
  final tipPercentage = stdin.readLineSync();
  if (billAmount == null || NumOfPeople == null || tipPercentage == null) {
    print('Input cannot be empty.');
    return;
  }
  final bill = double.parse(billAmount);
  final people = int.parse(NumOfPeople);
  final tip = double.parse(tipPercentage);

  var tipAmount = bill * tip / 100;
  var totalBill = tipAmount + bill;
  var splitBill = totalBill / people;
  print("tip amount: $tipAmount");
  print("total bill: $totalBill");
  print("Each person pays: $splitBill");
}
