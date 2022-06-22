import 'dart:convert';

OrganisationRequest orgRequestFromJson(String str) => OrganisationRequest.fromJson(json.decode(str));
String orgRequestToJson(OrganisationRequest data) => json.encode(data.toJson());

class OrganisationRequest {
  OrganisationRequest({
    required this.name,
  });

  String name;

  factory OrganisationRequest.fromJson(Map<String, dynamic> json) => OrganisationRequest(
    name: json["jwt"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
