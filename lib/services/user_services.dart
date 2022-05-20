class User {
  final String code;
  final List<Items> items;

  User({required this.code, required this.items});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['items'] as List;
    List<Items> itemList = list.map((i) => Items.fromJson(i)).toList();

    return User(code: parsedJson['code'], items: itemList);
  }
}

class Items {
  final int id;
  // final String email;
  // final String firstname;
  // final String lastname;

  Items({
    required this.id,
    // required this.email,
    // required this.firstname,
    // required this.lastname,
  });

  factory Items.fromJson(Map<String, dynamic> parsedJson) {
    return Items(
      id: parsedJson['id'],
      // email: parsedJson['email'],
      // firstname: parsedJson['firstname'],
      // lastname: parsedJson['lastname'],
    );
  }
}
