import 'package:airfly/config/constants/hive_table_constants.dart';
import 'package:airfly/features/auth/domain/entity/user_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

final authHiveModelProvider = Provider(
  (ref) => AuthHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String fname;

  @HiveField(2)
  final String lname;

  @HiveField(3)
  final String phone;

  @HiveField(6)
  final String username;

  @HiveField(7)
  final String password;

  //constructor
  AuthHiveModel({
    String? userId,
    required this.fname,
    required this.lname,
    required this.phone,
    required this.username,
    required this.password,
  }) : userId = userId ?? const Uuid().v4();

  //empty constructor
  AuthHiveModel.empty()
      : this(
          userId: '',
          fname: '',
          lname: '',
          phone: '',
          username: '',
          password: '',
        );

  //Convert Hive Object to Entity
  UserEntity toEntity() => UserEntity(
        fname: "$fname $lname",
        lname: lname,
        phone: phone,
        username: username,
        password: password,
      );

  //Convert entity to hive object
  AuthHiveModel toHiveModel(UserEntity entity) => AuthHiveModel(
        fname: fname,
        lname: lname,
        phone: phone,
        username: entity.username,
        password: entity.password,
      );

  //convert entity list to hive List
  List<AuthHiveModel> toHiveModelList(List<UserEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'studentId: $userId, fname: $fname, lname: $lname, phone: $phone,  username: $username, password: $password';
  }
}
