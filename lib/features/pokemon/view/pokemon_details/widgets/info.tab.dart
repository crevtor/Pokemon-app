part of 'export.widgets.dart';

class InfoTabUi extends HookConsumerWidget {
  const InfoTabUi({super.key, required this.item});

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
          title: 'Name',
          value: item.name?.capitalize ?? '...',
        ),
        Gap(8),
        KeyValueUi(
          title: 'Weight',
          value: '${data?.weight?.toString() ?? '...'}kg',
        ),
        Gap(8),
        KeyValueUi(
          title: 'Height',
          value: '${data?.height?.toString() ?? '...'}m',
        ),
        Gap(8),
        KeyValueUi(
          title: 'Type',
          value: data != null && data.typeNames.isNotEmpty
              ? data.typeNames.join(', ') : '...',
        ),
      ],
    );
  }
}
