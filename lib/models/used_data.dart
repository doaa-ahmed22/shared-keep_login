/*
* Your implementation is functional but has several issues that could lead to problems in the long run.
* I’ll first point out the mistakes by using to do mark
* and then provide a cleaner and more scalable approach.
* */

class UserData {
/*TODO:
* UserData Issues
Static userId: You’re using userId as a static variable, which means all users will share the same ID. This is incorrect.
* The ID should be unique for each user.
*/

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

/*
* TODO:
*  we don't do any functionality here*/
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
      /*TODO:
      * You should use the same key as the one in the toJson method.
       */
      email: "email",
    );
  }
}

class NewUserData {
  int userId;
  String firstName;
  String secondName;
  String email;

  NewUserData({
    required this.userId,
    required this.firstName,
    required this.secondName,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'userID': userId,
      'first name': firstName,
      'second name': secondName,
      'email': email
    };
  }

  factory NewUserData.fromJson(Map<String, dynamic> json) {
    return NewUserData(
      userId: json["userID"],
      firstName: json["first name"],
      secondName: json["second name"],
      email: json["email"],
    );
  }
}
