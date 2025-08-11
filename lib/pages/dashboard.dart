import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  final List<Map<String, dynamic>> _doctors = [
    {
      'name': 'Dr. Mosia Gloria',
      'title': 'Sr. Psychologist',
      'avatar': 'assets/images/nurse1.png',
      'rating': 4.3,
    },
    {
      'name': 'Dr. Margret Dir',
      'title': 'Sr. Psychologist',
      'avatar': 'assets/images/nurse2.png',
      'rating': 4.7,
    },
    {
      'name': 'Dr. Samuel Lee',
      'title': 'Child Psychologist',
      'avatar': 'assets/images/nurse1.png',
      'rating': 4.8,
    },
    {
      'name': 'Dr. Aisha Khan',
      'title': 'Clinical Psychologist',
      'avatar': 'assets/images/nurse2.png',
      'rating': 4.6,
    },
    {
      'name': 'Dr. Rafael Mendes',
      'title': 'Counseling Psychologist',
      'avatar': 'assets/images/nurse1.png',
      'rating': 4.4,
    },
    {
      'name': 'Dr. Elena Petrova',
      'title': 'Neuropsychologist',
      'avatar': 'assets/images/nurse2.png',
      'rating': 4.9,
    },
    {
      'name': 'Dr. Kevin O\'Connor',
      'title': 'Forensic Psychologist',
      'avatar': 'assets/images/nurse1.png',
      'rating': 4.2,
    },
    {
      'name': 'Dr. Maya Singh',
      'title': 'Health Psychologist',
      'avatar': 'assets/images/nurse2.png',
      'rating': 4.5,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildDoctorCard(Map<String, dynamic> doc) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(doc['avatar'], height: 120, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              doc['name'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Text(
              doc['title'],
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                const Icon(Icons.star, size: 16, color: Colors.amber),
                const SizedBox(width: 4),
                Text(doc['rating'].toStringAsFixed(1)),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryGreen = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black87),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Hello,', style: TextStyle(color: Colors.grey, fontSize: 14)),
            Text(
              'Abdul!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/images/user.jpg'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Doctor',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_list, color: Colors.grey),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const Text(
              'Doctors',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: primaryGreen,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              tabs: const [
                Tab(text: 'Psychology'),
                Tab(text: 'Chat with us'),
              ],
            ),
            const SizedBox(height: 16),
            // Horizontal doctor list wrapped in Expanded
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _doctors.length,
                padding: const EdgeInsets.only(left: 16),
                itemBuilder: (context, index) {
                  return _buildDoctorCard(_doctors[index]);
                },
              ),
            ),
            const SizedBox(height: 24),
            // Instant Appointment banner
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 8),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Instant Appointment',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Get quick access to a doctor now.',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Read more'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryGreen,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
