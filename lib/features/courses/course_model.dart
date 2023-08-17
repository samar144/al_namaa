class Course {
  int id;
  String name;
  DateTime startDate;
  DateTime endDate;
  int sessionNumber;
  Duration sessionDuration;
  String trainerName;
  String targetGroup;
  int premium;
  String category;
  String status;

  Course({
    required this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.sessionNumber,
    required this.sessionDuration,
    required this.trainerName,
    required this.targetGroup,
    required this.premium,
    required this.category,
    required this.status,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      sessionNumber: int.parse(json['session_number']),
      sessionDuration: Duration(
          minutes: int.parse(json['session_duration'].split(':')[0]),
          seconds: int.parse(json['session_duration'].split(':')[1])),
      trainerName: json['trainer_name'],
      targetGroup: json['target_group'],
      premium: json['premium'],
      category: json['category'],
      status: json['status'],
    );
  }
}
