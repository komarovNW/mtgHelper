import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/models/singles_card_model.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/features/price/price_singles/components/price_singles_card.dart';
import 'package:mtg_helper/features/price/price_singles/price_singles_cubit.dart';
import 'package:mtg_helper/features/price/price_singles/price_singles_state.dart';
import 'package:mtg_helper/widgets/app_error.dart';
import 'package:mtg_helper/widgets/app_loader.dart';

class PriceSinglesPage extends StatelessWidget {
  const PriceSinglesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<PriceSinglesCubit>().loadPrice();
      },
      child: BlocConsumer<PriceSinglesCubit, PriceSinglesState>(
        listener: (BuildContext context, PriceSinglesState state) {},
        builder: (BuildContext context, PriceSinglesState state) {
          return state.map(
            success: (PriceSinglesSuccess state) => _Body(list: state.list),
            loading: (_) => const AppLoader(),
            failure: (PriceSinglesFailure state) =>
                AppError(error: state.error),
          );
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.list});
  final List<SinglesCardModel> list;

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? Center(
            child: Text(context.l10n.empty),
          )
        : ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return SingleCard(item: list[index]);
            },
          );
  }
}
