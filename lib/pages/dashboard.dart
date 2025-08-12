import 'package:flutter/material.dart';
import 'package:reflex_app/pages/doctors_profile.dart'; // adjust path as needed
import 'package:reflex_app/pages/profile.dart'; // optional: for avatar tap

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

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
      'patients': 240,
      'experience': '5 yr',
      'rating': 4.0,
      'about':
          'Dr. Mosia Gloria is a senior psychologist with 5 years of experience helping patients manage stress, anxiety, and other mental health challenges.',
    },
    {
      'name': 'Dr. Margret Dir',
      'title': 'Sr. Psychologist',
      'avatar': 'assets/images/nurse2.png',
      'patients': 180,
      'experience': '4 yr',
      'rating': 4.5,
      'about':
          'Dr. Margret Dir specializes in cognitive behavioral therapy and has helped hundreds of patients improve their mental well-being.',
    },
    {
      'name': 'Dr. Samuel Lee',
      'title': 'Child Psychologist',
      'avatar': 'assets/images/nurse1.png',
      'patients': 150,
      'experience': '3 yr',
      'rating': 4.8,
      'about':
          'Dr. Samuel Lee focuses on child psychology and developmental disorders, providing compassionate care for young patients.',
    },
    {
      'name': 'Dr. Aisha Khan',
      'title': 'Clinical Psychologist',
      'avatar': 'assets/images/nurse2.png',
      'patients': 200,
      'experience': '6 yr',
      'rating': 4.6,
      'about':
          'Dr. Aisha Khan has extensive experience in clinical settings, treating a wide range of mental health conditions.',
    },
    {
      'name': 'Dr. Rafael Mendes',
      'title': 'Counseling Psychologist',
      'avatar': 'assets/images/nurse1.png',
      'patients': 170,
      'experience': '4 yr',
      'rating': 4.4,
      'about':
          'Dr. Rafael Mendes provides counseling for individuals and couples, focusing on relationship and life-transition issues.',
    },
    {
      'name': 'Dr. Elena Petrova',
      'title': 'Neuropsychologist',
      'avatar': 'assets/images/nurse2.png',
      'patients': 130,
      'experience': '5 yr',
      'rating': 4.9,
      'about':
          'Dr. Elena Petrova specializes in neuropsychology, assessing and treating brain-related cognitive disorders.',
    },
    {
      'name': 'Dr. Kevin O\'Connor',
      'title': 'Forensic Psychologist',
      'avatar': 'assets/images/nurse1.png',
      'patients': 90,
      'experience': '4 yr',
      'rating': 4.2,
      'about':
          'Dr. Kevin O\'Connor works at the intersection of psychology and the justice system, conducting assessments and expert testimony.',
    },
    {
      'name': 'Dr. Maya Singh',
      'title': 'Health Psychologist',
      'avatar': 'assets/images/nurse1.png',
      'patients': 210,
      'experience': '6 yr',
      'rating': 4.5,
      'about':
          'Dr. Maya Singh focuses on how psychological factors affect physical health, offering support for chronic illness management.',
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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => DoctorProfilePage(doctor: doc)),
        );
      },
      child: Container(
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
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.asset(doc['avatar'], height: 120, fit: BoxFit.cover),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                doc['name'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
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
            child: GestureDetector(
              onTap: () {
                // Open profile page when avatar tapped (optional)
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const ProfilePage()));
              },
              child: const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/images/user.jpg'),
              ),
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
                children: const [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Doctor',
                        border: InputBorder.none,
                      ),
                    ),
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

            // Horizontal doctors list
            SizedBox(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                itemCount: _doctors.length,
                itemBuilder: (context, index) =>
                    _buildDoctorCard(_doctors[index]),
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
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Instant Appointment',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // fixed: visible on white
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
