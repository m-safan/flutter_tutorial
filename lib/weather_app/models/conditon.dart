class Conditon {
  Conditon({required this.text, required this.icon});

  final String text;
  final String icon;

  factory Conditon.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'text': String text, 'icon': String icon} =>
        Conditon(text: text, icon: icon),
      _ => throw Exception('Could not deserialize Condition model'),
    };
  }
}
