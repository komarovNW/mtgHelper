import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/models/scg_card_model.dart';
import 'package:mtg_helper/features/price/price_scg/price_scg_cubit.dart';
import 'package:mtg_helper/features/price/price_scg/price_scg_state.dart';
import 'package:mtg_helper/widgets/app_box.dart';
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
          failure: (_) => const AppError(),
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.list});
  final List<SCGCardModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const HBox(8),
                Text(list[index].set),
                ...list[index].cards.map(
                      (SCGDataModel item) => Row(
                        children: <Widget>[
                          Text('${item.condition}: '),
                          Text('${item.price.toString()} \$'),
                        ],
                      ),
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}
