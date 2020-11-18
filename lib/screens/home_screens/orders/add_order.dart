import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/components/app_app_bar/custom_app_bar.dart';
import 'package:orders_app/components/buttons/gk_button.dart';
import 'package:orders_app/components/dialogs/gk_dialog.dart';
import 'package:orders_app/components/form/index.dart';
import 'package:orders_app/components/gallery_view/gallery_view.dart';
import 'package:orders_app/components/text_fields/select_field.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/order_store/order_model_store.dart';
import 'package:orders_app/style/index.dart';

class AddOrderScreen extends StatefulWidget {
  static final String name = '/add_order';
  @override
  _AddOrderScreenState createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  OrderModelStore _order = OrderModelStore.plain();

  @override
  void initState() {
    super.initState();
    unitStore.load();
  }

  String checkForMissingValues() {
    if (_order.unit == null)
      return 'Unit is missed';
    else if (_order.service == null)
      return 'Service is missed';
    else if (_order.subservice == null)
      return 'Subservice is missed';
    else if (_order.fault == null)
      return 'Problem is missed';
    else
      return null;
  }

  Future<void> onSubmit() async {
    final missedValue = checkForMissingValues();
    if (missedValue != null) {
      await GKDialog.show(
        context: context,
        reason: DialogReason.error,
        text: missedValue,
      );
      return;
    }

    final response = await _order.create().catchError((e) async {
      await GKDialog.show(
        context: context,
        reason: DialogReason.error,
        text: e is DioError ? e.response.data.toString() : 'Error: $e',
      );
      return;
    });
    if (response != null && response.statusCode == 200) {
      await GKDialog.show(
        context: context,
        reason: DialogReason.success,
        text: 'You successfully send your order',
      );
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    unitStore.clear();
    serviceStore.clear();
    subServiceStore.clear();
    faultStore.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: customAppBar(title: "Add Order", context: context),
        body: SingleChildScrollView(
          child: Observer(
            builder: (_) => Container(
              padding: EdgeDim.containerPad,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InputLabel("Select A Unit"),
                  SelectField(
                    loading: unitStore.loading,
                    items: unitStore.data,
                    value: _order.unit,
                    onChanged: (unit) {
                      _order.setUnit(unit);
                      serviceStore.loadByUnit(unit.id);
                    },
                  ),
                  InputLabel("Select A Service"),
                  SelectField(
                    loading: serviceStore.loading,
                    value: _order.service,
                    items: serviceStore.data,
                    onChanged: (service) {
                      _order.setService(service);
                      subServiceStore.loadByService(
                        serviceId: service.id,
                        unitId: _order.unit.id,
                      );
                    },
                  ),
                  InputLabel("Select A Subservice"),
                  SelectField(
                    loading: subServiceStore.loading,
                    value: _order.subservice,
                    items: subServiceStore.data,
                    onChanged: (subservice) {
                      _order.setSubService(subservice);
                      faultStore.loadBySubService(subservice.id);
                    },
                  ),
                  InputLabel("Select A Problem"),
                  SelectField(
                    loading: faultStore.loading,
                    value: _order.fault,
                    items: faultStore.data,
                    onChanged: _order.setProblem,
                  ),
                  InputLabel("Timeline"),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 15.0),
                    child: Text(
                      _order.fault != null
                          ? "${_order.fault.daysToDueDate.round()} Day(s)"
                          : "Please Select A Problem",
                      style: TextStyle(
                          fontSize: 20,
                          color: GKColors.green,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  InputLabel("Add A Description"),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      onChanged: _order.setDescription,
                      maxLines: 8,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Write Something',
                        contentPadding: EdgeInsets.all(10),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: CardGalleryView(order: _order),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeDim.containerPad,
                    child: GKButton(
                      text: "CREATE",
                      onTap: onSubmit,
                      loading: _order.loading,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
