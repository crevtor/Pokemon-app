import 'package:flutter/material.dart';
import 'package:pokemon/core/extensions/string.extension.dart';
import 'package:pokemon/core/widgets/export.widgets.dart';

enum PokemonTabEnum {
  info('Info'),
  abilities('Abilities');

  const PokemonTabEnum(this.tabText);
  final String tabText;

  @override
  String toString() => tabText.capitalize;
}