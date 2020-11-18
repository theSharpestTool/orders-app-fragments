import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/icons/orders_app_icons_icons.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';

class SearchField extends StatelessWidget {
  final FutureOr<Iterable<BaseModelStore>> Function(String) suggestionsCallback;
  final void Function(BaseModelStore) onSuggestionSelected;
  final void Function() onClose;
  final _controller = TextEditingController();

  SearchField({
    this.suggestionsCallback,
    this.onSuggestionSelected,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: GKColors.darkGrey),
      child: TypeAheadField<BaseModelStore>(
        textFieldConfiguration: TextFieldConfiguration(
          controller: _controller,
          cursorColor: GKColors.green,
          decoration: InputDecoration(
            hintText: 'Type Something',
            suffixIcon: onClose == null
                ? Icon(OrdersAppIcons.search)
                : InkWell(
                    child: Icon(
                      Icons.close,
                      color: Colors.black45,
                    ),
                    onTap: onClose,
                  ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        ),
        hideOnEmpty: true,
        hideOnLoading: true,
        suggestionsCallback: (pattern) {
          if (suggestionsCallback != null)
            return suggestionsCallback(pattern);
          else
            return [];
        },
        //getImmediateSuggestions: onSuggestionSelected != null,
        onSuggestionSelected: (item) {
          if (onSuggestionSelected != null) {
            _controller.clear();
            onSuggestionSelected(item);
          }
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion.name),
          );
        },
      ),
    );
  }
}
