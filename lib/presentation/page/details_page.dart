import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/app_spacing.dart';
import '../../core/locator.dart';
import '../state/home/home_bloc.dart';
import '../state/home/home_state.dart';
import '../widget/details/price_bottom_sheet.dart';
import 'details_section/owner_card.dart';
import 'details_section/property_description.dart';
import 'details_section/property_features.dart';
import 'details_section/property_header.dart';
import 'details_section/property_title_section.dart';

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
                      AppSpacing.gapHuge,
                      PropertyTitleSection(item: item),
                      AppSpacing.gapHuge,
                      PropertyFeatures(item: item),
                      AppSpacing.gapExtraLarge,
                      OwnerCard(owner: item.owner),
                      AppSpacing.gapExtraLarge,
                      PropertyDescription(description: item.description),
                      AppSpacing.gapMega,
                      AppSpacing.gapGiant,
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
