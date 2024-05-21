class ModelDescription {
  final String description;
  ModelDescription({
    required this.description,
  });

  ModelDescription copyWith({
    String? description,
  }) {
    return ModelDescription(
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
    };
  }

  factory ModelDescription.fromMap(Map<String, dynamic> map) {
    return ModelDescription(
      description: map['description'] as String,
    );
  }

  @override
  String toString() => 'ModelDescription(description: $description)';

  @override
  bool operator ==(covariant ModelDescription other) {
    if (identical(this, other)) return true;

    return other.description == description;
  }

  @override
  int get hashCode => description.hashCode;
}
