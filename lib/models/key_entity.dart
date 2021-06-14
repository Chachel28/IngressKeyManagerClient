import 'package:ingress_key_manager/generated/json/base/json_convert_content.dart';
import 'package:ingress_key_manager/generated/json/base/json_field.dart';

class KeyEntity with JsonConvert<KeyEntity> {
	List<KeyData> data;
	KeyLinks links;
	KeyMeta meta;
}

class KeyData with JsonConvert<KeyData> {
	@JSONField(name: "portal_id")
	int portalId;
	@JSONField(name: "portal_name")
	String portalName;
	double latitude;
	double longitude;
	String city;
	String province;
	String guid;
	int keys;
}

class KeyLinks with JsonConvert<KeyLinks> {
	String first;
	String last;
	String next;
	dynamic prev;
}

class KeyMeta with JsonConvert<KeyMeta> {
	@JSONField(name: "current_page")
	int currentPage;
	int from;
	@JSONField(name: "last_page")
	int lastPage;
	String path;
	@JSONField(name: "per_page")
	int perPage;
	int to;
	int total;
}
