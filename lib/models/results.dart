class Results {
  String title;

  Results({
    this.title,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      title: json['title'],
    );
  }
}
