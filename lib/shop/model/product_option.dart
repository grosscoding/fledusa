class Option {
  Option({
    required this.title,
    required this.values,
  });
  String title;
  List<Value> values;
  factory Option.fromJson(Map<String, dynamic> json) => Option(
        title: json["title"],
        values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
      );
}

class Value {
  Value({
    required this.id,
    required this.value,
  });
  String id;
  String value;
  factory Value.fromJson(Map<String, dynamic> json) => Value(
        id: json["id"],
        value: json["value"]!,
      );
}
