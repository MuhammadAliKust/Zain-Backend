import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zain_backend/models/task.dart';
import 'package:zain_backend/services/task.dart';

class GetCompletedTaskView extends StatelessWidget {
  const GetCompletedTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Get Completed Tasks"),
        ),
        body: StreamProvider.value(
          value: TaskServices().getCompletedTasks(),
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
                  );
                });
          },
        ));
  }
}
