import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('About Us', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green[700])),
              _buildCard(
                'Name of the Project',
                'Synthesis of available fertilizer trials data for site-specific recommendations and diagnostic survey for low adoption of fertilizer use technology',
              ),

              _buildCard(
                'Project Team',
                '• Principal Investigator:\n'
                    '  Dr. Muhammad Aamer Maqsood, Professor, Inst. Soil and Environ. Sciences, UAF\n\n'
                    '• Research Officers:\n'
                    '  1. Muhammad Talha\n\n'
                    '• Co-PI for "Software Development":\n'
                    '  Ahsan Raza Sattar, Assistant Professor, Department of Computer Science, UAF\n\n'
                    '• Software Engineer:\n'
                    '  1. Hafiz Ali Naeem\n\n'
                    '• Developer:\n'
                    '  2. Muhammad Awais Khan',
              ),

              _buildCard('Location', 'All the districts of Punjab Province'),

              _buildCard('Duration', '36 Months'),

              _buildCard(
                'Objectives',
                '• Collection and synthesis of available fertilizer trials data\n'
                    '• Software development for site-specific recommendations\n'
                    '• Development and maintenance of website for fertilizer prediction models\n'
                    '• Training for district staff of Agri. Extension and Soil Fertility\n'
                    '• Diagnostic survey for low adoption of fertilizer use technology and imbalance use of nitrogen and phosphorus',
              ),

              _buildBudgetCard(),

              _buildCard(
                'Activities',
                '• Collection of relevant reports, research papers, handouts, and personal communication\n'
                    '• Extraction of fertilizer trials data (yield with soil analysis)\n'
                    '• Selection of treatments with balanced NP graded doses\n'
                    '• Data processing and software development\n'
                    '• Verification of predictions with original treatments\n'
                    '• Uploading of software on the web',
              ),

              _buildCard(
                'Prediction Models',
                '• Prediction models for soil analysis-based fertilizer recommendations (N&P) completed for all districts of Punjab for wheat, and relevant districts for Rice (12), Maize (7), Sugarcane (6), and Cotton (11 B.T. Cotton, 15 Non B.T. Cotton) are available on the web.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title, String content) {
    return Center(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.only(bottom: 16),
        child: Container(
          width: double.infinity, // Ensures the card stretches horizontally
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Keep content aligned left
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                ),
              ),
              SizedBox(height: 10),
              Text(
                content,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBudgetCard() {
    return Center(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.only(bottom: 16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Budget',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                ),
              ),
              SizedBox(height: 10),
              Table(
                border: TableBorder.all(color: Colors.green),
                columnWidths: const {
                  0: FixedColumnWidth(60),
                  1: FlexColumnWidth(),
                  2: FixedColumnWidth(60),
                  3: FixedColumnWidth(60),
                  4: FixedColumnWidth(60),
                  5: FixedColumnWidth(60),
                },
                children: [
                  _buildBudgetRow(
                    ['Sr. No.', 'Objects', 'Year I', 'Year II', 'Year III', 'Total'],
                    isHeader: true,
                  ),
                  _buildBudgetRow(['A038', 'Operational Expenses', '-', '-', '-', '-']),
                  _buildBudgetRow(['A039', 'Capital Expenses', '-', '-', '-', '-']),
                  _buildBudgetRow(['A040', 'Audit Fees', '-', '-', '-', '-']),
                  _buildBudgetRow(['Grand Total', '', '-', '-', '-', '-']),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildBudgetRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      decoration: BoxDecoration(
        color: isHeader ? Colors.green[100] : Colors.transparent,
      ),
      children: cells
          .map(
            (cell) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            cell,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      )
          .toList(),
    );
  }
}
