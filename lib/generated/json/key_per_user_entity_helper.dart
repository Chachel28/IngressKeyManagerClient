import 'package:ingress_key_manager/models/key_per_user_entity.dart';

keyPerUserEntityFromJson(KeyPerUserEntity data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => KeyPerUserData().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> keyPerUserEntityToJson(KeyPerUserEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

keyPerUserDataFromJson(KeyPerUserData data, Map<String, dynamic> json) {
	if (json['key_id'] != null) {
		data.keyId = json['key_id'] is String
				? int.tryParse(json['key_id'])
				: json['key_id'].toInt();
	}
	if (json['user'] != null) {
		data.user = KeyPerUserDataUser().fromJson(json['user']);
	}
	if (json['portal'] != null) {
		data.portal = KeyPerUserDataPortal().fromJson(json['portal']);
	}
	if (json['quantity'] != null) {
		data.quantity = json['quantity'] is String
				? int.tryParse(json['quantity'])
				: json['quantity'].toInt();
	}
	return data;
}

Map<String, dynamic> keyPerUserDataToJson(KeyPerUserData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['key_id'] = entity.keyId;
	data['user'] = entity.user?.toJson();
	data['portal'] = entity.portal?.toJson();
	data['quantity'] = entity.quantity;
	return data;
}

keyPerUserDataUserFromJson(KeyPerUserDataUser data, Map<String, dynamic> json) {
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
	if (json['avatar'] != null) {
		data.avatar = json['avatar'].toString();
	}
	return data;
}

Map<String, dynamic> keyPerUserDataUserToJson(KeyPerUserDataUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['user_id'] = entity.userId;
	data['username'] = entity.username;
	data['email'] = entity.email;
	data['validated'] = entity.validated;
	data['avatar'] = entity.avatar;
	return data;
}

keyPerUserDataPortalFromJson(KeyPerUserDataPortal data, Map<String, dynamic> json) {
	if (json['portal_id'] != null) {
		data.portalId = json['portal_id'] is String
				? int.tryParse(json['portal_id'])
				: json['portal_id'].toInt();
	}
	if (json['portal_name'] != null) {
		data.portalName = json['portal_name'].toString();
	}
	if (json['latitude'] != null) {
		data.latitude = json['latitude'] is String
				? double.tryParse(json['latitude'])
				: json['latitude'].toDouble();
	}
	if (json['longitude'] != null) {
		data.longitude = json['longitude'] is String
				? double.tryParse(json['longitude'])
				: json['longitude'].toDouble();
	}
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['province'] != null) {
		data.province = json['province'].toString();
	}
	if (json['guid'] != null) {
		data.guid = json['guid'].toString();
	}
	return data;
}

Map<String, dynamic> keyPerUserDataPortalToJson(KeyPerUserDataPortal entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['portal_id'] = entity.portalId;
	data['portal_name'] = entity.portalName;
	data['latitude'] = entity.latitude;
	data['longitude'] = entity.longitude;
	data['city'] = entity.city;
	data['province'] = entity.province;
	data['guid'] = entity.guid;
	return data;
}