// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_service_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SiteServiceModelStore on _SiteServiceModelStore, Store {
  final _$siteIdAtom = Atom(name: '_SiteServiceModelStore.siteId');

  @override
  String get siteId {
    _$siteIdAtom.context.enforceReadPolicy(_$siteIdAtom);
    _$siteIdAtom.reportObserved();
    return super.siteId;
  }

  @override
  set siteId(String value) {
    _$siteIdAtom.context.conditionallyRunInAction(() {
      super.siteId = value;
      _$siteIdAtom.reportChanged();
    }, _$siteIdAtom, name: '${_$siteIdAtom.name}_set');
  }

  final _$siteAtom = Atom(name: '_SiteServiceModelStore.site');

  @override
  SiteModelStore get site {
    _$siteAtom.context.enforceReadPolicy(_$siteAtom);
    _$siteAtom.reportObserved();
    return super.site;
  }

  @override
  set site(SiteModelStore value) {
    _$siteAtom.context.conditionallyRunInAction(() {
      super.site = value;
      _$siteAtom.reportChanged();
    }, _$siteAtom, name: '${_$siteAtom.name}_set');
  }

  final _$serviceAtom = Atom(name: '_SiteServiceModelStore.service');

  @override
  ServiceModelStore get service {
    _$serviceAtom.context.enforceReadPolicy(_$serviceAtom);
    _$serviceAtom.reportObserved();
    return super.service;
  }

  @override
  set service(ServiceModelStore value) {
    _$serviceAtom.context.conditionallyRunInAction(() {
      super.service = value;
      _$serviceAtom.reportChanged();
    }, _$serviceAtom, name: '${_$serviceAtom.name}_set');
  }

  final _$serviceTypeAtom = Atom(name: '_SiteServiceModelStore.serviceType');

  @override
  int get serviceType {
    _$serviceTypeAtom.context.enforceReadPolicy(_$serviceTypeAtom);
    _$serviceTypeAtom.reportObserved();
    return super.serviceType;
  }

  @override
  set serviceType(int value) {
    _$serviceTypeAtom.context.conditionallyRunInAction(() {
      super.serviceType = value;
      _$serviceTypeAtom.reportChanged();
    }, _$serviceTypeAtom, name: '${_$serviceTypeAtom.name}_set');
  }

  final _$scheduleAtom = Atom(name: '_SiteServiceModelStore.schedule');

  @override
  ScheduleModelStore get schedule {
    _$scheduleAtom.context.enforceReadPolicy(_$scheduleAtom);
    _$scheduleAtom.reportObserved();
    return super.schedule;
  }

  @override
  set schedule(ScheduleModelStore value) {
    _$scheduleAtom.context.conditionallyRunInAction(() {
      super.schedule = value;
      _$scheduleAtom.reportChanged();
    }, _$scheduleAtom, name: '${_$scheduleAtom.name}_set');
  }

  final _$isActiveAtom = Atom(name: '_SiteServiceModelStore.isActive');

  @override
  bool get isActive {
    _$isActiveAtom.context.enforceReadPolicy(_$isActiveAtom);
    _$isActiveAtom.reportObserved();
    return super.isActive;
  }

  @override
  set isActive(bool value) {
    _$isActiveAtom.context.conditionallyRunInAction(() {
      super.isActive = value;
      _$isActiveAtom.reportChanged();
    }, _$isActiveAtom, name: '${_$isActiveAtom.name}_set');
  }

  final _$createDateAtom = Atom(name: '_SiteServiceModelStore.createDate');

  @override
  DateTime get createDate {
    _$createDateAtom.context.enforceReadPolicy(_$createDateAtom);
    _$createDateAtom.reportObserved();
    return super.createDate;
  }

  @override
  set createDate(DateTime value) {
    _$createDateAtom.context.conditionallyRunInAction(() {
      super.createDate = value;
      _$createDateAtom.reportChanged();
    }, _$createDateAtom, name: '${_$createDateAtom.name}_set');
  }

  final _$tasksGeneratedAtom =
      Atom(name: '_SiteServiceModelStore.tasksGenerated');

  @override
  bool get tasksGenerated {
    _$tasksGeneratedAtom.context.enforceReadPolicy(_$tasksGeneratedAtom);
    _$tasksGeneratedAtom.reportObserved();
    return super.tasksGenerated;
  }

  @override
  set tasksGenerated(bool value) {
    _$tasksGeneratedAtom.context.conditionallyRunInAction(() {
      super.tasksGenerated = value;
      _$tasksGeneratedAtom.reportChanged();
    }, _$tasksGeneratedAtom, name: '${_$tasksGeneratedAtom.name}_set');
  }

  final _$slaDaysAtom = Atom(name: '_SiteServiceModelStore.slaDays');

  @override
  int get slaDays {
    _$slaDaysAtom.context.enforceReadPolicy(_$slaDaysAtom);
    _$slaDaysAtom.reportObserved();
    return super.slaDays;
  }

  @override
  set slaDays(int value) {
    _$slaDaysAtom.context.conditionallyRunInAction(() {
      super.slaDays = value;
      _$slaDaysAtom.reportChanged();
    }, _$slaDaysAtom, name: '${_$slaDaysAtom.name}_set');
  }

  final _$_SiteServiceModelStoreActionController =
      ActionController(name: '_SiteServiceModelStore');

  @override
  void serialize(Map<String, dynamic> data) {
    final _$actionInfo = _$_SiteServiceModelStoreActionController.startAction();
    try {
      return super.serialize(data);
    } finally {
      _$_SiteServiceModelStoreActionController.endAction(_$actionInfo);
    }
  }
}
