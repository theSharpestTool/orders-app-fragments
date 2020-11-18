import 'package:flutter/material.dart';
import 'package:orders_app/stores/order_store/order_model_store.dart';
import 'package:orders_app/stores/task_store/task_model_store.dart';
import 'package:orders_app/stores/repair_work_store/repair_work_model_store.dart';

class GKColors {
  GKColors._();

  static const Color blue = Color(0xFF4C86A0);
  static const Color lightBlue = Color(0x3F4C86A0);
  static const Color darkBlue = Color(0xFF4C86CC);
  static const Color yellow = Color(0xFFE9D204);
  static const Color green = Color(0xFF00AE42);
  static const Color lightGreen = Color(0xFF3CC676);
  static const Color red = Color(0xFFF67603);
  static const Color gold = Color(0xFFFFE70D);
  static const Color white = Color(0xFFFAFAFA);
  static const Color grey = Color(0xFFF2F2F2);
  static const Color lightGrey = Color(0xFFF6F6F6);
  static Color lightPurple = Color(0xFFCEDFFE).withOpacity(0.4);
  static const Color darkGrey = Color(0xFF828282);

  static Color getOrderStatusColor(OrderState status) {
    Color color = GKColors.blue;
    switch (status) {
      case OrderState.pending:
        color = GKColors.red;
        break;
      case OrderState.confirmed:
        color = GKColors.yellow;
        break;
      case OrderState.declined:
        color = Colors.red;
        break;
      case OrderState.addedToRepairWork:
        color = GKColors.blue;
        break;
      default:
        color = GKColors.blue;
        break;
    }
    return color;
  }

  static Color getRepairWorkStatusColor(RepairWorkState status) {
    Color color = GKColors.blue;
    switch (status) {
      case RepairWorkState.created:
        color = GKColors.green;
        break;
      case RepairWorkState.declined:
        color = Colors.red;
        break;
      case RepairWorkState.workInProgress:
        color = GKColors.blue;
        break;
      default:
        color = GKColors.red;
        break;
      // case OrderStatus.open:
      //   color = GKColors.blue;
      //   break;
      // case OrderStatus.closed:
      //   color = GKColors.green;
      //   break;
    }
    return color;
  }

  static Color getTaskStatusColor(TaskState status) {
    Color color = GKColors.blue;
    switch (status) {
      case TaskState.created:
        color = GKColors.green;
        break;
      case TaskState.done:
        color = GKColors.blue;
        break;
      case TaskState.completedOrderCreated:
        color = GKColors.blue;
        break;
      default:
        color = GKColors.red;
        break;
      // case OrderStatus.open:
      //   color = GKColors.blue;
      //   break;
      // case OrderStatus.closed:
      //   color = GKColors.green;
      //   break;
    }
    return color;
  }
}
