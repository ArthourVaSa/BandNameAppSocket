class Band {
  Band({
    this.id,
    this.name,
    this.votes,
  });

  String? id;
  String? name;
  int? votes;

  //fromMap
  factory Band.fromJson(Map<String, dynamic> json) => Band(
        id: json["id"],
        name: json["name"],
        votes: json["vote"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "vote": votes,
      };
}
