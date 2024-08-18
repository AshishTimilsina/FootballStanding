import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:laliga_standing/pl_providers.dart';

class ShimmerEffectPage extends ConsumerWidget {
  const ShimmerEffectPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pldata = ref.watch(plprovidersss);

    return Scaffold(
      body: pldata.pl.isEmpty
          ? ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    tileColor: Colors.white,
                    leading: Container(
                      height: 40,
                      width: 40,
                      color: Colors.grey[300],
                    ),
                    title: Container(
                      height: 20,
                      color: Colors.grey[300],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: double.infinity,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                    height: 16, color: Colors.grey[300])),
                            const SizedBox(width: 8),
                            Expanded(
                                child: Container(
                                    height: 16, color: Colors.grey[300])),
                            const SizedBox(width: 8),
                            Expanded(
                                child: Container(
                                    height: 16, color: Colors.grey[300])),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                    height: 16, color: Colors.grey[300])),
                            const SizedBox(width: 8),
                            Expanded(
                                child: Container(
                                    height: 16, color: Colors.grey[300])),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : ListView.builder(
              itemCount: pldata.pl.length,
              itemBuilder: (context, index) {
                final team = pldata.pl[index];
                return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  tileColor: Colors.white,
                  leading: Image.network(team.logo, height: 40, width: 40),
                  title: Text(team.name),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('MP: ${team.gamesPlayed}'),
                      Text('W: ${team.wins}'),
                      Text('D: ${team.ties}'),
                      Text('L: ${team.losses}'),
                      Text('GF: ${team.goalsFor}'),
                      Text('GA: ${team.goalsAgainst}'),
                      Text('GD: ${team.goalsAgainst}'),
                      Text('Pts: ${team.points}'),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
