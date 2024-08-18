import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laliga_standing/pl_providers.dart';

class ShimmerEffectPage extends ConsumerWidget {
  const ShimmerEffectPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pldata = ref.watch(plprovidersss);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowHeight: 40,
              columnSpacing: 20,
              columns: const [
                DataColumn(label: Text('Club')),
                DataColumn(label: Text('MP')),
                DataColumn(label: Text('W')),
                DataColumn(label: Text('D')),
                DataColumn(label: Text('L')),
                DataColumn(label: Text('GF')),
                DataColumn(label: Text('GA')),
                DataColumn(label: Text('GD')),
                DataColumn(label: Text('Pts')),
              ],
              rows: List.generate(pldata.pl.length, (index) {
                return DataRow(cells: [
                  DataCell(Row(
                    children: [
                      Container(
                        height: 40,
                        width: 4,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 40,
                        width: 4,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 40,
                        width: 4,
                        color: Colors.grey[300],
                      ),
                    ],
                  )),
                  DataCell(
                    Container(
                      height: 40,
                      width: 4,
                      color: Colors.grey[300],
                    ),
                  ),
                  DataCell(
                    Container(
                      height: 40,
                      width: 4,
                      color: Colors.grey[300],
                    ),
                  ),
                  DataCell(
                    Container(
                      height: 40,
                      width: 4,
                      color: Colors.grey[300],
                    ),
                  ),
                  DataCell(
                    Container(
                      height: 40,
                      width: 4,
                      color: Colors.grey[300],
                    ),
                  ),
                  DataCell(
                    Container(
                      height: 40,
                      width: 4,
                      color: Colors.grey[300],
                    ),
                  ),
                  DataCell(
                    Container(
                      height: 40,
                      width: 4,
                      color: Colors.grey[300],
                    ),
                  ),
                  DataCell(
                    Container(
                      height: 40,
                      width: 4,
                      color: Colors.grey[300],
                    ),
                  ),
                  DataCell(
                    Container(
                      height: 40,
                      width: 4,
                      color: Colors.grey[300],
                    ),
                  ),
                ]);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
