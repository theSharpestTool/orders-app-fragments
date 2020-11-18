import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:orders_app/stores/budget_per_site_store/budget_per_site_model_store.dart';
import 'package:mobx/mobx.dart';

class BudgetPerSiteGraph extends StatelessWidget {
  final BudgetPerSiteModelStore budget;

  BudgetPerSiteGraph(this.budget);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 20),
            child: CupertinoSegmentedControl<ObservableList<TimeValue>>(
              children: <ObservableList<TimeValue>, Widget>{
                budget.monthlyStats: Text("Monthly"),
                budget.quaterlyStats: Text("Quarterly"),
                budget.yearlyStats: Text("Annually"),
              },
              onValueChanged: budget.statsChanged,
              groupValue: budget.currentStats,
            ),
          ),
          budget.currentStatsIsEmpty
              ? Container(
                padding: EdgeInsets.all(30),
                  child: Text(
                    'No Data',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    height: 300,
                    width: budget.currentStats.length.toDouble() * 90 + 40,
                    child: charts.BarChart(
                      [
                        charts.Series<TimeValue, String>(
                            id: 'Sales',
                            domainFn: (TimeValue v, _) => v.time,
                            measureFn: (TimeValue v, _) => v.value,
                            data: budget.currentStats,
                            labelAccessorFn: (TimeValue v, _) =>
                                '₦${v.value.toInt().toString()}')
                      ],
                      barRendererDecorator: charts.BarLabelDecorator<String>(),
                      domainAxis: charts.OrdinalAxisSpec(),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
