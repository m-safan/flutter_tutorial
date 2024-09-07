class Condition {
  Condition({required this.text, required this.icon});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'text': final String text,
        'icon': final String icon,
      } =>
        Condition(text: text, icon: icon),
      _ => throw Exception('Could not deserialize Condition model'),
    };
  }

  final String text;
  final String icon;
}
