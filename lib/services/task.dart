import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zain_backend/models/task.dart';

class TaskServices {
  ///Create Task
  Future createTask(TaskModel model) async {
    return await FirebaseFirestore.instance
        .collection('taskCollection')
        .add(model.toJson());
  }

  ///Get All Tasks
  ///Get Completed Tasks
  ///Get InComplete Tasks
  ///Update Task
  ///Delete Task
  Future deleteTask(String taskID) async {
    return await FirebaseFirestore.instance
        .collection('taskCollection')
        .doc(taskID)
        .delete();
  }

  ///Mark Task as Complete
}
