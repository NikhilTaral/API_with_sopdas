// module/module_api.dart
class User {
  final String email;
  final String password;
  final String greeting;
  final String name;
  final String avatar;

  User({
    required this.email,
    required this.password,
    required this.greeting,
    required this.name,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['Email'],
      password: json['Password'],
      greeting: json['greeting'],
      name: json['name'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Email': email,
      'Password': password,
      'greeting': greeting,
      'name': name,
      'avatar': avatar,
    };
  }
}

class Doctor {
  final String doctorImage;
  final String doctorName;
  final String specialization;
  final String appointmentIcon;
  final int price;

  Doctor({
    required this.doctorImage,
    required this.doctorName,
    required this.specialization,
    required this.appointmentIcon,
    required this.price, required String id, required String imageUrl, required String location, required String name,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      doctorImage: json['doctorImage'],
      doctorName: json['doctorName'],
      specialization: json['specialization'],
      appointmentIcon: json['appointmentIcon'],
      price: json['price'], id: '', imageUrl: '', location: '', name: '',
    );
  }

  

  get experience => null;

  get rating => null;

  Map<String, dynamic> toJson() {
    return {
      'doctorImage': doctorImage,
      'doctorName': doctorName,
      'specialization': specialization,
      'appointmentIcon': appointmentIcon,
      'price': price,
    };
  }
}

class ApiModel {
  final User user;
  final List<Doctor> doctorsList;

  ApiModel({
    required this.user,
    required this.doctorsList,
  });

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    var doctorsListFromJson = json['doctorsList'] as List;
    List<Doctor> doctorsList = doctorsListFromJson.map((i) => Doctor.fromJson(i)).toList();

    return ApiModel(
      user: User.fromJson(json['user']),
      doctorsList: doctorsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'doctorsList': doctorsList.map((doctor) => doctor.toJson()).toList(),
    };
  }
}
