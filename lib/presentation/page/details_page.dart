import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/locator.dart';
import '../state/home/home_bloc.dart';
import '../state/home/home_state.dart';
import '../widget/details/owner_card.dart';
import '../widget/details/price_bottom_sheet.dart';
import '../widget/details/property_description.dart';
import '../widget/details/property_features.dart';
import '../widget/details/property_header.dart';
import '../widget/details/property_title_section.dart';

class DetailsPage extends StatelessWidget {
  final String itemId;

  const DetailsPage({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomesBloc, HomesState>(
      builder: (context, state) {
        final item = state.items.firstWhere((e) => e.id == itemId);

        return Scaffold(
          backgroundColor: theme.bgDark,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PropertyHeader(item: item),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      PropertyTitleSection(item: item),
                      const SizedBox(height: 20),
                      PropertyFeatures(item: item),
                      const SizedBox(height: 24),
                      OwnerCard(owner: item.owner),
                      const SizedBox(height: 24),
                      PropertyDescription(description: item.description),
                      const SizedBox(height: 110),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomSheet: PriceBottomSheet(price: item.price),
        );
      },
    );
  }
}
