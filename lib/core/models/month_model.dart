class MonthModel {
  final String month;
  final int monthNumber;
  MonthModel({
    required this.month,
    required this.monthNumber,
  });
  

  MonthModel copyWith({
    String? month,
    int? monthNumber,
  }) {
    return MonthModel(
      month: month ?? this.month,
      monthNumber: monthNumber ?? this.monthNumber,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MonthModel &&
      other.month == month &&
      other.monthNumber == monthNumber;
  }

  @override
  int get hashCode => month.hashCode ^ monthNumber.hashCode;
}
