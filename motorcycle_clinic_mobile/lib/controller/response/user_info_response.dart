class UserInfoResponse {
  late String? id;
  late String? name;
  late String? lastName;
  late String? photo;
  late String? email;
  late bool? isAdmin;

  UserInfoResponse(
      {this.id,
      this.name,
      this.lastName,
      this.email,
      this.isAdmin,
      this.photo});
}
