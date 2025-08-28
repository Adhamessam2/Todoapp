import 'package:todoapp/core/models/group_model.dart';
import 'package:todoapp/core/models/user_model.dart';

abstract class GroupStatus {}

class GInitialState extends GroupStatus {}

class LoadingGroups extends GroupStatus {
  final List<GroupModel> groups;

  LoadingGroups({required this.groups});
}

class AddMember extends GroupStatus {
  final List<UserModel> members;

  AddMember({required this.members});
}

class DeleteMember extends GroupStatus {
  final List<UserModel> members;

  DeleteMember({required this.members});
}

class CreateGroup extends GroupStatus {}

class AddError extends GroupStatus {
  final String error;

  AddError({required this.error});
}
