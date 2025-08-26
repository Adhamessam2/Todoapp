import 'package:todoapp/core/models/todo_model.dart';

abstract class GroupStatus {}

class GInitialState extends GroupStatus {}

class AddGroup extends GroupStatus {
  final List<TodoModel> todos;
  AddGroup({required this.todos});
}

class AddMember extends GroupStatus {
  final List<String> membersUsername;

  AddMember({required this.membersUsername});
}

class DeleteMember extends GroupStatus {
  final List<String> membersId;

  DeleteMember({required this.membersId});
}

class CreateGroup extends GroupStatus {}

class AddError extends GroupStatus {
  final String error;

  AddError({required this.error});
}
