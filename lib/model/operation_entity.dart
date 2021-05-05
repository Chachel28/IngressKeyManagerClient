import 'package:ingress_key_manager/generated/json/base/json_convert_content.dart';
import 'package:ingress_key_manager/generated/json/base/json_field.dart';

class OperationEntity with JsonConvert<OperationEntity> {
	List<OperationData> data;
	OperationLinks links;
	OperationMeta meta;
}

class OperationData with JsonConvert<OperationData> {
	int id;
	String slug;
	OperationDataOwner owner;
	String type;
	int active;
	@JSONField(name: "created_at")
	String createdAt;
	@JSONField(name: "updated_at")
	String updatedAt;
	@JSONField(name: "joined_at")
	String joinedAt;
	String role;
}

class OperationDataOwner with JsonConvert<OperationDataOwner> {
	@JSONField(name: "agent_name")
	String agentName;
	@JSONField(name: "trustmaster_id")
	String trustmasterId;
}

class OperationLinks with JsonConvert<OperationLinks> {
	String first;
	String last;
	dynamic prev;
	String next;
}

class OperationMeta with JsonConvert<OperationMeta> {
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
