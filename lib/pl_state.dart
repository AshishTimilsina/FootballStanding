import 'package:laliga_standing/pl.dart';

class PremierLeagueState {
  final bool isError;
  final bool isSuccess;
  final String errMessage;
  final bool isLoad;
  final List<PremierLeague> pl;
  PremierLeagueState({
    required this.isError,
    required this.isSuccess,
    required this.errMessage,
    required this.isLoad,
    required this.pl,
  });

  PremierLeagueState copyWith({
    bool? isError,
    bool? isSuccess,
    String? errMessage,
    bool? isLoad,
    List<PremierLeague>? pl,
  }) {
    return PremierLeagueState(
      isError: isError ?? this.isError,
      isSuccess: isSuccess ?? this.isSuccess,
      errMessage: errMessage ?? this.errMessage,
      isLoad: isLoad ?? this.isLoad,
      pl: pl ?? this.pl,
    );
  }

  factory PremierLeagueState.empty() {
    return PremierLeagueState(
      isError: false,
      isSuccess: false,
      errMessage: '',
      isLoad: true,
      pl: [],
    );
  }
}
