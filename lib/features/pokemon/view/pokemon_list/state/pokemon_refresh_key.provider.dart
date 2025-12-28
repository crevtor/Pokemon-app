import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_refresh_key.provider.g.dart';

@riverpod
class PokemonRefreshKeyState extends _$PokemonRefreshKeyState {
  @override
  GlobalKey<RefreshIndicatorState> build() {
    return GlobalKey<RefreshIndicatorState>();
  }

  void refreshKeyState() {
    state.currentState?.show();
  }
}
