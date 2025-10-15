import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/locator.dart';
import '../../state/home/home_bloc.dart';
import '../../state/home/home_event.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomesBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        onChanged: (v) => bloc.add(HomesChangeQuery(v)),
        style: TextStyle(color: theme.text),
        cursorColor: theme.primary,
        textInputAction: TextInputAction.search,
        autocorrect: false,
        enableSuggestions: false,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: 'Find your next home',
          hintStyle: TextStyle(color: theme.textMuted),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Icon(
              Icons.search,
              color: theme.primary,
            ),
          ),
          filled: true,
          fillColor: theme.bgLight,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
