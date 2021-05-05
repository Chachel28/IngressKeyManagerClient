import 'package:ingress_key_manager/model/operation_entity.dart';

operationEntityFromJson(OperationEntity data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => OperationData().fromJson(v)).toList();
	}
	if (json['links'] != null) {
		data.links = OperationLinks().fromJson(json['links']);
	}
	if (json['meta'] != null) {
		data.meta = OperationMeta().fromJson(json['meta']);
	}
	return data;
}

Map<String, dynamic> operationEntityToJson(OperationEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	data['links'] = entity.links?.toJson();
	data['meta'] = entity.meta?.toJson();
	return data;
}

operationDataFromJson(OperationData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['slug'] != null) {
		data.slug = json['slug'].toString();
	}
	if (json['owner'] != null) {
		data.owner = OperationDataOwner().fromJson(json['owner']);
	}
	if (json['type'] != null) {
		data.type = json['type'].toString();
	}
	if (json['active'] != null) {
		data.active = json['active'] is String
				? int.tryParse(json['active'])
				: json['active'].toInt();
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at'].toString();
	}
	if (json['updated_at'] != null) {
		data.updatedAt = json['updated_at'].toString();
	}
	if (json['joined_at'] != null) {
		data.joinedAt = json['joined_at'].toString();
	}
	if (json['role'] != null) {
		data.role = json['role'].toString();
	}
	return data;
}

Map<String, dynamic> operationDataToJson(OperationData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['slug'] = entity.slug;
	data['owner'] = entity.owner?.toJson();
	data['type'] = entity.type;
	data['active'] = entity.active;
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	data['joined_at'] = entity.joinedAt;
	data['role'] = entity.role;
	return data;
}

operationDataOwnerFromJson(OperationDataOwner data, Map<String, dynamic> json) {
	if (json['agent_name'] != null) {
		data.agentName = json['agent_name'].toString();
	}
	if (json['trustmaster_id'] != null) {
		data.trustmasterId = json['trustmaster_id'].toString();
	}
	return data;
}

Map<String, dynamic> operationDataOwnerToJson(OperationDataOwner entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['agent_name'] = entity.agentName;
	data['trustmaster_id'] = entity.trustmasterId;
	return data;
}

operationLinksFromJson(OperationLinks data, Map<String, dynamic> json) {
	if (json['first'] != null) {
		data.first = json['first'].toString();
	}
	if (json['last'] != null) {
		data.last = json['last'].toString();
	}
	if (json['prev'] != null) {
		data.prev = json['prev'];
	}
	if (json['next'] != null) {
		data.next = json['next'].toString();
	}
	return data;
}

Map<String, dynamic> operationLinksToJson(OperationLinks entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['first'] = entity.first;
	data['last'] = entity.last;
	data['prev'] = entity.prev;
	data['next'] = entity.next;
	return data;
}

operationMetaFromJson(OperationMeta data, Map<String, dynamic> json) {
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

Map<String, dynamic> operationMetaToJson(OperationMeta entity) {
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