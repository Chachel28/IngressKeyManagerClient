import 'package:ingress_key_manager/generated/json/base/json_convert_content.dart';
import 'package:ingress_key_manager/generated/json/base/json_field.dart';

class UserEntity with JsonConvert<UserEntity> {
	@JSONField(name: "user_id")
	int userId;
	String username;
	String password;
	String email;
	String token;
	@JSONField(name: "refresh_token")
	String refreshToken;
	String expireDate;
}
