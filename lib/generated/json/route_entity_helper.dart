import 'package:ingress_key_manager/models/route_entity.dart';

routeEntityFromJson(RouteEntity data, Map<String, dynamic> json) {
	if (json['routes'] != null) {
		data.routes = (json['routes'] as List).map((v) => RouteRoutes().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> routeEntityToJson(RouteEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['routes'] =  entity.routes?.map((v) => v.toJson())?.toList();
	return data;
}

routeRoutesFromJson(RouteRoutes data, Map<String, dynamic> json) {
	if (json['route'] != null) {
		data.route = RouteRoutesRoute().fromJson(json['route']);
	}
	if (json['route_stops'] != null) {
		data.routeStops = (json['route_stops'] as List).map((v) => RouteRoutesRouteStops().fromJson(v)).toList();
	}
	if (json['route_keys'] != null) {
		data.routeKeys = (json['route_keys'] as List).map((v) => RouteRoutesRouteKeys().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> routeRoutesToJson(RouteRoutes entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['route'] = entity.route?.toJson();
	data['route_stops'] =  entity.routeStops?.map((v) => v.toJson())?.toList();
	data['route_keys'] =  entity.routeKeys?.map((v) => v.toJson())?.toList();
	return data;
}

routeRoutesRouteFromJson(RouteRoutesRoute data, Map<String, dynamic> json) {
	if (json['route_id'] != null) {
		data.routeId = json['route_id'] is String
				? int.tryParse(json['route_id'])
				: json['route_id'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['user'] != null) {
		data.user = RouteRoutesRouteUser().fromJson(json['user']);
	}
	return data;
}

Map<String, dynamic> routeRoutesRouteToJson(RouteRoutesRoute entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['route_id'] = entity.routeId;
	data['name'] = entity.name;
	data['user'] = entity.user?.toJson();
	return data;
}

routeRoutesRouteUserFromJson(RouteRoutesRouteUser data, Map<String, dynamic> json) {
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

Map<String, dynamic> routeRoutesRouteUserToJson(RouteRoutesRouteUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['user_id'] = entity.userId;
	data['username'] = entity.username;
	data['email'] = entity.email;
	data['validated'] = entity.validated;
	data['avatar'] = entity.avatar;
	return data;
}

routeRoutesRouteStopsFromJson(RouteRoutesRouteStops data, Map<String, dynamic> json) {
	if (json['stop_id'] != null) {
		data.stopId = json['stop_id'] is String
				? int.tryParse(json['stop_id'])
				: json['stop_id'].toInt();
	}
	if (json['route'] != null) {
		data.route = RouteRoutesRouteStopsRoute().fromJson(json['route']);
	}
	if (json['user'] != null) {
		data.user = RouteRoutesRouteStopsUser().fromJson(json['user']);
	}
	if (json['order'] != null) {
		data.order = json['order'] is String
				? int.tryParse(json['order'])
				: json['order'].toInt();
	}
	return data;
}

Map<String, dynamic> routeRoutesRouteStopsToJson(RouteRoutesRouteStops entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['stop_id'] = entity.stopId;
	data['route'] = entity.route?.toJson();
	data['user'] = entity.user?.toJson();
	data['order'] = entity.order;
	return data;
}

routeRoutesRouteStopsRouteFromJson(RouteRoutesRouteStopsRoute data, Map<String, dynamic> json) {
	if (json['route_id'] != null) {
		data.routeId = json['route_id'] is String
				? int.tryParse(json['route_id'])
				: json['route_id'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['user'] != null) {
		data.user = RouteRoutesRouteStopsRouteUser().fromJson(json['user']);
	}
	return data;
}

Map<String, dynamic> routeRoutesRouteStopsRouteToJson(RouteRoutesRouteStopsRoute entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['route_id'] = entity.routeId;
	data['name'] = entity.name;
	data['user'] = entity.user?.toJson();
	return data;
}

routeRoutesRouteStopsRouteUserFromJson(RouteRoutesRouteStopsRouteUser data, Map<String, dynamic> json) {
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

Map<String, dynamic> routeRoutesRouteStopsRouteUserToJson(RouteRoutesRouteStopsRouteUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['user_id'] = entity.userId;
	data['username'] = entity.username;
	data['email'] = entity.email;
	data['validated'] = entity.validated;
	data['avatar'] = entity.avatar;
	return data;
}

routeRoutesRouteStopsUserFromJson(RouteRoutesRouteStopsUser data, Map<String, dynamic> json) {
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

Map<String, dynamic> routeRoutesRouteStopsUserToJson(RouteRoutesRouteStopsUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['user_id'] = entity.userId;
	data['username'] = entity.username;
	data['email'] = entity.email;
	data['validated'] = entity.validated;
	data['avatar'] = entity.avatar;
	return data;
}

routeRoutesRouteKeysFromJson(RouteRoutesRouteKeys data, Map<String, dynamic> json) {
	if (json['route_key_id'] != null) {
		data.routeKeyId = json['route_key_id'] is String
				? int.tryParse(json['route_key_id'])
				: json['route_key_id'].toInt();
	}
	if (json['route'] != null) {
		data.route = RouteRoutesRouteKeysRoute().fromJson(json['route']);
	}
	if (json['portal'] != null) {
		data.portal = RouteRoutesRouteKeysPortal().fromJson(json['portal']);
	}
	if (json['quantity'] != null) {
		data.quantity = json['quantity'] is String
				? int.tryParse(json['quantity'])
				: json['quantity'].toInt();
	}
	return data;
}

Map<String, dynamic> routeRoutesRouteKeysToJson(RouteRoutesRouteKeys entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['route_key_id'] = entity.routeKeyId;
	data['route'] = entity.route?.toJson();
	data['portal'] = entity.portal?.toJson();
	data['quantity'] = entity.quantity;
	return data;
}

routeRoutesRouteKeysRouteFromJson(RouteRoutesRouteKeysRoute data, Map<String, dynamic> json) {
	if (json['route_id'] != null) {
		data.routeId = json['route_id'] is String
				? int.tryParse(json['route_id'])
				: json['route_id'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['user'] != null) {
		data.user = RouteRoutesRouteKeysRouteUser().fromJson(json['user']);
	}
	return data;
}

Map<String, dynamic> routeRoutesRouteKeysRouteToJson(RouteRoutesRouteKeysRoute entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['route_id'] = entity.routeId;
	data['name'] = entity.name;
	data['user'] = entity.user?.toJson();
	return data;
}

routeRoutesRouteKeysRouteUserFromJson(RouteRoutesRouteKeysRouteUser data, Map<String, dynamic> json) {
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

Map<String, dynamic> routeRoutesRouteKeysRouteUserToJson(RouteRoutesRouteKeysRouteUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['user_id'] = entity.userId;
	data['username'] = entity.username;
	data['email'] = entity.email;
	data['validated'] = entity.validated;
	data['avatar'] = entity.avatar;
	return data;
}

routeRoutesRouteKeysPortalFromJson(RouteRoutesRouteKeysPortal data, Map<String, dynamic> json) {
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

Map<String, dynamic> routeRoutesRouteKeysPortalToJson(RouteRoutesRouteKeysPortal entity) {
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