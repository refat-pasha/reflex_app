// class AppUser {
//   final String name;
//   final String email;
//   final String role;
//   final int age;
//   final String about;
//   final String avatarPath;

//   const AppUser({
//     required this.name,
//     required this.email,
//     this.role = 'Student',
//     this.age = 0,
//     this.about = '',
//     this.avatarPath = 'assets/images/user.jpg',
//   });

//   AppUser copyWith({
//     String? name,
//     String? email,
//     String? role,
//     int? age,
//     String? about,
//     String? avatarPath,
//   }) {
//     return AppUser(
//       name: name ?? this.name,
//       email: email ?? this.email,
//       role: role ?? this.role,
//       age: age ?? this.age,
//       about: about ?? this.about,
//       avatarPath: avatarPath ?? this.avatarPath,
//     );
//   }
// }
