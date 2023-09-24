// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isarHash() => r'5185c31454eab905321cef3fc2857ec3f69c8f33';

/// See also [isar].
@ProviderFor(isar)
final isarProvider = FutureProvider<Isar>.internal(
  isar,
  name: r'isarProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isarHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsarRef = FutureProviderRef<Isar>;
String _$cardManagerHash() => r'b9947b77fe8fb9b38a1770bce912b26785e00145';

/// See also [cardManager].
@ProviderFor(cardManager)
final cardManagerProvider = AutoDisposeFutureProvider<CardManager>.internal(
  cardManager,
  name: r'cardManagerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cardManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CardManagerRef = AutoDisposeFutureProviderRef<CardManager>;
String _$currentCardHash() => r'6cb59ddca1e4c2054e8692dd2dc52cb2729674f5';

/// See also [CurrentCard].
@ProviderFor(CurrentCard)
final currentCardProvider =
    AutoDisposeAsyncNotifierProvider<CurrentCard, CardItem?>.internal(
  CurrentCard.new,
  name: r'currentCardProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentCardHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentCard = AutoDisposeAsyncNotifier<CardItem?>;
String _$cardListHash() => r'870760665fff28173ae6ac5f64ea07560befd8a6';

/// See also [CardList].
@ProviderFor(CardList)
final cardListProvider =
    AutoDisposeAsyncNotifierProvider<CardList, List<CardItem>>.internal(
  CardList.new,
  name: r'cardListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cardListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CardList = AutoDisposeAsyncNotifier<List<CardItem>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
