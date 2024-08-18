import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laliga_standing/constant.dart';
import 'package:laliga_standing/pl_providers.dart';
import 'package:laliga_standing/shimmereffect_page.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pldata = ref.watch(plprovidersss);
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Image(
              image: AssetImage('assets/images/logo.png'),
              height: 70,
            ),
            Text(
              'Premier League',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: pldata.isLoad
          ? Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              direction: ShimmerDirection.ttb,
              child: const ShimmerEffectPage(),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        headingRowHeight: 40,
                        columnSpacing: 20,
                        columns: const [
                          DataColumn(
                            label: Text(
                              '',
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Club',
                              style: namestyle,
                            ),
                          ),
                          DataColumn(
                            label: Text('MP', style: namestyle),
                          ),
                          DataColumn(
                            label: Text('W', style: namestyle),
                          ),
                          DataColumn(
                            label: Text('D', style: namestyle),
                          ),
                          DataColumn(
                            label: Text('L', style: namestyle),
                          ),
                          DataColumn(
                            label: Text('GF', style: namestyle),
                          ),
                          DataColumn(
                            label: Text('GA', style: namestyle),
                          ),
                          DataColumn(
                            label: Text('GD', style: namestyle),
                          ),
                          DataColumn(
                            label: Text('Pts', style: namestyle),
                          ),
                        ],
                        rows: List.generate(pldata.pl.length, (index) {
                          return DataRow(cells: [
                            DataCell(
                              pldata.pl[index].rank <= 4
                                  ? Container(
                                      height: 40,
                                      width: 4,
                                      decoration: const BoxDecoration(
                                          color: Colors.blue),
                                    )
                                  : pldata.pl[index].rank == 5
                                      ? Container(
                                          height: 40,
                                          width: 4,
                                          decoration: const BoxDecoration(
                                              color: Colors.deepOrange),
                                        )
                                      : pldata.pl[index].rank >= 18
                                          ? Container(
                                              height: 40,
                                              width: 4,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 242, 16, 0)),
                                            )
                                          : const SizedBox(
                                              height: 40,
                                              width: 4,
                                            ),
                            ),
                            DataCell(Row(
                              children: [
                                Text(pldata.pl[index].rank.toString(),
                                    style: const TextStyle(
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    )),
                                const SizedBox(width: 10),
                                Image(
                                  image: NetworkImage(pldata.pl[index].logo),
                                  height: 30,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  pldata.pl[index].name,
                                  style: const TextStyle(
                                    fontFamily: 'IBMPlexMono',
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            )),
                            DataCell(Text(
                              pldata.pl[index].gamesPlayed.toString(),
                              style: numstyle,
                            )),
                            DataCell(Text(
                              pldata.pl[index].wins.toString(),
                              style: numstyle,
                            )),
                            DataCell(Text(
                              pldata.pl[index].ties.toString(),
                              style: numstyle,
                            )),
                            DataCell(Text(
                              pldata.pl[index].losses.toString(),
                              style: numstyle,
                            )),
                            DataCell(Text(
                              pldata.pl[index].goalsFor.toString(),
                              style: numstyle,
                            )),
                            DataCell(Text(
                              pldata.pl[index].goalsAgainst.toString(),
                              style: numstyle,
                            )),
                            DataCell(Text(
                              pldata.pl[index].goalsAgainst.toString(),
                              style: numstyle,
                            )),
                            DataCell(Text(
                              pldata.pl[index].points.toString(),
                              style: numstyle,
                            )),
                          ]);
                        })),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 10),
                    child: Container(
                      color: const Color.fromARGB(198, 255, 255, 255),
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Qualification/Relegation',
                            style: namestyle,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                color: Colors.blue,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'UEFA Champions League group stage',
                                style: subnamestyle,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                color: Colors.deepOrange,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Europa League group stage',
                                style: subnamestyle,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Relegation',
                                style: subnamestyle,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
