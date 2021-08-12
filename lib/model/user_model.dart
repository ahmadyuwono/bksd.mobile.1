class ListUser {
  final List<UserModel> user;
  ListUser({required this.user});

  factory ListUser.fromJson(List<dynamic> parsedJson) {
    List<UserModel> user = <UserModel>[];
    user = parsedJson.map((i) => UserModel.fromJson(i)).toList();

    return ListUser(user: user);
  }
}

class UserModel {
  UserModel({
    required this.nik,
    required this.id,
    required this.name,
    required this.password,
    required this.email,
    required this.negara,
    required this.membership,
  });

  final String nik;
  final String id;
  final String name;
  final String password;
  final String email;
  final String negara;
  final String membership;

  factory UserModel.fromJson(Map<String, dynamic> object) {
    return UserModel(
      nik: object['nik'],
      id: object['id'],
      name: object['name'],
      password: object['password'],
      email: object['email'],
      negara: object['negara'],
      membership: object['membership'],
    );
  }
}
