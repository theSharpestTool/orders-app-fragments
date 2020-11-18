import 'package:orders_app/config/api.dart';
import 'package:orders_app/services/index.dart';
import 'package:orders_app/stores/site_store/site_model_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_list_store.dart';
part 'site_store.g.dart';

class SiteStore = _SiteStore with _$SiteStore;

abstract class _SiteStore extends BaseListStore<SiteModelStore> with Store {
  @override
  String get cacheKey => 'site';

  @override
  Service service = siteService;

  @override
  SiteModelStore createNew(Map<String, dynamic> data) {
    return SiteModelStore(data);
  }

  @override
  Future<List> downloadData() async {
    final response = await api.post('/api/Sites/siteinfo');
    return response.data;
  }
}
