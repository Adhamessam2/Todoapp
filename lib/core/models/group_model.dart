class GroupModel {
  final String groupId;
  final String groupeName;
  final String groupDescription;
  List<String> membersID;
  List<String> tasksID;

  Map<String, dynamic> toJson() {
    return {
      'groupId': groupId,
      'groupeName': groupeName,
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
      membersID: List.from(json['membersID']),
      tasksID: List.from(json['tasksID']),
    );
  }

  GroupModel({
    required this.groupId,
    required this.groupeName,
    required this.groupDescription,
    required this.membersID,
    required this.tasksID,
  });
}
