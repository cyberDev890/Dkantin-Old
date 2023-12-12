class Count {
  Data? data;
  int? code;
  bool? status;

  Count({this.data, this.code, this.status});

  Count.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data?.fromJson(json['data']) : null;
    code = json['code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = this.code;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? selesai;
  int? dilayani;

  Data({this.selesai, this.dilayani});

  Data.fromJson(Map<String, dynamic> json) {
    selesai = json['selesai'];
    dilayani = json['dilayani'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['selesai'] = selesai;
    data['dilayani'] = dilayani;
    return data;
  }
}
