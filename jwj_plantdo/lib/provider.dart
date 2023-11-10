import 'package:flutter_riverpod/flutter_riverpod.dart';

final feedbackControllerProvider =
    StateNotifierProvider<FeedbackController, Map<String, Map<int, int>>>(
        (ref) {
  return FeedbackController();
});

class FeedbackController extends StateNotifier<Map<String, Map<int, int>>> {
  FeedbackController() : super({});

  void incrementFeedback(String plantName, int feedbackType, int increment) {
    final currentFeedback = state[plantName] ?? {};
    final currentCount = currentFeedback[feedbackType] ?? 0;
    state = {
      ...state,
      plantName: {
        ...currentFeedback,
        feedbackType: currentCount + increment,
      },
    };
  }

  void decrementFeedback(String plantName, int feedbackType, int descrement) {
    final currentFeedback = state[plantName] ?? {};
    final currentCount = currentFeedback[feedbackType] ?? 0;
    if (currentCount > 0) {
      state = {
        ...state,
        plantName: {
          ...currentFeedback,
          feedbackType: currentCount - descrement,
        },
      };
    }
  }

  int getFeedbackCount(String plantName, int feedbackType) {
    final currentFeedback = state[plantName] ?? {};
    return currentFeedback[feedbackType] ?? 0;
  }
}
