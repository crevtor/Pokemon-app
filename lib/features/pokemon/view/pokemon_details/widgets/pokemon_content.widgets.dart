part of 'export.widgets.dart';

class PokemonContentUi extends HookConsumerWidget {
  const PokemonContentUi({super.key, required this.item});

  final PokemonListItem item;

  @override
  Widget build(BuildContext context, ref) {
    final tabController = useTabController(
        initialLength: PokemonTabEnum.values.length,
        initialIndex: 0
    );

    final pageIndex = useState<int>(tabController.index);

    useEffect(() {
      void listener() => pageIndex.value = tabController.index;
      tabController.addListener(listener);
      return () => tabController.removeListener(listener);
    }, [tabController]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: baseViewPaddingBig,
          child: SegmentedTabBar(
            controller: tabController,
            labels: PokemonTabEnum.values.map((e) => e.tabText).toList(),
            unselectedColor: secondary450,
            selectedColor: primary500,
            unselectedTextStyle: tabLabelStyle,
            selectedTextStyle: tabLabelStyle.copyWith(fontWeight: mediumText),
            onSegmentSelected: (index) {
              pageIndex.value = index;
            },
          ),
        ),
        BorderBoxUi(
          height: 284,
          shadowOffset: Offset(3.95, 7.47),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: TabBarView(
              controller: tabController,
              children: [
                InfoTabUi(item: item),
                AbilityTabUi(item: item),
              ],
            ),
          ),
        )

      ],
    );
  }
}

