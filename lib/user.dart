class User {
  final String htmlUrl;
  final String name;

  User(this.name, this.htmlUrl);

  static List<User> mapJSONStringToList(List<dynamic> jsonList) {
    return jsonList.map((r) => User(r["login"], r["html_url"])).toList();
  }
}
