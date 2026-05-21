import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const ExpenseTracker(),
    );
  }
}


class Expense {
  final String id;
  final String name;
  final double amount;

  Expense({required this.name, required this.amount})
      : id = DateTime.now().millisecondsSinceEpoch.toString();
}



class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  final List<Expense> _expenses = [];

  double get _total => _expenses.fold(0, (sum, e) => sum + e.amount);



  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    super.dispose();
  }



  void _addExpense() {
    final name = _nameController.text.trim();
    final amountText = _amountController.text.trim();

    
    if (name.isEmpty) {
      _showError('Please enter an expense name.');
      return;
    }

    final amount = double.tryParse(amountText);
    if (amount == null || amount <= 0) {
      _showError('Please enter a valid amount.');
      return;
    }

    setState(() {
      _expenses.add(Expense(name: name, amount: amount));
      _nameController.clear();
      _amountController.clear();
    });

    _showSnackBar('Expense added!');
  }

  void _deleteExpense(String id) {
    setState(() => _expenses.removeWhere((e) => e.id == id));
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red.shade700,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'Expense Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _TotalCard(total: _total),
            const SizedBox(height: 16),
            _InputSection(
              nameController: _nameController,
              amountController: _amountController,
              onAdd: _addExpense,
            ),
            const SizedBox(height: 24),
            if (_expenses.isEmpty)
              const _EmptyState()
            else
              _ExpenseList(
                expenses: _expenses,
                onDelete: _deleteExpense,
              ),
          ],
        ),
      ),
    );
  }
}



class _TotalCard extends StatelessWidget {
  final double total;
  const _TotalCard({required this.total});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Spent',
              style: TextStyle(color: Colors.grey[400], fontSize: 14),
            ),
            const SizedBox(height: 6),
            Text(
              '₦${total.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.greenAccent,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InputSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController amountController;
  final VoidCallback onAdd;

  const _InputSection({
    required this.nameController,
    required this.amountController,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Expense name',
                hintText: 'e.g. Netflix, Transport',
                prefixIcon: Icon(Icons.label_outline),
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: 'Amount (₦)',
                hintText: 'e.g. 3500',
                prefixIcon: Icon(Icons.attach_money),
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => onAdd(),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onAdd,
                icon: const Icon(Icons.add),
                label: const Text('Add Expense'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExpenseList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(String id) onDelete;

  const _ExpenseList({required this.expenses, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Expenses',
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 12,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: expenses.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            // Show newest first
            final expense = expenses[expenses.length - 1 - index];
            return _ExpenseCard(expense: expense, onDelete: onDelete);
          },
        ),
      ],
    );
  }
}

class _ExpenseCard extends StatelessWidget {
  final Expense expense;
  final void Function(String id) onDelete;

  const _ExpenseCard({required this.expense, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green.withOpacity(0.15),
          child: const Icon(Icons.receipt_long, color: Colors.greenAccent),
        ),
        title: Text(expense.name),
        subtitle: Text(
          'Today',
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '₦${expense.amount.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.greenAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
              onPressed: () => onDelete(expense.id),
              tooltip: 'Delete',
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Icon(Icons.receipt_long_outlined, size: 64, color: Colors.grey[700]),
          const SizedBox(height: 12),
          Text(
            'No expenses yet',
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
          ),
        ],
      ),
    );
  }
}