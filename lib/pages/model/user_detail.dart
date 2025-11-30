import 'package:json_annotation/json_annotation.dart';

part 'user_detail.g.dart';

@JsonSerializable(explicitToJson: true)
class UserDetail {
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String profilePicture;
  final String occupation;

  const UserDetail({
    required this.name,
    required this.email,
    this.phoneNumber = "",
    this.address = "",
    this.profilePicture = "",
    this.occupation = "",
  });

                                                                                      // JSON to Model
  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);

                                                                                      // Model to JSON
  Map<String, dynamic> toJson() => _$UserDetailToJson(this);
}





/* class UserDetail {

  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String profilePicture;
  final String occupation;

  const UserDetail({
    required this.name,
    required this.email,
    this.phoneNumber = "",
    this.address = "",
    this.profilePicture = "",
    this.occupation = "",
  });

                                                                 // Convert to Firestore-friendly Map
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "address": address,
      "profilePicture": profilePicture,
      "occupation": occupation,
    };
  }

                                                                // Convert Firestore JSON to Dart Model...with nullable provisions
  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
      address: json["address"] ?? "",
      profilePicture: json["profilePicture"] ?? "",
      occupation: json["occupation"] ?? "",
    );
  }
} */











/*class UserDetail {
  const UserDetail({
                                            //required this.id,  ...can add but in our app testing since we are using dummy emails and know they won't crash, then we don't need an id, we can use/set email as our id
    required this.name,
    this.profilePicture = "",
    required this.email,
    this.phoneNumber = "",
    this.address = "",
    this.occupation = "",
  });

        //Creating factory method for json parsing (or converting) our userdetails from an object to the Map for that Firebase needs/expects

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,                    //no need for id too like above, but can add in a project that needs
      "email": this.email,
      "phoneNumber": this.phoneNumber,
      "address": this.address,
      "profilePicture": this.profilePicture,
      "occupation": this.occupation,
    };
  }

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      name: json["name"],
      email: json["email"],
      address: json["address"],
      occupation: json["occupation"],
      profilePicture: json["profilePicture"],
    );
  }
} */