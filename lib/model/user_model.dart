class UserModel {
  String? userName;
  String? email;
  String? password;
  String? city;
  String? address;
  String? profession;
  String? pose;
  UserModel(
      {
        this.pose,
        this.userName,
        this.email,
        this.password,
        this.city,
        this.address,
        this.profession
      });

  // receiving data from server
  factory UserModel.fromMapRegsitration(map) {
    return UserModel(
      email: map['email'],
      userName: map['userName'],
      password: map['password'],
      profession: map['profession']
    );
  }
  factory UserModel.fromMapPlayerRegistration(map) {
    return UserModel(
        email: map['email'],
        userName: map['userName'],
        password: map['password'],
        address: map['address'],
        city: map['city'],
      profession: map['profession'],
    );
  }
  // sending data to our server
  Map<String, dynamic> toBecomeRegistration() {
    return {
      'email': email,
      'userName': userName,
      'password': password,
      'profession': 'Audience'
    };
  }
  Map<String, dynamic> toBecomePlayerRegistration() {
    return {
      'city': city,
      'email': email,
      'userName': userName,
      'password': password,
      'address': address,
      'profession': 'Player'
    };
  }
  Map<String, dynamic> toTask() {
    return {
      'pose':pose
    };
  }
  Map<String, dynamic> toUpdateAudience() {
    return {
      'userName':userName
    };
  }
  Map<String, dynamic> toUpdatePlayerRegistration() {
    return {
      'city': city,
      'userName': userName,
      'address': address,
    };
  }
}
