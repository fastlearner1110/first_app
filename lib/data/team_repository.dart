import '../models/profile.dart';

const List<Map<String, Object?>> teamJson = [
  {
    'name': 'Maya Chen',
    'title': 'Engineering lead',
    'role': 'lead',
    'location': 'Austin',
    'focus': 'Ships the release train',
  },
  {
    'name': 'Arun Patel',
    'title': 'Flutter engineer',
    'role': 'engineer',
    'location': 'Bengaluru',
    'focus': 'Builds the mobile board',
  },
  {
    'name': 'Sofia Alvarez',
    'title': 'Product designer',
    'role': 'designer',
    'location': 'Mexico City',
    'focus': 'Owns the card layout',
  },
  {
    'name': 'Liam Okafor',
    'title': 'Frontend engineer',
    'role': 'engineer',
    'location': 'London',
    'focus': 'Keeps the widget tree small',
  },
  {
    'name': 'Priya Nair',
    'title': 'Accessibility engineer',
    'role': 'engineer',
    'location': 'Toronto',
    'focus': 'Checks contrast and labels',
  },
  {
    'name': 'Jonah Berg',
    'title': 'Design technologist',
    'role': 'designer',
    'location': 'Berlin',
    'focus': 'Turns mocks into widgets',
  },
  {
    'name': 'Hana Kim',
    'title': 'QA engineer',
    'role': 'engineer',
    'location': 'Seoul',
  },
  {
    'name': 'Elias Ward',
    'title': 'Platform engineer',
    'role': 'engineer',
    'location': 'Remote',
    'focus': 'Keeps the theme in one place',
  },
];

class TeamRepository {
  const TeamRepository({this.delay = const Duration(milliseconds: 700)});

  final Duration delay;

  /// Fake network call. [Future.delayed] stands in for an HTTP request.
  Future<List<Profile>> fetchTeam() async {
    await Future.delayed(delay);
    try {
      return [for (final json in teamJson) Profile.fromJson(json)];
    } on FormatException catch (error) {
      throw Exception('Could not parse the team: ${error.message}');
    }
  }
}
