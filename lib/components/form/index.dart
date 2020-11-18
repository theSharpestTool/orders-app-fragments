import 'package:flutter/material.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/style/index.dart';

class InputLabel extends StatelessWidget {
  final String text;
  final Color textColor;

  InputLabel(this.text, {this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.only(left: 10),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? GKColors.blue,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}

class DropDown1<T> extends StatelessWidget {
  DropDown1({
    @required this.items,
    this.value,
    this.onChanged,
    this.decoration = const InputDecoration(),
    this.onSaved,
    this.hint,
  });

  final List<DropdownMenuItem<T>> items;
  final T value;
  final Function onChanged;
  final InputDecoration decoration;
  final FormFieldSetter<T> onSaved;
  final Widget hint;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        onChanged: onChanged,
        onSaved: onSaved,
        hint: hint,
        items: items,
        decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.black87),
            isDense: true,
            contentPadding: EdgeInsets.all(10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderDim.borderRadius,
              borderSide:
                  BorderSide(color: BorderDim.color, width: BorderDim.width),
            ),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: BorderDim.color, width: BorderDim.width),
            )));
  }
}

class DropDown<T> extends DropdownButtonFormField<T> {
  DropDown({
    @required List<DropdownMenuItem<T>> items,
    Key key,
    T value,
    onChanged,
    InputDecoration decoration = const InputDecoration(),
    FormFieldSetter<T> onSaved,
    FormFieldValidator<T> validator,
    Widget hint,
  }) : super(
          key: key,
          onChanged: onChanged,
          onSaved: onSaved,
          validator: validator,
          hint: hint,
          items: items,
          decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.black87),
              isDense: true,
              contentPadding: EdgeInsets.all(10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderDim.borderRadius,
                borderSide:
                    BorderSide(color: BorderDim.color, width: BorderDim.width),
              ),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: BorderDim.color, width: BorderDim.width),
              )),
        );
}
