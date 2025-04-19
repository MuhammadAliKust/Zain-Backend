import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zain_backend/models/task.dart';
import 'package:zain_backend/providers/user_provider.dart';
import 'package:zain_backend/services/task.dart';
import 'package:zain_backend/views/create_task.dart';
import 'package:zain_backend/views/update_task.dart';

class GetAllTaskView extends StatelessWidget {
  const GetAllTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Get All Tasks"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateTaskView()));
          },
          child: Icon(Icons.add),
        ),
        body: StreamProvider.value(
          value: TaskServices().getAllTasks(user.getUser()!.docId.toString()),
          initialData: [TaskModel()],
          builder: (context, child) {
            List<TaskModel> taskList = context.watch<List<TaskModel>>();
            return ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: Icon(Icons.task),
                    title: Text(taskList[i].title.toString()),
                    subtitle: Text(taskList[i].description.toString()),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UpdateTaskView(model: taskList[i])));
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.red,
                            )),
                        IconButton(
                            onPressed: () async {
                              try {
                                await TaskServices()
                                    .deleteTask(taskList[i].docId.toString());
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(e.toString())));
                              }
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                        Checkbox(
                            value: taskList[i].isCompleted,
                            onChanged: (val) async {
                              try {
                                await TaskServices().markTaskAsComplete(
                                    taskList[i].docId.toString());
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(e.toString())));
                              }
                            }),
                      ],
                    ),
                  );
                });
          },
        ));
  }
}
