import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/models/scg_card_model.dart';
import 'package:mtg_helper/features/price/price_scg/components/price_scg_card.dart';
import 'package:mtg_helper/features/price/price_scg/price_scg_cubit.dart';
import 'package:mtg_helper/features/price/price_scg/price_scg_state.dart';
import 'package:mtg_helper/widgets/app_error.dart';
import 'package:mtg_helper/widgets/app_loader.dart';

class PriceSCGPage extends StatefulWidget {
  const PriceSCGPage({super.key});

  @override
  State<PriceSCGPage> createState() => _PriceSCGPageState();
}

class _PriceSCGPageState extends State<PriceSCGPage> {
  @override
  void initState() {
    context.read<PriceSCGCubit>().loadPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PriceSCGCubit, PriceSCGState>(
      listener: (BuildContext context, PriceSCGState state) {},
      builder: (BuildContext context, PriceSCGState state) {
        return state.map(
          success: (PriceSCGSuccess state) => _Body(list: state.list),
          loading: (_) => const AppLoader(),
          failure: (PriceSCGFailure state) => AppError(error: state.error),
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.list});
  final List<ScgCardsModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return SCGCard(item: list[index].card);
      },
    );
  }
}
