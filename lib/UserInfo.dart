class UserInfo {
  int? code;
  Data? data;
  String? message;

  UserInfo({this.code, this.data, this.message});

  UserInfo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? mcStatus;
  String? workId;
  String? mobile;
  int? isMc;
  String? userId;
  int? common;
  int? sex;
  String? realName;
  String? departmentName;
  String? headUrl;
  String? departmentCode;
  String? companycode;

  Data(
      {this.mcStatus,
      this.workId,
      this.mobile,
      this.isMc,
      this.userId,
      this.common,
      this.sex,
      this.realName,
      this.departmentName,
      this.headUrl,
      this.departmentCode,
      this.companycode});

  Data.fromJson(Map<String, dynamic> json) {
    mcStatus = json['mcStatus'];
    workId = json['workId'];
    mobile = json['mobile'];
    isMc = json['isMc'];
    userId = json['userId'];
    common = json['common'];
    sex = json['sex'];
    realName = json['realName'];
    departmentName = json['departmentName'];
    headUrl = json['headUrl'];
    departmentCode = json['departmentCode'];
    companycode = json['companycode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mcStatus'] = this.mcStatus;
    data['workId'] = this.workId;
    data['mobile'] = this.mobile;
    data['isMc'] = this.isMc;
    data['userId'] = this.userId;
    data['common'] = this.common;
    data['sex'] = this.sex;
    data['realName'] = this.realName;
    data['departmentName'] = this.departmentName;
    data['headUrl'] = this.headUrl;
    data['departmentCode'] = this.departmentCode;
    data['companycode'] = this.companycode;
    return data;
  }
}
