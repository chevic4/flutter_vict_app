class ProfileEntity {
  final int id;
  final String email;
  final String password;
  final String name;
  final String role;
  final String avatar;

  ProfileEntity({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.avatar,
  });
}
