class NotificationModel {
  final String type;
  final String? itemName;
  final int? quantity;
  final String? message;
  final double? amount;
  final DateTime timestamp;
  final bool isRead;

  NotificationModel({
    required this.type,
    this.itemName,
    this.quantity,
    this.message,
    this.amount,
    required this.timestamp,
    this.isRead = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'itemName': itemName,
      'quantity': quantity,
      'message': message,
      'amount': amount,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
    };
  }

  factory NotificationModel.fromMap(Map<dynamic, dynamic> map) {
    return NotificationModel(
      type: map['type'] as String,
      itemName: map['itemName'] as String?,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      message: map['message'] as String?,
      amount: map['amount'] != null ? (map['amount'] as num).toDouble() : null,
      timestamp: DateTime.parse(map['timestamp'] as String),
      isRead: map['isRead'] as bool? ?? false,
    );
  }

  NotificationModel copyWith({bool? isRead}) {
    return NotificationModel(
      type: type,
      itemName: itemName,
      quantity: quantity,
      message: message,
      amount: amount,
      timestamp: timestamp,
      isRead: isRead ?? this.isRead,
    );
  }
}
