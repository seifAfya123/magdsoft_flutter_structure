import 'dart:convert';

class Person {
  String? name;
  String? email;
  String? password;
  String? phone;

  Person({
    this.name,
    this.email,
    this.password,
    this.phone,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      email: json['email'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    // final Map<String, dynamic> data = {};
    final data = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    });
    // data['name'] = name;
    // data['email'] = email;
    // data['password'] = password;
    // data['phone'] = phone;
    return data as Map<String, String>;
  }
}

class Accounts {
  List<dynamic>? persons;
  int? status;
  Accounts({
    required this.persons,
    required this.status,
  });
  factory Accounts.fromJson(Map<String, dynamic> json) {
    return Accounts(
      status: json['status'],
      persons: json['account'] as List<dynamic>?,
    );
  }
}
