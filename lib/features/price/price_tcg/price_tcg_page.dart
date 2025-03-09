import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/models/scryfall_card_model.dart';
import 'package:mtg_helper/features/price/price_tcg/components/price_tcg_card.dart';
import 'package:mtg_helper/features/price/price_tcg/price_tcg_cubit.dart';
import 'package:mtg_helper/features/price/price_tcg/price_tcg_state.dart';

import 'package:mtg_helper/widgets/app_error.dart';
import 'package:mtg_helper/widgets/app_loader.dart';

class PriceTCGPage extends StatelessWidget {
  const PriceTCGPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<PriceTCGCubit>().loadPrice();
      },
      child: BlocConsumer<PriceTCGCubit, PriceTCGState>(
        listener: (BuildContext context, PriceTCGState state) {},
        builder: (BuildContext context, PriceTCGState state) {
          return state.map(
            success: (PriceTCGSuccess state) => _Body(
              list: state.list,
            ),
            loading: (_) => const AppLoader(),
            failure: (PriceTCGFailure state) => AppError(error: state.error),
          );
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.list});
  final List<ScryfallCardModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return PriceTCGCard(item: list[index]);
      },
    );
  }
}
