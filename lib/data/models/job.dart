import 'package:equatable/equatable.dart';

class Job extends Equatable {
  bool status;
  String message;
  List<JobData> data;

  Job({this.status, this.message, this.data});

  Job.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<JobData>();
      json['data'].forEach((v) {
        data.add(new JobData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object> get props => [status, message, data];
}

class JobData extends Equatable {
  String id;
  String name;

  JobData({this.id, this.name});

  JobData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }

  @override
  List<Object> get props => [id, name];
}
