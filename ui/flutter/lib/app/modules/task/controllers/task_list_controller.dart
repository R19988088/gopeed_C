import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../api/api.dart';
import '../../../../api/model/task.dart';

abstract class TaskListController extends GetxController {
  List<Status> statuses;
  int Function(Task a, Task b) compare;

  TaskListController(this.statuses, this.compare);

  final tasks = <Task>[].obs;
  final selectedTaskIds = <String>[].obs;
  final isRunning = false.obs;
  final scrollController = ScrollController();

  late final Timer _timer;

  @override
  void onInit() async {
    super.onInit();

    start();
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) async {
      if (isRunning.value) {
        await getTasksState();
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    _timer.cancel();
    scrollController.dispose();
  }

  void start() async {
    await getTasksState();
    isRunning.value = true;
  }

  void stop() {
    isRunning.value = false;
  }

  getTasksState() async {
    final tasks = await getTasks(statuses);
    // sort tasks by create time
    tasks.sort(compare);
    this.tasks.value = tasks;
  }

  void focusTask(String id) {
    final index = tasks.indexWhere((task) => task.id == id);
    if (index < 0) return;
    selectedTaskIds([id]);
    if (!scrollController.hasClients) return;
    scrollController.animateTo(
      index * 96,
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
    );
  }
}
