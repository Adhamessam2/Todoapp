import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/data/firebase_functions.dart';
import 'package:todoapp/core/models/group_model.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/models/user_model.dart';
import 'package:todoapp/features/add_group/cubit/group_status.dart';

class GroupCubit extends Cubit<GroupStatus> {
  late UserModel currentUser;
  DateTime deadline = DateTime.now();
  final FirebaseFunctions _db = FirebaseFunctions();
  List<UserModel> members = [];
  List<String> membersId = [];
  bool validate = false;
  GroupCubit() : super(GInitialState());
  void addMembers(String id) async {
    if (id.isNotEmpty) {
      UserModel newmember = await _db.getUserByID(id);
      if (newmember.id.isNotEmpty) {
        members.add(newmember);
        membersId.add(id);
        emit(AddMember(members: members));
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
    members.removeWhere((member) => member.id == removeId);
    print(membersId.toList());
    emit(DeleteMember(members: members));
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
      emit(CreateGroup());
      validate = false;
    }
  }
}
