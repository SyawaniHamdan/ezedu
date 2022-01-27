class Tutor {
  String? id;
  String name;
  String phone;
  String email;
  String address;
  String proPictuce;
  String qualification;
  String gender;
  String about;

  Tutor(
      {this.id = '',
      this.name = '',
      this.phone = '',
      this.email = '',
      this.address = '',
      this.proPictuce = '',
      this.qualification = '',
      this.gender = '',
      this.about = ''});

  Tutor.copy(from)
      : this(
            id: from.id,
            name: from.name,
            phone: from.phone,
            email: from.email,
            address: from.address,
            proPictuce: from.address,
            qualification: from.qualification,
            gender: from.gender,
            about: from.about);

  Tutor.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            name: json['name'],
            phone: json['phone'],
            email: json['email'],
            address: json['address'],
            proPictuce: json['proPictuce'],
            qualification: json['qualification'],
            gender: json['gender'],
            about: json['about']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'email': email,
        'address': address,
        'proPictuce': proPictuce,
        'qualification': qualification,
        'gender': gender,
        'about': about
      };
}
