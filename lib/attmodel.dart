
import 'package:hive_flutter/hive_flutter.dart';
part 'attmodel.g.dart';


@HiveType(typeId: 1)
class AttendenceModel{
  @HiveField(0)
  final String id;

  @HiveField(1)
  final List<String>rollnumberlist;

  AttendenceModel({required this.id, required this.rollnumberlist});


  @override
  String toString() {
    return '$rollnumberlist';
  }
}
