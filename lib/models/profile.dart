enum TeamRole { lead, engineer, designer }

extension TeamRoleLabel on TeamRole {
  String get label {
    return switch (this) {
      TeamRole.lead => 'Lead',
      TeamRole.engineer => 'Engineer',
      TeamRole.designer => 'Designer',
    };
  }
}

/// One person on the FED team.
///
/// [focus] is nullable. Null safety means the program will not let you treat
/// that field as a String until you check that it has a value.
class Profile {
  const Profile({
    required this.name,
    required this.title,
    required this.role,
    required this.location,
    this.focus,
  });

  final String name;
  final String title;
  final TeamRole role;
  final String location;
  final String? focus;

  String get initials {
    final parts = name.split(' ');
    return parts.take(2).map((part) => part[0]).join();
  }

  factory Profile.fromJson(Map<String, Object?> json) {
    final name = json['name'];
    final title = json['title'];
    final roleName = json['role'];
    final location = json['location'];
    if (name is! String ||
        title is! String ||
        roleName is! String ||
        location is! String) {
      throw const FormatException('Profile is missing a required field');
    }

    return Profile(
      name: name,
      title: title,
      role: TeamRole.values.byName(roleName),
      location: location,
      focus: json['focus'] as String?,
    );
  }
}
