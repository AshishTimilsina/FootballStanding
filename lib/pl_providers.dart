import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laliga_standing/pl_service.dart';
import 'package:laliga_standing/pl_state.dart';

final plprovidersss =
    StateNotifierProvider<PremierLeagueProvider, PremierLeagueState>((ref) =>
        PremierLeagueProvider(
            PremierLeagueState.empty(), ref.watch(plserviceprov)));

class PremierLeagueProvider extends StateNotifier<PremierLeagueState> {
  final PremierLeagueService services;
  PremierLeagueProvider(super.state, this.services) {
    getdata();
  }
  Future<void> getdata() async {
    state = state.copyWith(
        errMessage: '', isError: false, isLoad: true, isSuccess: false, pl: []);
    final response = await services.getinfo();
    response.fold((l) {
      state = state.copyWith(
          errMessage: l,
          isError: true,
          isLoad: false,
          isSuccess: false,
          pl: []);
    }, (r) {
      state = state.copyWith(
        errMessage: '',
        isError: false,
        isLoad: false,
        isSuccess: true,
        pl: r,
      );
    });
  }
}
