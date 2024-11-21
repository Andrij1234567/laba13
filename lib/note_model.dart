class NoteModel {
  final int? id;
  final String text;
  final String date;

  NoteModel({
    this.id,
    required this.text,
    required this.date,
  });

  factory NoteModel.fromMap(Map<String, dynamic> json) => NoteModel(
    id: json["id"],
    text: json["text"],
    date: json["date"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "text": text,
    "date": date,
  };
}
