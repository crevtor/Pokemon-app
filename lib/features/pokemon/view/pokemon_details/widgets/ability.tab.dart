part of 'export.widgets.dart';

class AbilityTabUi extends HookConsumerWidget {
  const AbilityTabUi({super.key, required this.item});

  final PokemonListItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useAutomaticKeepAlive(wantKeepAlive: true);
    final details = ref.watch(pokemonDetailsProvider(item.id));
    final data = details.value;

    return ListView(
      padding: EdgeInsets.only(top: 20, left: 20),
      children: [
        KeyValueUi(
          title: 'Abilities',
          value: data != null && data.abilityNames.isNotEmpty
              ? data.abilityNames.join(', ') : '...',
        ),
      ],
    );
  }
}
