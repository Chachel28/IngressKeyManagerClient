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
	if (json['codename'] != null) {
		data.codename = json['codename'].toString();
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at'].toString();
	}
	if (json['description'] != null) {
		data.description = json['description'].toString();
	}
	if (json['guid'] != null) {
		data.guid = json['guid'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['keys_farmed'] != null) {
		data.keysFarmed = json['keys_farmed'] is String
				? int.tryParse(json['keys_farmed'])
				: json['keys_farmed'].toInt();
	}
	if (json['lat'] != null) {
		data.lat = json['lat'] is String
				? double.tryParse(json['lat'])
				: json['lat'].toDouble();
	}
	if (json['layers'] != null) {
		data.layers = (json['layers'] as List).map((v) => v is String
				? int.tryParse(v)
				: v.toInt()).toList().cast<int>();
	}
	if (json['lng'] != null) {
		data.lng = json['lng'] is String
				? double.tryParse(json['lng'])
				: json['lng'].toDouble();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['updated_at'] != null) {
		data.updatedAt = json['updated_at'].toString();
	}
	return data;
}

Map<String, dynamic> keyDataToJson(KeyData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['codename'] = entity.codename;
	data['created_at'] = entity.createdAt;
	data['description'] = entity.description;
	data['guid'] = entity.guid;
	data['id'] = entity.id;
	data['keys_farmed'] = entity.keysFarmed;
	data['lat'] = entity.lat;
	data['layers'] = entity.layers;
	data['lng'] = entity.lng;
	data['name'] = entity.name;
	data['updated_at'] = entity.updatedAt;
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
		data.next = json['next'];
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