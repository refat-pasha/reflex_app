import 'package:flutter/material.dart';
import 'package:reflex_app/pages/dashboard.dart';

/// Simple user model used across SignUp/SignIn and Profile.
class AppUser {
  final String name;
  final String email;
  final String role;
  final int age;
  final String about;
  final String avatarPath;

  const AppUser({
    required this.name,
    required this.email,
    this.role = 'User',
    this.age = 0,
    this.about = '',
    this.avatarPath = 'assets/images/nurse1.jpg',
  });

  AppUser copyWith({
    String? name,
    String? email,
    String? role,
    int? age,
    String? about,
    String? avatarPath,
  }) {
    return AppUser(
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      age: age ?? this.age,
      about: about ?? this.about,
      avatarPath: avatarPath ?? this.avatarPath,
    );
  }
}

class ProfilePage extends StatefulWidget {
  /// Pass the signed-in user from your SignIn/SignUp flow.
  final AppUser user;

  const ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late AppUser _user;

  @override
  void initState() {
    super.initState();
    // Initialize with the user passed from SignIn/SignUp.
    _user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF0FA16C);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryGreen,
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              // Avatar
              ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.asset(
                  _user.avatarPath,
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),

              // Name
              Text(
                _user.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),

              // Role
              Text(
                _user.role,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 24),

              // Email & Age
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _InfoItem(label: 'Email', value: _user.email),
                  _InfoItem(
                    label: 'Age',
                    value: _user.age > 0 ? '${_user.age}' : '—',
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // About
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'About',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _user.about.isEmpty
                    ? 'Tap Edit to add a description.'
                    : _user.about,
                style: const TextStyle(fontSize: 14, height: 1.4),
              ),
              const SizedBox(height: 32),

              // Edit Profile
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: () => _showEditDialog(context),
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit Profile'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    final nameCtrl = TextEditingController(text: _user.name);
    final roleCtrl = TextEditingController(text: _user.role);
    final emailCtrl = TextEditingController(text: _user.email);
    final ageCtrl = TextEditingController(
      text: _user.age > 0 ? '${_user.age}' : '',
    );
    final aboutCtrl = TextEditingController(text: _user.about);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Edit Profile'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              _buildTextField(controller: nameCtrl, label: 'Name'),
              const SizedBox(height: 8),
              _buildTextField(controller: roleCtrl, label: 'Role'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: emailCtrl,
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 8),
              _buildTextField(
                controller: ageCtrl,
                label: 'Age',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8),
              _buildTextField(
                controller: aboutCtrl,
                label: 'About',
                maxLines: 3,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _user = _user.copyWith(
                  name: nameCtrl.text.trim(),
                  role: roleCtrl.text.trim(),
                  email: emailCtrl.text.trim(),
                  age:
                      int.tryParse(
                        ageCtrl.text.trim().isEmpty ? '0' : ageCtrl.text.trim(),
                      ) ??
                      _user.age,
                  about: aboutCtrl.text.trim(),
                );
              });

              // TODO: Persist the updated user to your backend/local storage if needed.

              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;

  const _InfoItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
