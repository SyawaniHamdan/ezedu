class Tutor {
  String? id;
  String name;
  String phone;
  String email;
  String address;
  String proPictuce;
  String qualification;
  String gender;

  Tutor(
      {this.id = '',
      this.name = '',
      this.phone = '',
      this.email = '',
      this.address = '',
      this.proPictuce = '',
      this.qualification = '',
      this.gender = ''});
      
  Tutor.copy(from)
      : this(
            id: from.id,
            name: from.name,
            phone: from.phone,
            email: from.email,
            address: from.address,
            proPictuce: from.address,
            qualification: from.qualification,
            gender: from.gender);

  Tutor.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            name: json['name'],
            phone: json['phone'],
            email: json['email'],
            address: json['address'],
            proPictuce: json['proPictuce'],
            qualification: json['qualification'],
            gender: json['gender']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'email': email,
        'address': address,
        'proPictuce': proPictuce,
        'qualification': qualification,
        'gender': gender
      };
}
