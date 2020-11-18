import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/components/app_app_bar/index.dart';
import 'package:orders_app/components/buttons/gk_button.dart';
import 'package:orders_app/components/form/index.dart';
import 'package:orders_app/stores/index.dart';
import 'package:orders_app/stores/site_store/site_model_store.dart';
import 'package:orders_app/stores/unit_store/unit_model_store.dart';
import 'package:orders_app/style/icons.dart';
import 'package:orders_app/style/index.dart';

class AddressAdditor extends StatefulWidget {
  @override
  _AddressAdditorState createState() => _AddressAdditorState();
}

class _AddressAdditorState extends State<AddressAdditor> {
  SiteModelStore selectedSite;
  UnitModelStore selectedUnit;

  @override
  void initState() {
    siteStore.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Scaffold(
              appBar: customAppBar(context: context, title: "Add a New Site"),
              body: Container(
                color: Colors.white,
                padding: EdgeDim.containerPad,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    InputLabel("Select a site"),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: DropdownButtonFormField<SiteModelStore>(
                        icon: GKIcons.arrowDown,
                        decoration: Decorations.inputDecoraion,
                        onChanged: (v) {
                          setState(() => selectedSite = v);
                        },
                        value: selectedSite,
                        items: siteStore.data
                            .map((site) => DropdownMenuItem<SiteModelStore>(
                                  value: site,
                                  child: Text(site.name),
                                ))
                            .toList(),
                      ),
                    ),
                    InputLabel("Select a unit"),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: DropdownButtonFormField<UnitModelStore>(
                        icon: GKIcons.arrowDown,
                        decoration: Decorations.inputDecoraion,
                        onChanged: (v) => setState(() => selectedUnit = v),
                        value: selectedUnit,
                        items: selectedSite != null
                            ? selectedSite.units
                                .map(
                                  (unit) => DropdownMenuItem(
                                    value: unit,
                                    child: Text(unit.name),
                                  ),
                                )
                                .toList()
                            : [],
                      ),
                    ),
                    GKButton(
                      text: 'ORDER APPROVAL',
                      loading: selectedUnit != null && selectedUnit.loading,
                      onTap: () async {
                        await selectedUnit.assign(
                          onError: (error) {
                            print(error);
                            // GKDialog.show(
                            //   context: context,
                            //   reason: DialogReason.error,
                            //   text: error.response.data,
                            // );
                          },
                        );

                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ));
  }
}
