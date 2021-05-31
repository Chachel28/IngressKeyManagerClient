import 'package:ingress_key_manager/models/user_d_t_o_entity.dart';

userDTOEntityFromJson(UserDTOEntity data, Map<String, dynamic> json) {
	if (json['user_id'] != null) {
		data.userId = json['user_id'] is String
				? int.tryParse(json['user_id'])
				: json['user_id'].toInt();
	}
	if (json['username'] != null) {
		data.username = json['username'].toString();
	}
	if (json['email'] != null) {
		data.email = json['email'].toString();
	}
	if (json['validated'] != null) {
		data.validated = json['validated'];
	}
	return data;
}

Map<String, dynamic> userDTOEntityToJson(UserDTOEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['user_id'] = entity.userId;
	data['username'] = entity.username;
	data['email'] = entity.email;
	data['validated'] = entity.validated;
	return data;
}