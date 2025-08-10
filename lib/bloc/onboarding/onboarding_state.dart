import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final int currentStep;
  final double progress;
  final bool isCompleted;

  const OnboardingState({
    required this.currentStep,
    required this.progress,
    required this.isCompleted,
  });

  factory OnboardingState.initial() => const OnboardingState(currentStep: 0, progress: 0.25, isCompleted: false);

  @override
  List<Object?> get props => [currentStep, progress, isCompleted];

  OnboardingState copyWith({
    int? currentStep,
    double? progress,
    bool? isCompleted,
  }) {
    return OnboardingState(
      currentStep: currentStep ?? this.currentStep,
      progress: progress ?? this.progress,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
