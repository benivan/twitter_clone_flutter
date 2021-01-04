
import 'dart:convert';

UserDetailsResponse userDetailsResponseFromJson(String str) => UserDetailsResponse.fromJson(json.decode(str));

String userDetailsResponseToJson(UserDetailsResponse data) => json.encode(data.toJson());

class UserDetailsResponse {
  UserDetailsResponse({
    this.userCredentials,
    this.notifications,
  });

  UserCredentials userCredentials;
  List<Notification> notifications;

  factory UserDetailsResponse.fromJson(Map<String, dynamic> json) => UserDetailsResponse(
    userCredentials: UserCredentials.fromJson(json["userCredentials"]),
    notifications: List<Notification>.from(json["notifications"].map((x) => Notification.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "userCredentials": userCredentials.toJson(),
    "notifications": List<dynamic>.from(notifications.map((x) => x.toJson())),
  };
}

class Notification {
  Notification({
    this.recipient,
    this.sender,
    this.createdAt,
    this.type,
    this.screamId,
    this.read,
    this.notificationId,
  });

  String recipient;
  String sender;
  DateTime createdAt;
  String type;
  String screamId;
  bool read;
  String notificationId;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    recipient: json["recipient"],
    sender: json["sender"],
    createdAt: DateTime.parse(json["createdAt"]),
    type: json["type"],
    screamId: json["screamId"],
    read: json["read"],
    notificationId: json["notificationId"],
  );

  Map<String, dynamic> toJson() => {
    "recipient": recipient,
    "sender": sender,
    "createdAt": createdAt.toIso8601String(),
    "type": type,
    "screamId": screamId,
    "read": read,
    "notificationId": notificationId,
  };
}

class UserCredentials {
  UserCredentials({
    this.website,
    this.imageUrl,
    this.location,
    this.userId,
    this.bio,
    this.handle,
    this.name,
    this.createdAt,
    this.email,
  });

  String website;
  String imageUrl;
  String location;
  String userId;
  String bio;
  String handle;
  String name;
  DateTime createdAt;
  String email;

  factory UserCredentials.fromJson(Map<String, dynamic> json) => UserCredentials(
    website: json["website"],
    imageUrl: json["imageUrl"],
    location: json["location"],
    userId: json["userId"],
    bio: json["bio"],
    handle: json["handle"],
    name: json["name"],
    createdAt: DateTime.parse(json["createdAt"]),
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "website": website,
    "imageUrl": imageUrl,
    "location": location,
    "userId": userId,
    "bio": bio,
    "handle": handle,
    "name": name,
    "createdAt": createdAt.toIso8601String(),
    "email": email,
  };
}
