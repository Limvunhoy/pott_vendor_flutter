enum ProcessingState {
  processing,
  estimatedTime,
  delivered,
}

class ProcessingModel {
  final ProcessingState? state;
  final String? title;
  final String? subTitle;

  ProcessingModel({this.state, this.title, this.subTitle});
}
