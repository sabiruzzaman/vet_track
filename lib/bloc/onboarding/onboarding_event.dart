import 'package:equatable/equatable.dart';

abstract class OnboardingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadOnboardingEvent extends OnboardingEvent {}

class ChangeStepEvent extends OnboardingEvent {
  final int step;
  ChangeStepEvent(this.step);

  @override
  List<Object?> get props => [step];
}

class CompleteOnboardingEvent extends OnboardingEvent {}
