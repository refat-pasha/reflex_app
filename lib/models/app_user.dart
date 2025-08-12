class AppUser {
  final String name;
  final String email;
  final int age;
  final String role;
  final String about;
  final String avatarPath;

  AppUser({
    required this.name,
    required this.email,
    required this.age,
    this.role = 'Student',
    this.about = '',
    this.avatarPath = 'assets/images/user.jpg',
  });
}
