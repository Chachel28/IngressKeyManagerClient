import 'package:ingress_key_manager/generated/json/base/json_convert_content.dart';
import 'package:ingress_key_manager/generated/json/base/json_field.dart';

class UserDTOEntity with JsonConvert<UserDTOEntity> {
	@JSONField(name: "user_id")
	int userId;
	String username;
	String email;
	bool validated;
}
