import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/models/user_model.dart';

abstract class GroupStatus {}

class GInitialState extends GroupStatus {}

class AddGroup extends GroupStatus {
  final List<TodoModel> todos;
  AddGroup({required this.todos});
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
