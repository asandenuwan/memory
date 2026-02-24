// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tabrow.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTabCollection on Isar {
  IsarCollection<Tab> get Tabs => this.collection();
}

const TabSchema = CollectionSchema(
  name: r'Tab',
  id: -432047367454085031,
  properties: {
    r'tabName': PropertySchema(id: 0, name: r'tabName', type: IsarType.string),
  },

  estimateSize: _tabEstimateSize,
  serialize: _tabSerialize,
  deserialize: _tabDeserialize,
  deserializeProp: _tabDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'jobs': LinkSchema(
      id: 2786473907597086256,
      name: r'jobs',
      target: r'Job',
      single: false,
    ),
  },
  embeddedSchemas: {},

  getId: _tabGetId,
  getLinks: _tabGetLinks,
  attach: _tabAttach,
  version: '3.3.0',
);

int _tabEstimateSize(
  Tab object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.tabName.length * 3;
  return bytesCount;
}

void _tabSerialize(
  Tab object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.tabName);
}

Tab _tabDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Tab();
  object.id = id;
  object.tabName = reader.readString(offsets[0]);
  return object;
}

P _tabDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _tabGetId(Tab object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _tabGetLinks(Tab object) {
  return [object.jobs];
}

void _tabAttach(IsarCollection<dynamic> col, Id id, Tab object) {
  object.id = id;
  object.jobs.attach(col, col.isar.collection<Job>(), r'jobs', id);
}

extension TabQueryWhereSort on QueryBuilder<Tab, Tab, QWhere> {
  QueryBuilder<Tab, Tab, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TabQueryWhere on QueryBuilder<Tab, Tab, QWhereClause> {
  QueryBuilder<Tab, Tab, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Tab, Tab, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Tab, Tab, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Tab, Tab, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Tab, Tab, QAfterWhereClause> idBetween(
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

extension TabQueryFilter on QueryBuilder<Tab, Tab, QFilterCondition> {
  QueryBuilder<Tab, Tab, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Tab, Tab, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Tab, Tab, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Tab, Tab, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Tab, Tab, QAfterFilterCondition> tabNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'tabName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Tab, Tab, QAfterFilterCondition> tabNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tabName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Tab, Tab, QAfterFilterCondition> tabNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tabName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Tab, Tab, QAfterFilterCondition> tabNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tabName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Tab, Tab, QAfterFilterCondition> tabNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'tabName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Tab, Tab, QAfterFilterCondition> tabNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'tabName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Tab, Tab, QAfterFilterCondition> tabNameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'tabName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Tab, Tab, QAfterFilterCondition> tabNameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'tabName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Tab, Tab, QAfterFilterCondition> tabNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tabName', value: ''),
      );
    });
  }

  QueryBuilder<Tab, Tab, QAfterFilterCondition> tabNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tabName', value: ''),
      );
    });
  }
}

extension TabQueryObject on QueryBuilder<Tab, Tab, QFilterCondition> {}

extension TabQueryLinks on QueryBuilder<Tab, Tab, QFilterCondition> {
  QueryBuilder<Tab, Tab, QAfterFilterCondition> jobs(FilterQuery<Job> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'jobs');
    });
  }

  QueryBuilder<Tab, Tab, QAfterFilterCondition> jobsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'jobs', length, true, length, true);
    });
  }

  QueryBuilder<Tab, Tab, QAfterFilterCondition> jobsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'jobs', 0, true, 0, true);
    });
  }

  QueryBuilder<Tab, Tab, QAfterFilterCondition> jobsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'jobs', 0, false, 999999, true);
    });
  }

  QueryBuilder<Tab, Tab, QAfterFilterCondition> jobsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'jobs', 0, true, length, include);
    });
  }

  QueryBuilder<Tab, Tab, QAfterFilterCondition> jobsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'jobs', length, include, 999999, true);
    });
  }

  QueryBuilder<Tab, Tab, QAfterFilterCondition> jobsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
        r'jobs',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension TabQuerySortBy on QueryBuilder<Tab, Tab, QSortBy> {
  QueryBuilder<Tab, Tab, QAfterSortBy> sortByTabName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tabName', Sort.asc);
    });
  }

  QueryBuilder<Tab, Tab, QAfterSortBy> sortByTabNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tabName', Sort.desc);
    });
  }
}

extension TabQuerySortThenBy on QueryBuilder<Tab, Tab, QSortThenBy> {
  QueryBuilder<Tab, Tab, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Tab, Tab, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Tab, Tab, QAfterSortBy> thenByTabName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tabName', Sort.asc);
    });
  }

  QueryBuilder<Tab, Tab, QAfterSortBy> thenByTabNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tabName', Sort.desc);
    });
  }
}

extension TabQueryWhereDistinct on QueryBuilder<Tab, Tab, QDistinct> {
  QueryBuilder<Tab, Tab, QDistinct> distinctByTabName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tabName', caseSensitive: caseSensitive);
    });
  }
}

extension TabQueryProperty on QueryBuilder<Tab, Tab, QQueryProperty> {
  QueryBuilder<Tab, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Tab, String, QQueryOperations> tabNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tabName');
    });
  }
}
