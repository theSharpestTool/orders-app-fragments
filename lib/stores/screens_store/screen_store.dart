import 'package:orders_app/screens/home_screens/screen_manager.dart';
import 'package:mobx/mobx.dart';

part 'screen_store.g.dart';

class ScreenStore = _ScreenStore with _$ScreenStore;

abstract class _ScreenStore with Store {
  @observable
  List<ScreenManager> screens = [];

  @observable
  int currentIndex = 0;

  @observable
  bool searchFieldOpen = false;

  @computed
  ScreenManager get currentScreen => screens[currentIndex];

  void setScreens(List<ScreenManager> screens) => this.screens = screens;

  @action
  void setScreenByIndex(int index) {
    openSearchFiled(false);
    currentIndex = index;
  }

  @action
  void openSearchFiled(bool open) {
    if (!open) currentScreen.store?.clearSearchResults();
    searchFieldOpen = open;
  }

  @action
  void setScreenByTitle(String title) {
    final index = screens.indexWhere((screen) => screen.title == title);
    if (index != -1) {
      currentIndex = index;
    }
  }
}
