import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pokemon/core/network/api_lock/export.api_lock.dart';
import 'package:pokemon/core/resources/export.resources.dart';
import 'package:pokemon/core/widgets/export.widgets.dart';
import 'package:pokemon/core/view_models/export.view_models.dart';
import 'package:pokemon/features/pokemon/data/responses/pokemon_list.model.dart';
import 'package:pokemon/features/pokemon/view/pokemon_list/widgets/pokemon_card.widget.dart';

class PokemonListPageUi extends HookConsumerWidget {
  const PokemonListPageUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ApiFetchKey.pokemon.idWith();
    final headerSize = useState<Size>(Size.zero);
    final data = ref.watch(requestStateProvider(RequestStateParams(key: id)));
    final isInitialLoading = !data.hasData && data.isLoading;

    return SwipeScaffold(
      backgroundColor: secondary450,
      dismissDirection: DismissiblePageDismissDirection.none,
      refreshEdgeOffset: headerSize.value.height,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          if(isInitialLoading) ...[
            const PokemonListLoaderUi()
          ] else ...[
            ref.watch(pokemonListProvider).when(
              loading: () => PokemonListLoaderUi(),
              error: (e, st) => EmptyListUi(
                message: e.toString(),
                topMargin: EdgeInsets.only(top: headerSize.value.height + 78),
              ),
              data: (items) {
                if (items == null) return const SizedBox.shrink();
                final products = items.results;
                if (products == null) return const SizedBox.shrink();
                if (products.isEmpty) {
                  return EmptyListUi(
                    message: AppConstants.emptyPokemonList,
                    topMargin: EdgeInsets.only(top: headerSize.value.height + 78),
                  );
                }

                return buildSearchList(
                  ref.watch(pokemonListFiltersProvider).searchTerm ?? '',
                  products,
                  headerSize.value.height + 24,
                );
              },
            ),
          ],
          GlassBackNavBar(
            widgetDimension: (value) => headerSize.value = value,
            pageName: AppConstants.pokemonTitle,
            showBackButton: false,
            useFadeAnimation: false,
            subWidget: SearchFilterUi(),
          ),
        ],
      ),
    );
  }

  Widget buildSearchList(String query, List<PokemonListItem> list, double topMargin) {
    final List<PokemonListItem> suggestionList = query.isEmpty ? list
        : list.where((PokemonListItem item) {
      String getValueName = item.name?.toLowerCase() ?? '';
      String queryText = "";
      queryText = query.toLowerCase();
      bool matchesCategoryName = getValueName.contains(queryText);
      return (matchesCategoryName);
    }).toList();

    return Consumer(
        builder: (context, ref, child) {
          final notifier = ref.read(pokemonListNotifierProvider.notifier);
          return LazyLoadScrollView(
            onEndOfPage: notifier.loadMore,
            scrollOffset: 300,
            child: RefreshIndicator.adaptive(
              onRefresh: () async {
                await ref.refresh(pokemonListNotifierProvider.future);
              },
              edgeOffset: topMargin,
              child: ListView.separated(
                padding: EdgeInsets.only(
                  bottom: 100,
                  top: topMargin,
                ),
                separatorBuilder: (context, index) => const Gap(14),
                itemCount: suggestionList.length,
                itemBuilder: (context, index) {
                  if (index < suggestionList.length) {
                    final item = suggestionList[index];
                    return PokemonCardUi(
                      item: item,
                      animationOffset: index * 50,
                    );
                  }

                  if (!notifier.hasMore) {
                    return const SizedBox(height: 48);
                  }

                  return Center(
                    child: SpinKitThreeBounce(
                      color: white,
                      size: 17,
                    ),
                  );
                },
              ),
            ),
          );
        }
    );
  }
}
