import 'package:hive/hive.dart';

part 'test_tester.g.dart';

@HiveType(typeId: 1)
class TestTester {

  @HiveField(0)
  double id;

  TestTester({required this.id,});

  factory TestTester.fromMap(Map<String, dynamic> map) {
    return TestTester(
      id: map['id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }
}
