import 'package:ingress_key_manager/generated/json/base/json_convert_content.dart';
import 'package:ingress_key_manager/generated/json/base/json_field.dart';

class RouteEntity with JsonConvert<RouteEntity> {
	List<RouteRoutes> routes;
}

class RouteRoutes with JsonConvert<RouteRoutes> {
	RouteRoutesRoute route;
	@JSONField(name: "route_stops")
	List<RouteRoutesRouteStops> routeStops;
	@JSONField(name: "route_keys")
	List<RouteRoutesRouteKeys> routeKeys;
}

class RouteRoutesRoute with JsonConvert<RouteRoutesRoute> {
	@JSONField(name: "route_id")
	int routeId;
	String name;
	RouteRoutesRouteUser user;
}

class RouteRoutesRouteUser with JsonConvert<RouteRoutesRouteUser> {
	@JSONField(name: "user_id")
	int userId;
	String username;
	String email;
	bool validated;
	String avatar;
}

class RouteRoutesRouteStops with JsonConvert<RouteRoutesRouteStops> {
	@JSONField(name: "stop_id")
	int stopId;
	RouteRoutesRouteStopsRoute route;
	RouteRoutesRouteStopsUser user;
	int order;
}

class RouteRoutesRouteStopsRoute with JsonConvert<RouteRoutesRouteStopsRoute> {
	@JSONField(name: "route_id")
	int routeId;
	String name;
	RouteRoutesRouteStopsRouteUser user;
}

class RouteRoutesRouteStopsRouteUser with JsonConvert<RouteRoutesRouteStopsRouteUser> {
	@JSONField(name: "user_id")
	int userId;
	String username;
	String email;
	bool validated;
	String avatar;
}

class RouteRoutesRouteStopsUser with JsonConvert<RouteRoutesRouteStopsUser> {
	@JSONField(name: "user_id")
	int userId;
	String username;
	String email;
	bool validated;
	String avatar;
}

class RouteRoutesRouteKeys with JsonConvert<RouteRoutesRouteKeys> {
	@JSONField(name: "route_key_id")
	int routeKeyId;
	RouteRoutesRouteKeysRoute route;
	RouteRoutesRouteKeysPortal portal;
	int quantity;
}

class RouteRoutesRouteKeysRoute with JsonConvert<RouteRoutesRouteKeysRoute> {
	@JSONField(name: "route_id")
	int routeId;
	String name;
	RouteRoutesRouteKeysRouteUser user;
}

class RouteRoutesRouteKeysRouteUser with JsonConvert<RouteRoutesRouteKeysRouteUser> {
	@JSONField(name: "user_id")
	int userId;
	String username;
	String email;
	bool validated;
	String avatar;
}

class RouteRoutesRouteKeysPortal with JsonConvert<RouteRoutesRouteKeysPortal> {
	@JSONField(name: "portal_id")
	int portalId;
	@JSONField(name: "portal_name")
	String portalName;
	double latitude;
	double longitude;
	String city;
	String province;
	String guid;
}
