import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_mock/presentation/page/home_section/price_range_filter.dart';
import 'package:home_mock/presentation/page/home_section/sort_section.dart';

import '../../../core/locator.dart';
import '../../state/home/home_bloc.dart';
import '../../state/home/home_event.dart';
import 'city_filters.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
    required this.controller,
    required this.onFilterPressed,
  });

  final TextEditingController controller;
  final VoidCallback onFilterPressed;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomesBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 52,
        child: TextField(
          cursorHeight: 18,
          controller: controller,
          onChanged: (v) => bloc.add(HomesChangeQuery(v)),
          style: TextStyle(color: theme.sText),
          cursorColor: theme.primary,
          textInputAction: TextInputAction.search,
          autocorrect: false,
          enableSuggestions: false,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: 'Find your next home',
            hintStyle: TextStyle(color: theme.textMuted),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.search,
                color: theme.textMuted,
              ),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => _FiltersBottomSheet(),
                );
              },
              icon: Icon(
                Icons.filter_list_alt,
                size: 18,
                color: theme.textMuted,
              ),
            ),
            filled: true,
            fillColor: theme.sBgDark,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(
                color: theme.borderMuted,
                width: 0.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(
                color: theme.borderMuted,
                width: 0.5,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(
                color: theme.borderMuted,
                width: 0.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(
                color: theme.borderMuted,
                width: 0.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(
                color: theme.borderMuted,
                width: 0.5,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
    );
  }
}

class _FiltersBottomSheet extends StatelessWidget {
  const _FiltersBottomSheet();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: theme.bgDark,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.textMuted.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Filtros',
                      style: TextStyle(
                        color: theme.text,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.close,
                        color: theme.text,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 0.5,
                indent: 24,
                endIndent: 24,
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  children: const [
                    SortSection(),
                    SizedBox(height: 14),
                    CityFilters(),
                    SizedBox(height: 14),
                    PriceRangeFilter(),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
