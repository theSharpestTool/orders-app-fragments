// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScreenStore on _ScreenStore, Store {
  Computed<ScreenManager> _$currentScreenComputed;

  @override
  ScreenManager get currentScreen => (_$currentScreenComputed ??=
          Computed<ScreenManager>(() => super.currentScreen))
      .value;

  final _$screensAtom = Atom(name: '_ScreenStore.screens');

  @override
  List<ScreenManager> get screens {
    _$screensAtom.context.enforceReadPolicy(_$screensAtom);
    _$screensAtom.reportObserved();
    return super.screens;
  }

  @override
  set screens(List<ScreenManager> value) {
    _$screensAtom.context.conditionallyRunInAction(() {
      super.screens = value;
      _$screensAtom.reportChanged();
    }, _$screensAtom, name: '${_$screensAtom.name}_set');
  }

  final _$currentIndexAtom = Atom(name: '_ScreenStore.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.context.enforceReadPolicy(_$currentIndexAtom);
    _$currentIndexAtom.reportObserved();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.context.conditionallyRunInAction(() {
      super.currentIndex = value;
      _$currentIndexAtom.reportChanged();
    }, _$currentIndexAtom, name: '${_$currentIndexAtom.name}_set');
  }

  final _$searchFieldOpenAtom = Atom(name: '_ScreenStore.searchFieldOpen');

  @override
  bool get searchFieldOpen {
    _$searchFieldOpenAtom.context.enforceReadPolicy(_$searchFieldOpenAtom);
    _$searchFieldOpenAtom.reportObserved();
    return super.searchFieldOpen;
  }

  @override
  set searchFieldOpen(bool value) {
    _$searchFieldOpenAtom.context.conditionallyRunInAction(() {
      super.searchFieldOpen = value;
      _$searchFieldOpenAtom.reportChanged();
    }, _$searchFieldOpenAtom, name: '${_$searchFieldOpenAtom.name}_set');
  }

  final _$_ScreenStoreActionController = ActionController(name: '_ScreenStore');

  @override
  void setScreenByIndex(int index) {
    final _$actionInfo = _$_ScreenStoreActionController.startAction();
    try {
      return super.setScreenByIndex(index);
    } finally {
      _$_ScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void openSearchFiled(bool open) {
    final _$actionInfo = _$_ScreenStoreActionController.startAction();
    try {
      return super.openSearchFiled(open);
    } finally {
      _$_ScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setScreenByTitle(String title) {
    final _$actionInfo = _$_ScreenStoreActionController.startAction();
    try {
      return super.setScreenByTitle(title);
    } finally {
      _$_ScreenStoreActionController.endAction(_$actionInfo);
    }
  }
}
