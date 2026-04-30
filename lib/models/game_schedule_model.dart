class GameScheduleItem {
  final String day;
  final int date;
  final String opponent;
  final String? result;
  final bool isWin;

  const GameScheduleItem({
    required this.day,
    required this.date,
    required this.opponent,
    this.result,
    this.isWin = false,
  });
}
