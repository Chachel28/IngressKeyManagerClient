import 'package:ingress_key_manager/generated/json/base/json_convert_content.dart';
import 'package:ingress_key_manager/generated/json/base/json_field.dart';

class KeyEntity with JsonConvert<KeyEntity> {
	List<KeyData> data;
	KeyLinks links;
	KeyMeta meta;
}

class KeyData with JsonConvert<KeyData> {
	String codename;
	@JSONField(name: "created_at")
	String createdAt;
	String description;
	String guid;
	int id;
	@JSONField(name: "keys_farmed")
	int keysFarmed;
	double lat;
	List<int> layers;
	double lng;
	String name;
	@JSONField(name: "updated_at")
	String updatedAt;
}

class KeyLinks with JsonConvert<KeyLinks> {
	String first;
	String last;
	dynamic next;
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
