import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';
import 'package:orders_app/style/dimensions.dart';
import 'package:mobx/mobx.dart';

class SelectField<T extends BaseModelStore> extends StatelessWidget {
  final T value;
  final ObservableList<T> items;
  final Function(T) onChanged;
  final bool loading;

  SelectField({this.value, this.items, this.onChanged, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        margin: EdgeInsets.only(bottom: 20),
        child: DropdownButtonFormField<T>(
          elevation: 1,
          isExpanded: true,
          iconEnabledColor: Colors.green,
          icon: loading
              ? Container(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    backgroundColor: GKColors.green,
                  ),
                )
              : Icon(Icons.keyboard_arrow_down, size: 30), //,
          decoration: Decorations.inputDecoraion,
          value: value,
          items: items != null
              ? items
                  .map((fault) => DropdownMenuItem(
                        value: fault,
                        child: Text(fault.name),
                      ))
                  .toList()
              : [],
          onChanged: onChanged,
        ),
      ),
    );
  }
}
