import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/data/firebase_functions.dart';
import 'package:todoapp/core/models/group_model.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/models/user_model.dart';
import 'package:todoapp/features/add_group/cubit/group_status.dart';

class GroupCubit extends Cubit<GroupStatus> {
  late UserModel currentUser;
  List<TodoModel> todos = [];
  DateTime deadline = DateTime.now();
  final FirebaseFunctions _db = FirebaseFunctions();
  List<String> membersId = [];
  List<String> membersUsername = [];
  List<UserModel> members = [];
  bool validate = false;
  GroupCubit() : super(GInitialState());
  void addMembers(String id) async {
    if (id.isNotEmpty) {
      membersId.add(id);
      UserModel newmember = await _db.getUserByID(id);
      if (newmember.id.isNotEmpty) {
        members.add(newmember);
        membersUsername.add(newmember.username);
        emit(AddMember(membersUsername: membersUsername));
        validate = true;
      } else {
        emit(AddError(error: "User Not Found"));
      }
    } else {
      emit(AddError(error: "Member ID Can't be empty"));
    }
  }

  void deleteMember(String removeId) {
    membersId.removeWhere((id) => id == removeId);
    membersUsername.removeWhere((id) => id == removeId);
    members.removeWhere((member) => member.id == removeId);
    emit(DeleteMember(membersId: membersId));
  }

  void craeteGroup({
    required String groupName,
    required String groupDes,
  }) async {
    UserModel user = await _db.getCurrentUser();
    if (groupName.isEmpty || groupDes.isEmpty || !validate) {
      emit(AddError(error: "groupe feilds can't be empty"));
    } else {
      addMembers(user.id);
      _db.addGroup(
        GroupModel(
          groupId: "${user.id}${DateTime.now().microsecond}",
          groupeName: groupName,
          groupDescription: groupDes,
          membersID: membersId,
          tasksID: [],
        ),
      );
      members = [];
      membersId = [];
      membersUsername = [];
      emit(CreateGroup());
      validate = false;
    }
  }
}
