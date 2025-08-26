class GroupModel {
  final String groupId;
  final String groupeName;
  final String groupDescription;
  List<String> membersID;
  List<String> adminsID;
  List<String> tasksID;

  Map<String, dynamic> toJson() {
    return {
      'groupId': groupId,
      'groupeName': groupeName,
      'adminsID': adminsID,
      'groupDescription': groupDescription,
      'membersID': membersID,
      'tasksID': tasksID,
    };
  }

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      groupDescription: json['groupDescription'],
      groupId: json['groupId'],
      groupeName: json['groupeName'],
      adminsID: List.from(json['adminsID']),
      membersID: List.from(json['membersID']),
      tasksID: List.from(json['tasksID']),
    );
  }

  GroupModel({
    required this.adminsID,
    required this.groupId,
    required this.groupeName,
    required this.groupDescription,
    required this.membersID,
    required this.tasksID,
  });
}
