import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/features/addTasks/cubit/Add tasks&todos/todoLogic.dart';
import 'package:todoapp/features/addTasks/cubit/Add tasks&todos/todoStates.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  int _selectedIndex = 0;

  void _openAddTaskDialog() {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    DateTime? selectedDate;
    TimeOfDay? selectedTime;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: StatefulBuilder(
              builder: (context, setStateDialog) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Appcolors.navyblue,
                        hintText: "task",
                        hintStyle: const TextStyle(color: Colors.white70),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: descriptionController,
                      maxLines: 3,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Appcolors.navyblue,
                        hintText: "Description",
                        hintStyle: const TextStyle(color: Colors.white70),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              final picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2100),
                              );
                              if (picked != null) {
                                setStateDialog(() => selectedDate = picked);
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Appcolors.navyblue,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.calendar_today, color: Colors.white),
                                  const SizedBox(width: 8),
                                  Text(
                                    selectedDate == null
                                        ? "Date"
                                        : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              final picked = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (picked != null) {
                                setStateDialog(() => selectedTime = picked);
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Appcolors.navyblue,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.access_time, color: Colors.white),
                                  const SizedBox(width: 8),
                                  Text(
                                    selectedTime == null
                                        ? "Time"
                                        : "${selectedTime!.hour}:${selectedTime!.minute.toString().padLeft(2, '0')}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.lightBlue),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: const Text("cancel", style: TextStyle(color: Colors.lightBlue)),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              if (titleController.text.isNotEmpty &&
                                  descriptionController.text.isNotEmpty &&
                                  selectedDate != null &&
                                  selectedTime != null) {
                                final deadline = DateTime(
                                  selectedDate!.year,
                                  selectedDate!.month,
                                  selectedDate!.day,
                                  selectedTime!.hour,
                                  selectedTime!.minute,
                                );

                                final newTask = TodoModel(
                                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  deadline: deadline,
                                  isCompleted: false,
                                );
                                context.read<TodoCubit>().addTask(newTask);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text("create", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.navyblue,
      appBar: AppBar(
        title: const Text("My Tasks", style: TextStyle(color: Colors.white)),
        backgroundColor: Appcolors.navyblue,
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is TodoLoaded) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF102D53CC),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Search by task title",
                              hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                              border: InputBorder.none,
                              prefixIcon: const Icon(Icons.search, color: Colors.white),
                              contentPadding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF102D53CC),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: Appcolors.navyblue,
                            style: const TextStyle(color: Colors.white),
                            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                            value: "Date",
                            items: const [
                              DropdownMenuItem(
                                value: "Date",
                                child: Row(
                                  children: [
                                    Icon(Icons.sort, color: Colors.white),
                                    SizedBox(width: 5),
                                    Padding(
                                      padding: EdgeInsets.only(left: 12),
                                      child: Text("Sort By :"),
                                    ),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Title",
                                child: Row(
                                  children: [
                                    Icon(Icons.sort_by_alpha, color: Colors.white),
                                    SizedBox(width: 5),
                                    Text("Sort By: Title"),
                                  ],
                                ),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: state.tasks.isEmpty
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "No tasks yet",
                                style: TextStyle(color: Colors.white, fontSize: 16, letterSpacing: 5),
                              ),
                            ),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.only(top: 8),
                          itemCount: state.tasks.length,
                          itemBuilder: (context, index) {
                            final task = state.tasks[index];
                                return Dismissible(
                                  key: Key(task.id),
                                  background: Container(
                                    color: Colors.red,
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: const Icon(Icons.delete, color: Colors.white),
                                  ),
                                  dismissThresholds: const {
                                    DismissDirection.startToEnd: 0.4,
                                  },
                                  onDismissed: (direction) {
                                    if (direction == DismissDirection.startToEnd) {
                                      context.read<TodoCubit>().deleteTask(task.id);
                                    }
                                  },
                                  child: Card(
                                    margin: const EdgeInsets.all(8),
                                    child: ListTile(
                                      leading: Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                          value: task.isCompleted,
                                          onChanged: (value) {
                                            context.read<TodoCubit>().toggleComplete(task.id);
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          side: MaterialStateBorderSide.resolveWith(
                                            (states) => BorderSide(
                                              width: 2,
                                              color: task.isCompleted 
                                                  ? Colors.green 
                                                  : Colors.grey.shade400,
                                            ),
                                          ),
                                          checkColor: Colors.white,
                                          activeColor: Colors.green,
                                          fillColor: MaterialStateProperty.resolveWith((states) {
                                            if (states.contains(MaterialState.selected)) {
                                              return Colors.green;
                                            }
                                            return Colors.transparent;
                                          }),
                                        ),
                                      ),
                                      title: Text(
                                        task.title,
                                        style: TextStyle(
                                          decoration: task.isCompleted 
                                              ? TextDecoration.lineThrough 
                                              : TextDecoration.none,
                                          color: task.isCompleted ? Colors.grey : Colors.black,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "${task.description}\nDeadline: ${task.deadline.day}/${task.deadline.month}/${task.deadline.year} ${task.deadline.hour}:${task.deadline.minute.toString().padLeft(2, '0')}",
                                        style: TextStyle(
                                          decoration: task.isCompleted 
                                              ? TextDecoration.lineThrough 
                                              : TextDecoration.none,
                                          color: task.isCompleted ? Colors.grey : Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                          },
                        ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTaskDialog,
        backgroundColor: Colors.lightBlueAccent,
        elevation: 10,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Appcolors.navyblue,
          selectedItemColor: Colors.cyanAccent.withOpacity(0.9),
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ],
        ),
      ),
    );
  }
}
