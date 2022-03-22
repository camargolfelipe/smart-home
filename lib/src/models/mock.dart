class MockModel {
  Mock? mock;

  MockModel({this.mock});

  MockModel.fromJson(Map<String, dynamic> json) {
    mock = json['mock'] != null ? new Mock.fromJson(json['mock']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mock != null) {
      data['mock'] = this.mock!.toJson();
    }
    return data;
  }
}

class Mock {
  List<Devices>? devices;
  Image? image;

  Mock({this.devices, this.image});

  Mock.fromJson(Map<String, dynamic> json) {
    if (json['devices'] != null) {
      devices = <Devices>[];
      json['devices'].forEach((v) {
        devices!.add(new Devices.fromJson(v));
      });
    }
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.devices != null) {
      data['devices'] = this.devices!.map((v) => v.toJson()).toList();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class Devices {
  String? title;
  String? description;
  String? type;
  String? location;
  bool? active;
  String? icon;

  Devices(
      {this.title,
      this.description,
      this.type,
      this.location,
      this.active,
      this.icon});

  Devices.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    type = json['type'];
    location = json['location'];
    active = json['active'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['type'] = this.type;
    data['location'] = this.location;
    data['active'] = this.active;
    data['icon'] = this.icon;
    return data;
  }
}

class Image {
  String? src;
  String? name;
  int? hOffset;
  int? vOffset;
  String? alignment;

  Image({this.src, this.name, this.hOffset, this.vOffset, this.alignment});

  Image.fromJson(Map<String, dynamic> json) {
    src = json['src'];
    name = json['name'];
    hOffset = json['hOffset'];
    vOffset = json['vOffset'];
    alignment = json['alignment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['src'] = this.src;
    data['name'] = this.name;
    data['hOffset'] = this.hOffset;
    data['vOffset'] = this.vOffset;
    data['alignment'] = this.alignment;
    return data;
  }
}
