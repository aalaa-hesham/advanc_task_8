class Todo {
  final String title;
  final String description;
  bool isCompleted;

  Todo({this.title = '', this.description = '', this.isCompleted = false});

  Todo copyWith({
    String? title,
    String? description,
    bool? isDone,
  }) {
    return Todo(
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isDone ?? this.isCompleted,
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        title: json['title'],
        description: json['subtitle'],
        isCompleted: json['isDone']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'subtitle': description, 'isDone': isCompleted};
  }

  @override
  String toString() {
    return '''Todo: {
			title: $title\n
			subtitle: $description\n
			isDone: $isCompleted\n
		}''';
  }
}
