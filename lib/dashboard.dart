import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'মীর ইলেকট্রিক এন্ড হার্ডওয়্যার',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: const Color(0xFF059669),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'আজকের হিসাব',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.5,
              children: [
                _buildSummaryCard('মোট বিক্রয়', '৳ 0.00', Colors.blue),
                _buildSummaryCard('নগদ বিক্রয়', '৳ 0.00', Colors.green),
                _buildSummaryCard('বাকি বিক্রয়', '৳ 0.00', Colors.orange),
                _buildSummaryCard('আজকের জমা', '৳ 0.00', Colors.teal),
                _buildSummaryCard('মোট খরচ', '৳ 0.00', Colors.red),
                _buildSummaryCard('আজকের লাভ', '৳ 0.00', Colors.purple),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'মোট ব্যালেন্স',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildBalanceCard('মোট কাস্টমার বাকি', '৳ 0.00', Icons.people),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildBalanceCard('মোট ক্যাশ ব্যালেন্স', '৳ 0.00', Icons.account_balance_wallet),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFFF97316),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('নতুন লেনদেন', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildSummaryCard(String title, String amount, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border(left: BorderSide(color: color, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
          const SizedBox(height: 8),
          Text(
            amount,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard(String title, String amount, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF059669),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white70, size: 30),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 4),
          Text(
            amount,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
