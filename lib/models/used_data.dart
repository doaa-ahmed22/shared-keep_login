class UserData {
  // Attributes

  static int userId = 0;
  String firstName = "";
  String secondName = "";
  String email = "";

  // Constructor

  UserData({
    required this.firstName,
    required this.secondName,
    required this.email,
  });

  // Increase ID function
  static increaseId() {
    userId++;
  }

  // To Json

  Map<String, dynamic> toJson() {
    return {'first name': firstName, 'second name': secondName, 'email': email};
  }

  // from Json

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      firstName: json["first name"],
      secondName: json["second name"],
      email: "email",
    );
  }
}
