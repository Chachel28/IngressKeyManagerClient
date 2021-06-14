import 'package:ingress_key_manager/generated/json/base/json_convert_content.dart';
import 'package:ingress_key_manager/generated/json/base/json_field.dart';

class KeyPerUserEntity with JsonConvert<KeyPerUserEntity> {
	List<KeyPerUserData> data;
}

class KeyPerUserData with JsonConvert<KeyPerUserData> {
	@JSONField(name: "key_id")
	int keyId;
	KeyPerUserDataUser user;
	KeyPerUserDataPortal portal;
	int quantity;
}

class KeyPerUserDataUser with JsonConvert<KeyPerUserDataUser> {
	@JSONField(name: "user_id")
	int userId;
	String username;
	String email;
	bool validated;
	String avatar;
}

class KeyPerUserDataPortal with JsonConvert<KeyPerUserDataPortal> {
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
