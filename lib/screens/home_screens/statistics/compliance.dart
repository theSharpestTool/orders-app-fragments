import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/components/card_info/card_info.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/stores/compliance_store/compliance_model_store.dart';

class ComplianceGraph extends StatelessWidget {
  final ComplianceModelStore ppmCompliance;

  ComplianceGraph(this.ppmCompliance);

  final Map<String, Color> ppmTaskColor = {
    'Pending': GKColors.yellow,
    'Completed': GKColors.green,
    'Delayed': Colors.red,
  };

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20),
            child: CupertinoSegmentedControl<ChartData>(
              selectedColor: GKColors.green,
              borderColor: GKColors.green,
              pressedColor: GKColors.green.withOpacity(0.1),
              children: <ChartData, Widget>{
                ppmCompliance.month: Text("Month"),
                ppmCompliance.quater: Text("Quarter"),
                ppmCompliance.year: Text("Year"),
              },
              onValueChanged: ppmCompliance.statsChanged,
              groupValue: ppmCompliance.current,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    for (final ppm in ppmCompliance.current.asList)
                      CardInfo(
                        text: '${ppm.task} - ${ppm.amount}',
                      ),
                  ],
                ),
              ),
              Container(
                height: 250,
                width: 250,
                child: charts.PieChart(
                  [
                    charts.Series<TaskAmount, String>(
                        id: 'Sales2',
                        colorFn: (ppm, __) {
                          return charts.ColorUtil.fromDartColor(
                              ppmTaskColor[ppm.task]);
                        },
                        domainFn: (ppm, _) => ppm.task,
                        measureFn: (ppm, _) => ppm.amount,
                        data: ppmCompliance.current.asList,
                        labelAccessorFn: (ppm, _) => ppm.amount.toString())
                  ],
                  defaultRenderer: charts.ArcRendererConfig(
                    arcRendererDecorators: [
                      charts.ArcLabelDecorator(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}