class Note {
  int? id;
  String title;
  String description;

  Note({
    required this.title,
    required this.description,
    this.id,
  });

  Map<String, Object?> toMap() {
    return {'id': id, 'title': title, 'description': description};
  }
}
