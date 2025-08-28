// i made this as an alternative solution
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/widegts/button.dart';
import 'package:todoapp/core/widegts/custmized_text_field.dart';
import 'package:todoapp/core/widegts/snackbar_custmized.dart';
import 'package:todoapp/features/group/cubit/group_cubit.dart';
import 'package:todoapp/features/group/cubit/group_status.dart';

class AddGroupScreen extends StatelessWidget {
  AddGroupScreen({super.key});
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _desCtrl = TextEditingController();
  final TextEditingController _memberIdCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocConsumer<GroupCubit, GroupStatus>(
        builder: (context, state) {
          final cubit = context.read<GroupCubit>();
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Appcolors.lightblue,
                  Appcolors.blue,
                  Appcolors.navyblue,
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(width * 0.07),
              child: Column(
                spacing: height * 0.02,
                children: [
                  SizedBox(height: height * 0.03),
                  Text(
                    "Add new Group",
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                  CustmizedTextField(ctrl: _titleCtrl, lable: 'Group Name'),
                  SizedBox(height: 5),
                  CustmizedTextField(
                    ctrl: _desCtrl,
                    lable: 'Group Description',
                  ),
                  SizedBox(height: 15),
                  CustmizedTextField(
                    ctrl: _memberIdCtrl,
                    lable:
                        'Group member ID (add one member a time),\nyou will be add auto.',
                  ),
                  DropdownButton<String>(
                    elevation: 5,
                    value: null, // أو قيمة محددة من الـ list
                    hint: Text("Show member"),
                    items: (state is AddMember)
                        ? state.members.map((member) {
                            return DropdownMenuItem<String>(
                              value: member.id,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                margin: EdgeInsets.all(4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Center(child: Icon(Icons.person)),
                                    ),
                                    Text(
                                      member.username,
                                      style: TextStyle(color: Colors.amber),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        cubit.deleteMember(member.id);
                                      },
                                      icon: Center(
                                        child: Icon(Icons.cancel_outlined),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList()
                        : [],
                    onChanged: (value) {
                      //here will show the profile of the member
                    },
                  ),
                  Button(
                    addFun: () {
                      cubit.addMembers(_memberIdCtrl.text);
                    },
                    lable: 'Add Member',
                    size: 'mid',
                  ),
                  Button(
                    addFun: () {
                      cubit.craeteGroup(
                        groupDes: _desCtrl.text,
                        groupName: _titleCtrl.text,
                      );
                    },
                    lable: 'Create group',
                    size: 'big',
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is AddMember) {
            SnackbarCustmized(
              message: 'Member Add Successfully',
              color: Colors.green,
              time: 1,
            ).showSnackBar(context);
            _memberIdCtrl.clear();
          }
          if (state is CreateGroup) {
            SnackbarCustmized(
              message:
                  'Groupe created Successfully \n with name : ${_titleCtrl.text} and you as An Admin',
              color: Colors.green,
              time: 3,
            ).showSnackBar(context);
            _desCtrl.clear();
            _titleCtrl.clear();
          }
          if (state is AddError) {
            SnackbarCustmized(
              message: state.error,
              color: Colors.red,
              time: 1,
            ).showSnackBar(context);
          }
          if (state is DeleteMember) {
            SnackbarCustmized(
              message: "Member has been deleted successfully",
              color: const Color.fromARGB(255, 235, 164, 0),
              time: 1,
            ).showSnackBar(context);
          }
        },
      ),
    );
  }
}
