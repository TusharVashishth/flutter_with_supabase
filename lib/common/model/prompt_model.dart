class PromptModel {
  int? id;
  String? title;
  String? userId;
  String? prompt;
  String? createdAt;
  Users? users;

  PromptModel({
    this.id,
    this.title,
    this.userId,
    this.prompt,
    this.createdAt,
    this.users,
  });

  PromptModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    userId = json['user_id'];
    prompt = json['prompt'];
    createdAt = json['created_at'];
    users = json['users'] != null ? Users.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['user_id'] = userId;
    data['prompt'] = prompt;
    data['created_at'] = createdAt;
    if (users != null) {
      data['users'] = users!.toJson();
    }
    return data;
  }
}

class Users {
  Metadata? metadata;
  String? email;

  Users({this.metadata, this.email});

  Users.fromJson(Map<String, dynamic> json) {
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    data['email'] = email;
    return data;
  }
}

class Metadata {
  String? name;

  Metadata({this.name});

  Metadata.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
