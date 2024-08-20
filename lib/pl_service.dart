import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laliga_standing/pl.dart';
import 'package:dartz/dartz.dart';

final plserviceprov = Provider((ref) => PremierLeagueService());

class PremierLeagueService {
  final dio = Dio();
  Future<Either<String, List<PremierLeague>>> getinfo() async {
    try {
      final response =
          await dio.get('https://premier-league-standings1.p.rapidapi.com/',
              options: Options(headers: {
                "X-RapidAPI-Key":
                    "2488c82492mshebb818e0d01b786p139d76jsnb77fff15b6b2",
                "X-RapidAPI-Host": "premier-league-standings1.p.rapidapi.com",
              }));
      print(response.data);
      final extracteddata = (response.data as List)
          .map((e) => PremierLeague.fromJson(e))
          .toList();
      return Right(extracteddata);
    } on DioException catch (err) {
      return Left(err.toString());
    }
  }
}
