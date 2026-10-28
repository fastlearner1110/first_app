import 'package:flutter/material.dart';

import '../data/team_repository.dart';
import '../models/profile.dart';
import '../widgets/profile_card.dart';

class TeamBoardScreen extends StatefulWidget {
  const TeamBoardScreen({super.key, this.repository = const TeamRepository()});

  final TeamRepository repository;

  @override
  State<TeamBoardScreen> createState() => _TeamBoardScreenState();
}

class _TeamBoardScreenState extends State<TeamBoardScreen> {
  late final Future<List<Profile>> _team = widget.repository.fetchTeam();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Team Profile Board')),
      body: FutureBuilder<List<Profile>>(
        future: _team,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Could not load the team'));
          }

          final profiles = snapshot.data ?? const <Profile>[];
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            itemCount: profiles.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return ProfileCard(profile: profiles[index]);
            },
          );
        },
      ),
    );
  }
}
