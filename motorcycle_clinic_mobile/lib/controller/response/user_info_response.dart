class UserInfoResponse {
  late String? id;
  late String? name;
  late String? lastName;
  late String? email;
  late bool? isAdmin;

  UserInfoResponse(
      {this.id, this.name, this.lastName, this.email, this.isAdmin});
}
