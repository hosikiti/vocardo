// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetItemCollection on Isar {
  IsarCollection<Item> get items => this.collection();
}

const ItemSchema = CollectionSchema(
  name: r'Item',
  id: 7900997316587104717,
  properties: {
    r'answer': PropertySchema(
      id: 0,
      name: r'answer',
      type: IsarType.string,
    ),
    r'easinessFactor': PropertySchema(
      id: 1,
      name: r'easinessFactor',
      type: IsarType.double,
    ),
    r'interval': PropertySchema(
      id: 2,
      name: r'interval',
      type: IsarType.long,
    ),
    r'lastInterval': PropertySchema(
      id: 3,
      name: r'lastInterval',
      type: IsarType.long,
    ),
    r'lastReviewed': PropertySchema(
      id: 4,
      name: r'lastReviewed',
      type: IsarType.dateTime,
    ),
    r'quality': PropertySchema(
      id: 5,
      name: r'quality',
      type: IsarType.long,
    ),
    r'question': PropertySchema(
      id: 6,
      name: r'question',
      type: IsarType.string,
    ),
    r'repetition': PropertySchema(
      id: 7,
      name: r'repetition',
      type: IsarType.long,
    ),
    r'reviewAfter': PropertySchema(
      id: 8,
      name: r'reviewAfter',
      type: IsarType.dateTime,
    ),
    r'soundData': PropertySchema(
      id: 9,
      name: r'soundData',
      type: IsarType.byteList,
    )
  },
  estimateSize: _itemEstimateSize,
  serialize: _itemSerialize,
  deserialize: _itemDeserialize,
  deserializeProp: _itemDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'studySet': LinkSchema(
      id: 2985496092751510086,
      name: r'studySet',
      target: r'StudySet',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _itemGetId,
  getLinks: _itemGetLinks,
  attach: _itemAttach,
  version: '3.1.0+1',
);

int _itemEstimateSize(
  Item object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.answer.length * 3;
  bytesCount += 3 + object.question.length * 3;
  {
    final value = object.soundData;
    if (value != null) {
      bytesCount += 3 + value.length;
    }
  }
  return bytesCount;
}

void _itemSerialize(
  Item object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.answer);
  writer.writeDouble(offsets[1], object.easinessFactor);
  writer.writeLong(offsets[2], object.interval);
  writer.writeLong(offsets[3], object.lastInterval);
  writer.writeDateTime(offsets[4], object.lastReviewed);
  writer.writeLong(offsets[5], object.quality);
  writer.writeString(offsets[6], object.question);
  writer.writeLong(offsets[7], object.repetition);
  writer.writeDateTime(offsets[8], object.reviewAfter);
  writer.writeByteList(offsets[9], object.soundData);
}

Item _itemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Item();
  object.answer = reader.readString(offsets[0]);
  object.easinessFactor = reader.readDoubleOrNull(offsets[1]);
  object.id = id;
  object.interval = reader.readLongOrNull(offsets[2]);
  object.lastInterval = reader.readLongOrNull(offsets[3]);
  object.lastReviewed = reader.readDateTimeOrNull(offsets[4]);
  object.quality = reader.readLongOrNull(offsets[5]);
  object.question = reader.readString(offsets[6]);
  object.repetition = reader.readLongOrNull(offsets[7]);
  object.reviewAfter = reader.readDateTimeOrNull(offsets[8]);
  object.soundData = reader.readByteList(offsets[9]);
  return object;
}

P _itemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readByteList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _itemGetId(Item object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _itemGetLinks(Item object) {
  return [object.studySet];
}

void _itemAttach(IsarCollection<dynamic> col, Id id, Item object) {
  object.id = id;
  object.studySet.attach(col, col.isar.collection<StudySet>(), r'studySet', id);
}

extension ItemQueryWhereSort on QueryBuilder<Item, Item, QWhere> {
  QueryBuilder<Item, Item, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ItemQueryWhere on QueryBuilder<Item, Item, QWhereClause> {
  QueryBuilder<Item, Item, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Item, Item, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Item, Item, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ItemQueryFilter on QueryBuilder<Item, Item, QFilterCondition> {
  QueryBuilder<Item, Item, QAfterFilterCondition> answerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> answerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> answerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> answerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'answer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> answerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> answerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> answerContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> answerMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'answer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> answerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answer',
        value: '',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> answerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'answer',
        value: '',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> easinessFactorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'easinessFactor',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> easinessFactorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'easinessFactor',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> easinessFactorEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'easinessFactor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> easinessFactorGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'easinessFactor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> easinessFactorLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'easinessFactor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> easinessFactorBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'easinessFactor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> intervalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'interval',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> intervalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'interval',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> intervalEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'interval',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> intervalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'interval',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> intervalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'interval',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> intervalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'interval',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> lastIntervalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastInterval',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> lastIntervalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastInterval',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> lastIntervalEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> lastIntervalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> lastIntervalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> lastIntervalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastInterval',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> lastReviewedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastReviewed',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> lastReviewedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastReviewed',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> lastReviewedEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastReviewed',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> lastReviewedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastReviewed',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> lastReviewedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastReviewed',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> lastReviewedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastReviewed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> qualityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quality',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> qualityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quality',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> qualityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quality',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> qualityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quality',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> qualityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quality',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> qualityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quality',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> questionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> questionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> questionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> questionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'question',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> questionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> questionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> questionContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> questionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'question',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> questionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'question',
        value: '',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> questionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'question',
        value: '',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> repetitionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'repetition',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> repetitionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'repetition',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> repetitionEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'repetition',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> repetitionGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'repetition',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> repetitionLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'repetition',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> repetitionBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'repetition',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> reviewAfterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reviewAfter',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> reviewAfterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reviewAfter',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> reviewAfterEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reviewAfter',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> reviewAfterGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reviewAfter',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> reviewAfterLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reviewAfter',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> reviewAfterBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reviewAfter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> soundDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'soundData',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> soundDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'soundData',
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> soundDataElementEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'soundData',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> soundDataElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'soundData',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> soundDataElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'soundData',
        value: value,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> soundDataElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'soundData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> soundDataLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'soundData',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> soundDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'soundData',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> soundDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'soundData',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> soundDataLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'soundData',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> soundDataLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'soundData',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> soundDataLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'soundData',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ItemQueryObject on QueryBuilder<Item, Item, QFilterCondition> {}

extension ItemQueryLinks on QueryBuilder<Item, Item, QFilterCondition> {
  QueryBuilder<Item, Item, QAfterFilterCondition> studySet(
      FilterQuery<StudySet> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'studySet');
    });
  }

  QueryBuilder<Item, Item, QAfterFilterCondition> studySetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'studySet', 0, true, 0, true);
    });
  }
}

extension ItemQuerySortBy on QueryBuilder<Item, Item, QSortBy> {
  QueryBuilder<Item, Item, QAfterSortBy> sortByAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answer', Sort.asc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answer', Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByEasinessFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'easinessFactor', Sort.asc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByEasinessFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'easinessFactor', Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interval', Sort.asc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interval', Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByLastInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastInterval', Sort.asc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByLastIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastInterval', Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByLastReviewed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewed', Sort.asc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByLastReviewedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewed', Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByQuality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quality', Sort.asc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByQualityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quality', Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.asc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByRepetition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repetition', Sort.asc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByRepetitionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repetition', Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByReviewAfter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewAfter', Sort.asc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> sortByReviewAfterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewAfter', Sort.desc);
    });
  }
}

extension ItemQuerySortThenBy on QueryBuilder<Item, Item, QSortThenBy> {
  QueryBuilder<Item, Item, QAfterSortBy> thenByAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answer', Sort.asc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answer', Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByEasinessFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'easinessFactor', Sort.asc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByEasinessFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'easinessFactor', Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interval', Sort.asc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interval', Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByLastInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastInterval', Sort.asc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByLastIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastInterval', Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByLastReviewed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewed', Sort.asc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByLastReviewedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReviewed', Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByQuality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quality', Sort.asc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByQualityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quality', Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.asc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByRepetition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repetition', Sort.asc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByRepetitionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repetition', Sort.desc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByReviewAfter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewAfter', Sort.asc);
    });
  }

  QueryBuilder<Item, Item, QAfterSortBy> thenByReviewAfterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewAfter', Sort.desc);
    });
  }
}

extension ItemQueryWhereDistinct on QueryBuilder<Item, Item, QDistinct> {
  QueryBuilder<Item, Item, QDistinct> distinctByAnswer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'answer', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Item, Item, QDistinct> distinctByEasinessFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'easinessFactor');
    });
  }

  QueryBuilder<Item, Item, QDistinct> distinctByInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'interval');
    });
  }

  QueryBuilder<Item, Item, QDistinct> distinctByLastInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastInterval');
    });
  }

  QueryBuilder<Item, Item, QDistinct> distinctByLastReviewed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastReviewed');
    });
  }

  QueryBuilder<Item, Item, QDistinct> distinctByQuality() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quality');
    });
  }

  QueryBuilder<Item, Item, QDistinct> distinctByQuestion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'question', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Item, Item, QDistinct> distinctByRepetition() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'repetition');
    });
  }

  QueryBuilder<Item, Item, QDistinct> distinctByReviewAfter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reviewAfter');
    });
  }

  QueryBuilder<Item, Item, QDistinct> distinctBySoundData() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'soundData');
    });
  }
}

extension ItemQueryProperty on QueryBuilder<Item, Item, QQueryProperty> {
  QueryBuilder<Item, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Item, String, QQueryOperations> answerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'answer');
    });
  }

  QueryBuilder<Item, double?, QQueryOperations> easinessFactorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'easinessFactor');
    });
  }

  QueryBuilder<Item, int?, QQueryOperations> intervalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'interval');
    });
  }

  QueryBuilder<Item, int?, QQueryOperations> lastIntervalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastInterval');
    });
  }

  QueryBuilder<Item, DateTime?, QQueryOperations> lastReviewedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastReviewed');
    });
  }

  QueryBuilder<Item, int?, QQueryOperations> qualityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quality');
    });
  }

  QueryBuilder<Item, String, QQueryOperations> questionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'question');
    });
  }

  QueryBuilder<Item, int?, QQueryOperations> repetitionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'repetition');
    });
  }

  QueryBuilder<Item, DateTime?, QQueryOperations> reviewAfterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reviewAfter');
    });
  }

  QueryBuilder<Item, List<int>?, QQueryOperations> soundDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'soundData');
    });
  }
}
