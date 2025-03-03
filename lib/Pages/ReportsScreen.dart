// ملف reports_screen.dart
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:untitled7/main.dart';


class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  int _currentIndex = 0;
  final List<Map<String, dynamic>> _completedData = [];
  final List<Map<String, dynamic>> _pendingData = [];

  @override
  void initState() {
    super.initState();
    _loadSampleData();
  }

  void _loadSampleData() {
    _completedData.addAll(List.generate(10, (index) => _generateData(true)));
    _pendingData.addAll(List.generate(5, (index) => _generateData(false)));
  }

  Map<String, dynamic> _generateData(bool isCompleted) {
    return {
      'name': 'العميل ${DateTime.now().millisecond}',
      'subscriber': (1000 + DateTime.now().millisecond % 1000).toString(),
      'date': '2024-${(DateTime.now().month + 1).toString().padLeft(2, '0')}-'
          '${DateTime.now().day.toString().padLeft(2, '0')}',
      'amount': '${(DateTime.now().millisecond % 1000 * 10)} ر.س',
      'status': isCompleted,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('نظام التقارير'),
      backgroundColor: KColorPrimer,
      centerTitle: true,
      elevation: 4,
      shadowColor: KColorPrimer.withOpacity(0.3),
    ),
      body: _buildContent(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  

  Widget _buildContent() {
    return IndexedStack(
      index: _currentIndex,
      children: [
        _buildDataTable(_completedData),
        _buildDataTable(_pendingData),
      ],
    );
  }

  Widget _buildDataTable(List<Map<String, dynamic>> data) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildTableHeader(),
            const SizedBox(height: 8),
            ...data.map((item) => _buildTableRow(item)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      decoration: BoxDecoration(
        color: KColorFoured,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          _buildHeaderCell('الاسم', flex: 2),
          _buildHeaderCell('رقم المشترك'),
          _buildHeaderCell('تاريخ التسديد'),
          _buildHeaderCell('المبلغ'),
          _buildHeaderCell('الحالة'),
        ],
      ),
    );
  }

  Widget _buildTableRow(Map<String, dynamic> item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            _buildDataCell(item['name'], flex: 2),
            _buildDataCell(item['subscriber']),
            _buildDataCell(item['date']),
            _buildDataCell(item['amount']),
            _buildStatusIcon(item['status']),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildDataCell(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 13,
          color: Colors.grey.shade800,
        ),
      ),
    );
  }

  Widget _buildStatusIcon(bool isCompleted) {
    return Expanded(
      child: Icon(
        isCompleted ? Icons.check_circle : Icons.pending_actions,
        color: isCompleted ? Colors.green : Colors.orange,
        size: 28,
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return CurvedNavigationBar(
      index: _currentIndex,
      height: 65,
      color: KColorPrimer,
      buttonBackgroundColor: KColorSecond,
      backgroundColor: Colors.transparent,
      animationDuration: const Duration(milliseconds: 500),
      items: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, size: 28),
            const SizedBox(height: 4),
            Text(
              'تمت القراءة',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.pending_actions, size: 28),
            const SizedBox(height: 4),
            Text(
              'قيد الانتظار',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ],
        ),
      ],
      onTap: (index) => setState(() => _currentIndex = index),
    );
  }
}