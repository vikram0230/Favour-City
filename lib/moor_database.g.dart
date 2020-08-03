// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Favourite extends DataClass implements Insertable<Favourite> {
  final String city;
  final String district;
  final String state;
  Favourite(
      {@required this.city, @required this.district, @required this.state});
  factory Favourite.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return Favourite(
      city: stringType.mapFromDatabaseResponse(data['${effectivePrefix}city']),
      district: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}district']),
      state:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}state']),
    );
  }
  factory Favourite.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Favourite(
      city: serializer.fromJson<String>(json['city']),
      district: serializer.fromJson<String>(json['district']),
      state: serializer.fromJson<String>(json['state']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'city': serializer.toJson<String>(city),
      'district': serializer.toJson<String>(district),
      'state': serializer.toJson<String>(state),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Favourite>>(bool nullToAbsent) {
    return FavouritesCompanion(
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      district: district == null && nullToAbsent
          ? const Value.absent()
          : Value(district),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
    ) as T;
  }

  Favourite copyWith({String city, String district, String state}) => Favourite(
        city: city ?? this.city,
        district: district ?? this.district,
        state: state ?? this.state,
      );
  @override
  String toString() {
    return (StringBuffer('Favourite(')
          ..write('city: $city, ')
          ..write('district: $district, ')
          ..write('state: $state')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(city.hashCode, $mrjc(district.hashCode, state.hashCode)));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Favourite &&
          other.city == city &&
          other.district == district &&
          other.state == state);
}

class FavouritesCompanion extends UpdateCompanion<Favourite> {
  final Value<String> city;
  final Value<String> district;
  final Value<String> state;
  const FavouritesCompanion({
    this.city = const Value.absent(),
    this.district = const Value.absent(),
    this.state = const Value.absent(),
  });
  FavouritesCompanion copyWith(
      {Value<String> city, Value<String> district, Value<String> state}) {
    return FavouritesCompanion(
      city: city ?? this.city,
      district: district ?? this.district,
      state: state ?? this.state,
    );
  }
}

class $FavouritesTable extends Favourites
    with TableInfo<$FavouritesTable, Favourite> {
  final GeneratedDatabase _db;
  final String _alias;
  $FavouritesTable(this._db, [this._alias]);
  final VerificationMeta _cityMeta = const VerificationMeta('city');
  GeneratedTextColumn _city;
  @override
  GeneratedTextColumn get city => _city ??= _constructCity();
  GeneratedTextColumn _constructCity() {
    return GeneratedTextColumn('city', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _districtMeta = const VerificationMeta('district');
  GeneratedTextColumn _district;
  @override
  GeneratedTextColumn get district => _district ??= _constructDistrict();
  GeneratedTextColumn _constructDistrict() {
    return GeneratedTextColumn('district', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _stateMeta = const VerificationMeta('state');
  GeneratedTextColumn _state;
  @override
  GeneratedTextColumn get state => _state ??= _constructState();
  GeneratedTextColumn _constructState() {
    return GeneratedTextColumn('state', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  @override
  List<GeneratedColumn> get $columns => [city, district, state];
  @override
  $FavouritesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'favourites';
  @override
  final String actualTableName = 'favourites';
  @override
  VerificationContext validateIntegrity(FavouritesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.city.present) {
      context.handle(
          _cityMeta, city.isAcceptableValue(d.city.value, _cityMeta));
    } else if (city.isRequired && isInserting) {
      context.missing(_cityMeta);
    }
    if (d.district.present) {
      context.handle(_districtMeta,
          district.isAcceptableValue(d.district.value, _districtMeta));
    } else if (district.isRequired && isInserting) {
      context.missing(_districtMeta);
    }
    if (d.state.present) {
      context.handle(
          _stateMeta, state.isAcceptableValue(d.state.value, _stateMeta));
    } else if (state.isRequired && isInserting) {
      context.missing(_stateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {city};
  @override
  Favourite map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Favourite.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(FavouritesCompanion d) {
    final map = <String, Variable>{};
    if (d.city.present) {
      map['city'] = Variable<String, StringType>(d.city.value);
    }
    if (d.district.present) {
      map['district'] = Variable<String, StringType>(d.district.value);
    }
    if (d.state.present) {
      map['state'] = Variable<String, StringType>(d.state.value);
    }
    return map;
  }

  @override
  $FavouritesTable createAlias(String alias) {
    return $FavouritesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $FavouritesTable _favourites;
  $FavouritesTable get favourites => _favourites ??= $FavouritesTable(this);
  @override
  List<TableInfo> get allTables => [favourites];
}
