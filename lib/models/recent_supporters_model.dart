class SupporterItem {
  final String name;
  final double amount;
  final String timeAgo;

  const SupporterItem({
    required this.name,
    required this.amount,
    required this.timeAgo,
  });

  /// Returns the initials from the name (up to 2 letters).
  String get initials {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts[0].substring(0, parts[0].length.clamp(0, 2)).toUpperCase();
  }

  /// Formats the amount as a dollar string, e.g. $25 or $1,000
  String get formattedAmount {
    final int rounded = amount.toInt();
    if (rounded >= 1000) {
      final s = rounded.toString();
      final thousands = s.substring(0, s.length - 3);
      final hundreds = s.substring(s.length - 3);
      return '\$$thousands,$hundreds';
    }
    return '\$$rounded';
  }
}
