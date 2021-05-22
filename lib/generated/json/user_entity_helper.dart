import 'package:ingress_key_manager/models/user_entity.dart';

userEntityFromJson(UserEntity data, Map<String, dynamic> json) {
	if (json['user_id'] != null) {
		data.userId = json['user_id'] is String
				? int.tryParse(json['user_id'])
				: json['user_id'].toInt();
	}
	if (json['username'] != null) {
		data.username = json['username'].toString();
	}
	if (json['password'] != null) {
		data.password = json['password'].toString();
	}
	if (json['email'] != null) {
		data.email = json['email'].toString();
	}
	if (json['token'] != null) {
		data.token = json['token'].toString();
	}
	if (json['refresh_token'] != null) {
		data.refreshToken = json['refresh_token'].toString();
	}
	if (json['expireDate'] != null) {
		data.expireDate = json['expireDate'].toString();
	}
	return data;
}

Map<String, dynamic> userEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['user_id'] = entity.userId;
	data['username'] = entity.username;
	data['password'] = entity.password;
	data['email'] = entity.email;
	data['token'] = entity.token;
	data['refresh_token'] = entity.refreshToken;
	data['expireDate'] = entity.expireDate;
	return data;
}