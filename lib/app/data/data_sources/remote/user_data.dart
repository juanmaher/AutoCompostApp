class UserData {
  String name, lastname;
  List<String> composterIds;

  UserData(this.composterIds, {
    required this.name,
    required this.lastname,
  });
}