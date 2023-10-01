// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recorder_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recorderHash() => r'f9e95cd919d8ade13251aa99f16378ad0f05bd84';

/// See also [recorder].
@ProviderFor(recorder)
final recorderProvider = FutureProvider<Recorder>.internal(
  recorder,
  name: r'recorderProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$recorderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RecorderRef = FutureProviderRef<Recorder>;
String _$recordElapsedTimeHash() => r'7115be028ab0654505bae6e3aae6274bc6dd796b';

/// See also [RecordElapsedTime].
@ProviderFor(RecordElapsedTime)
final recordElapsedTimeProvider =
    NotifierProvider<RecordElapsedTime, int>.internal(
  RecordElapsedTime.new,
  name: r'recordElapsedTimeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recordElapsedTimeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RecordElapsedTime = Notifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
