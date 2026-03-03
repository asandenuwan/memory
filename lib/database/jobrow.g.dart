// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobrow.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetJobCollection on Isar {
  IsarCollection<Job> get jobs => this.collection();
}

const JobSchema = CollectionSchema(
  name: r'Job',
  id: -5961302972855324388,
  properties: {
    r'addedDay': PropertySchema(
      id: 0,
      name: r'addedDay',
      type: IsarType.dateTime,
    ),
    r'discription': PropertySchema(
      id: 1,
      name: r'discription',
      type: IsarType.string,
    ),
    r'doneDay': PropertySchema(
      id: 2,
      name: r'doneDay',
      type: IsarType.dateTime,
    ),
    r'isDid': PropertySchema(id: 3, name: r'isDid', type: IsarType.bool),
    r'noAlarm': PropertySchema(id: 4, name: r'noAlarm', type: IsarType.bool),
    r'title': PropertySchema(id: 5, name: r'title', type: IsarType.string),
  },

  estimateSize: _jobEstimateSize,
  serialize: _jobSerialize,
  deserialize: _jobDeserialize,
  deserializeProp: _jobDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'alarms': LinkSchema(
      id: -6153366222154136383,
      name: r'alarms',
      target: r'Alarm',
      single: false,
    ),
  },
  embeddedSchemas: {},

  getId: _jobGetId,
  getLinks: _jobGetLinks,
  attach: _jobAttach,
  version: '3.3.0',
);

int _jobEstimateSize(
  Job object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.discription.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _jobSerialize(
  Job object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.addedDay);
  writer.writeString(offsets[1], object.discription);
  writer.writeDateTime(offsets[2], object.doneDay);
  writer.writeBool(offsets[3], object.isDid);
  writer.writeBool(offsets[4], object.noAlarm);
  writer.writeString(offsets[5], object.title);
}

Job _jobDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Job();
  object.addedDay = reader.readDateTime(offsets[0]);
  object.discription = reader.readString(offsets[1]);
  object.doneDay = reader.readDateTimeOrNull(offsets[2]);
  object.id = id;
  object.isDid = reader.readBool(offsets[3]);
  object.noAlarm = reader.readBool(offsets[4]);
  object.title = reader.readString(offsets[5]);
  return object;
}

P _jobDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _jobGetId(Job object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _jobGetLinks(Job object) {
  return [object.alarms];
}

void _jobAttach(IsarCollection<dynamic> col, Id id, Job object) {
  object.id = id;
  object.alarms.attach(col, col.isar.collection<Alarm>(), r'alarms', id);
}

extension JobQueryWhereSort on QueryBuilder<Job, Job, QWhere> {
  QueryBuilder<Job, Job, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension JobQueryWhere on QueryBuilder<Job, Job, QWhereClause> {
  QueryBuilder<Job, Job, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Job, Job, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Job, Job, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension JobQueryFilter on QueryBuilder<Job, Job, QFilterCondition> {
  QueryBuilder<Job, Job, QAfterFilterCondition> addedDayEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'addedDay', value: value),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> addedDayGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'addedDay',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> addedDayLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'addedDay',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> addedDayBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'addedDay',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> discriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'discription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> discriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'discription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> discriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'discription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> discriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'discription',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> discriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'discription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> discriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'discription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> discriptionContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'discription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> discriptionMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'discription',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> discriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'discription', value: ''),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> discriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'discription', value: ''),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> doneDayIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'doneDay'),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> doneDayIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'doneDay'),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> doneDayEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'doneDay', value: value),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> doneDayGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'doneDay',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> doneDayLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'doneDay',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> doneDayBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'doneDay',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> isDidEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isDid', value: value),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> noAlarmEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'noAlarm', value: value),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }
}

extension JobQueryObject on QueryBuilder<Job, Job, QFilterCondition> {}

extension JobQueryLinks on QueryBuilder<Job, Job, QFilterCondition> {
  QueryBuilder<Job, Job, QAfterFilterCondition> alarms(FilterQuery<Alarm> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'alarms');
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> alarmsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'alarms', length, true, length, true);
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> alarmsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'alarms', 0, true, 0, true);
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> alarmsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'alarms', 0, false, 999999, true);
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> alarmsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'alarms', 0, true, length, include);
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> alarmsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'alarms', length, include, 999999, true);
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> alarmsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
        r'alarms',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension JobQuerySortBy on QueryBuilder<Job, Job, QSortBy> {
  QueryBuilder<Job, Job, QAfterSortBy> sortByAddedDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDay', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByAddedDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDay', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByDiscription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discription', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByDiscriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discription', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByDoneDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doneDay', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByDoneDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doneDay', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByIsDid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDid', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByIsDidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDid', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByNoAlarm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noAlarm', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByNoAlarmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noAlarm', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension JobQuerySortThenBy on QueryBuilder<Job, Job, QSortThenBy> {
  QueryBuilder<Job, Job, QAfterSortBy> thenByAddedDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDay', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByAddedDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDay', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByDiscription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discription', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByDiscriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discription', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByDoneDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doneDay', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByDoneDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doneDay', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByIsDid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDid', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByIsDidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDid', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByNoAlarm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noAlarm', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByNoAlarmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noAlarm', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension JobQueryWhereDistinct on QueryBuilder<Job, Job, QDistinct> {
  QueryBuilder<Job, Job, QDistinct> distinctByAddedDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedDay');
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByDiscription({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discription', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByDoneDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'doneDay');
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByIsDid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDid');
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByNoAlarm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'noAlarm');
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByTitle({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension JobQueryProperty on QueryBuilder<Job, Job, QQueryProperty> {
  QueryBuilder<Job, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Job, DateTime, QQueryOperations> addedDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedDay');
    });
  }

  QueryBuilder<Job, String, QQueryOperations> discriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discription');
    });
  }

  QueryBuilder<Job, DateTime?, QQueryOperations> doneDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'doneDay');
    });
  }

  QueryBuilder<Job, bool, QQueryOperations> isDidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDid');
    });
  }

  QueryBuilder<Job, bool, QQueryOperations> noAlarmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'noAlarm');
    });
  }

  QueryBuilder<Job, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
