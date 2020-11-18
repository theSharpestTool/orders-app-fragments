import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orders_app/components/loading_indicator/gk_loader.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/screens/home_screens/statistics/budget_per_site.dart';
import 'package:orders_app/screens/home_screens/statistics/compliance.dart';
import 'package:orders_app/stores/site_store/site_model_store.dart';

class Statistics extends StatelessWidget {
  final SiteModelStore site;

  const Statistics({@required this.site});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Container(
              color: GKColors.green.withOpacity(0.05),
              child: TabBar(
                indicatorColor: GKColors.green,
                labelColor: GKColors.green,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(text: 'Work Budget'),
                  Tab(text: 'PPM'),
                  Tab(text: 'SLA'),
                ],
              ),
            ),
          ),
          Container(
            height: 380,
            child: Observer(
              builder: (_) => TabBarView(
                children: [
                  site.loadingBudgets
                      ? PaddedLoader()
                      : BudgetPerSiteGraph(site.budgetPerSite),
                  site.loadingPPM
                      ? PaddedLoader()
                      : ComplianceGraph(site.ppmComplianceModel),
                  site.loadingSLA
                      ? PaddedLoader()
                      : ComplianceGraph(site.slaComplianceModel),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PaddedLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(165.0),
      child: GKLoader(),
    );
  }
}
