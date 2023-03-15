class NewModel {
  String? NewName;
  String? Emai;
  String? PhoneNumber;

  NewModel({
    this.NewName,
    this.Emai,
    this.PhoneNumber,
  });
  NewModel.fromJson(Map<String, dynamic> json) {
    NewName = json["NewName"];
    Emai = json["Emai"];
    PhoneNumber = json["PhoneNumber"];
  }

  Map<String, dynamic> toMap() {
    return {
      'NewName': NewName,
      'Emai': Emai,
      'PhoneNumber': PhoneNumber,
    };
  }
}
