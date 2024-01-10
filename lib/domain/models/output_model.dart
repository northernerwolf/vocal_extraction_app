class DataModel {
  final String completedAt;
  final String createdAt;
  final String? error;
  final String id;
  final String logs;
  final Map<String, dynamic> metrics;

  final Map<String, dynamic> output;
  final String startedAt;
  final String status;

  DataModel({
    required this.completedAt,
    required this.createdAt,
    required this.error,
    required this.id,
    required this.logs,
    required this.metrics,
    required this.output,
    required this.startedAt,
    required this.status,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      completedAt: json['completed_at'] ?? '', // Handle null case
      createdAt: json['created_at'] ?? '',
      error: json['error'] ?? '',
      id: json['id'] ?? '',
      logs: json['logs'] ?? '',
      metrics: {'predict_time': json['predict_time']},

      output: {
        'bass': json['bass'],
        'drums': json['drums'],
        'guitar': json['guitar'],
        'other': json['other'],
        'piano': json['piano'],
        'vocals': json['vocals'],
      },
      startedAt: json['started_at'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
