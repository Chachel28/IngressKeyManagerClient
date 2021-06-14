import 'package:ingress_key_manager/models/key_entity.dart';

keyEntityFromJson(KeyEntity data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => KeyData().fromJson(v)).toList();
	}
	if (json['links'] != null) {
		data.links = KeyLinks().fromJson(json['links']);
	}
	if (json['meta'] != null) {
		data.meta = KeyMeta().fromJson(json['meta']);
	}
	return data;
}

Map<String, dynamic> keyEntityToJson(KeyEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	data['links'] = entity.links?.toJson();
	data['meta'] = entity.meta?.toJson();
	return data;
}

keyDataFromJson(KeyData data, Map<String, dynamic> json) {
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
	if (json['keys'] != null) {
		data.keys = json['keys'] is String
				? int.tryParse(json['keys'])
				: json['keys'].toInt();
	}
	return data;
}

Map<String, dynamic> keyDataToJson(KeyData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['portal_id'] = entity.portalId;
	data['portal_name'] = entity.portalName;
	data['latitude'] = entity.latitude;
	data['longitude'] = entity.longitude;
	data['city'] = entity.city;
	data['province'] = entity.province;
	data['guid'] = entity.guid;
	data['keys'] = entity.keys;
	return data;
}

keyLinksFromJson(KeyLinks data, Map<String, dynamic> json) {
	if (json['first'] != null) {
		data.first = json['first'].toString();
	}
	if (json['last'] != null) {
		data.last = json['last'].toString();
	}
	if (json['next'] != null) {
		data.next = json['next'].toString();
	}
	if (json['prev'] != null) {
		data.prev = json['prev'];
	}
	return data;
}

Map<String, dynamic> keyLinksToJson(KeyLinks entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['first'] = entity.first;
	data['last'] = entity.last;
	data['next'] = entity.next;
	data['prev'] = entity.prev;
	return data;
}

keyMetaFromJson(KeyMeta data, Map<String, dynamic> json) {
	if (json['current_page'] != null) {
		data.currentPage = json['current_page'] is String
				? int.tryParse(json['current_page'])
				: json['current_page'].toInt();
	}
	if (json['from'] != null) {
		data.from = json['from'] is String
				? int.tryParse(json['from'])
				: json['from'].toInt();
	}
	if (json['last_page'] != null) {
		data.lastPage = json['last_page'] is String
				? int.tryParse(json['last_page'])
				: json['last_page'].toInt();
	}
	if (json['path'] != null) {
		data.path = json['path'].toString();
	}
	if (json['per_page'] != null) {
		data.perPage = json['per_page'] is String
				? int.tryParse(json['per_page'])
				: json['per_page'].toInt();
	}
	if (json['to'] != null) {
		data.to = json['to'] is String
				? int.tryParse(json['to'])
				: json['to'].toInt();
	}
	if (json['total'] != null) {
		data.total = json['total'] is String
				? int.tryParse(json['total'])
				: json['total'].toInt();
	}
	return data;
}

Map<String, dynamic> keyMetaToJson(KeyMeta entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['current_page'] = entity.currentPage;
	data['from'] = entity.from;
	data['last_page'] = entity.lastPage;
	data['path'] = entity.path;
	data['per_page'] = entity.perPage;
	data['to'] = entity.to;
	data['total'] = entity.total;
	return data;
}