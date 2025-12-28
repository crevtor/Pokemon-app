import 'package:pokemon/core/extensions/export_extensions.dart';
import 'package:pokemon/core/utils/export.utilities.dart';
import 'package:pokemon/core/view_models/export.view_models.dart';
// import 'package:pokemon/features/wallet/extensions/transactions_query.ext.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/core/widgets/export.widgets.dart';
import 'package:pokemon/core/resources/export.resources.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchFilterUi extends HookConsumerWidget {
  const SearchFilterUi({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final searchController = useTextEditingController();
    final debouncer = useMemoized(() => Debouncer(delay: slowDuration));
    final filters = ref.watch(pokemonListFiltersProvider);

    // final hasActiveFilter = ref.watch(pokemonListFiltersProvider
    //     .select((q) => q.hasActiveFiltersExcludingSearch));

    useEffect(() {
      final s = filters.searchTerm ?? '';
      if (searchController.text != s) {
        searchController.text = s;
      }
      return null;
    }, [filters.searchTerm]);

    // onChanged: debounce -> applySearch
    void onChanged(String value) {
      // schedule debounced application
      debouncer.run(() {
        ref.read(pokemonListFiltersProvider.notifier).setSearchTerm(value);
      });
    }

    // onSubmitted: apply immediately (enter key)
    void onSubmitted(String value) {
      debouncer.cancel();
      ref.read(pokemonListFiltersProvider.notifier).setSearchTerm(value);
    }

    return Row(
      children: [
        Expanded(
          child: SearchFieldUi(
            controller: searchController,
            animationOffset: 200,
            containerMargin: zeroPadding,
            onChanged: onChanged,
            onFieldSubmitted: onSubmitted,
          ),
        ),
        Gap(8),
        Bounce(
          onTap: () {
            debouncer.cancel();
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: white,
              border: Border.all(color: grayScale10),
              borderRadius: BorderRadius.all(smallRadius10),
            ),
            alignment: Alignment.center,
            child: SmartMedia.assetSvg(filterListIcon,
              color: charcoal500),
          ),
        )
      ],
    );
  }
}
