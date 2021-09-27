import 'dart:convert';

class Goodie {
  String name;
  String url;
  int index;
  Goodie({
    required this.index,
    required this.name,
    required this.url,
  });

  Goodie copyWith({
    String? name,
    String? url,
    int? index,
  }) {
    return Goodie(
      name: name ?? this.name,
      url: url ?? this.url,
      index: index ?? this.index,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
      'index': index,
    };
  }

  factory Goodie.fromMap(Map<String, dynamic> map) {
    return Goodie(
      name: map['name'],
      url: map['url'],
      index: map['index'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Goodie.fromJson(String source) => Goodie.fromMap(json.decode(source));

  @override
  String toString() => 'Goodie(name: $name, url: $url, index: $index)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Goodie &&
        other.name == name &&
        other.url == url &&
        other.index == index;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode ^ index.hashCode;
}
