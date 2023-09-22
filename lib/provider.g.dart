// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
String _$cardListHash() => r'781d674a318d57843d0e143c34966ff044510b3c';

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
