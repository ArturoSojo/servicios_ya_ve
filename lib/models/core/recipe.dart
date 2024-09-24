class Recipe {
  String title;
  String photo;
  String calories;
  String time;
  String description;

  List<Ingridient> ingridients;
  List<TutorialStep> tutorial;
  List<Review> reviews;

  Recipe(
      {required this.title,
      required this.photo,
      required this.calories,
      required this.time,
      required this.description,
      required this.ingridients,
      required this.tutorial,
      required this.reviews});

  factory Recipe.fromJson(Map<String, Object> json) {
    return Recipe(
      title: json['title'].toString(),
      photo: json['photo'].toString(),
      calories: json['calories'].toString(),
      time: json['time'].toString(),
      description: json['description'].toString(),
      ingridients: [],
      tutorial: [],
      reviews: [],
    );
  }
}

class TutorialStep {
  String step;
  String description;
  TutorialStep({required this.step, required this.description});

  Map<String, Object> toMap() {
    return {
      'step': step,
      'description': description,
    };
  }

  factory TutorialStep.fromJson(Map<String, Object> json) => TutorialStep(
        step: json['step'].toString(),
        description: json['description'].toString(),
      );

  static List<TutorialStep> toList(List<Map<String, Object>> json) {
    return List.from(json)
        .map(
            (e) => TutorialStep(step: e['step'], description: e['description']))
        .toList();
  }
}

class Review {
  String username;
  String review;
  Review({required this.username, required this.review});

  factory Review.fromJson(Map<String, Object> json) => Review(
        review: json['review'].toString(),
        username: json['username'].toString(),
      );

  Map<String, Object> toMap() {
    return {
      'username': username,
      'review': review,
    };
  }

  static List<Review> toList(List<Map<String, Object>> json) {
    return List.from(json)
        .map((e) => Review(username: e['username'], review: e['review']))
        .toList();
  }
}

class Ingridient {
  String name;
  String size;

  Ingridient({required this.name, required this.size});
  factory Ingridient.fromJson(Map<String, Object> json) => Ingridient(
        name: json['name'].toString(),
        size: json['size'].toString(),
      );

  Map<String, Object> toMap() {
    return {
      'name': name,
      'size': size,
    };
  }

  static List<Ingridient> toList(List<Map<String, Object>> json) {
    return List.from(json)
        .map((e) => Ingridient(name: e['name'], size: e['size']))
        .toList();
  }
}
