import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState.initial()) {
    on<LoadOnboardingEvent>(_onLoad);
    on<ChangeStepEvent>(_onChangeStep);
    on<CompleteOnboardingEvent>(_onComplete);
  }

  Future<void> _onLoad(
      LoadOnboardingEvent event, Emitter<OnboardingState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final step = prefs.getInt('onboarding_step') ?? 0;
    final completed = prefs.getBool('isOnboardingCompleted') ?? false;

    double progress;
    if (completed) {
      progress = 1.0;
    } else {
      progress = step == 0
          ? 0.25
          : step == 1
          ? 0.5
          : 0.75;
    }

    emit(OnboardingState(
        currentStep: step, progress: progress, isCompleted: completed));
  }

  Future<void> _onChangeStep(
      ChangeStepEvent event, Emitter<OnboardingState> emit) async {
    double progress =
    event.step == 0 ? 0.25 : (event.step == 1 ? 0.5 : 0.75);

    emit(state.copyWith(currentStep: event.step, progress: progress));

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onboarding_step', event.step);
  }

  Future<void> _onComplete(
      CompleteOnboardingEvent event, Emitter<OnboardingState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isOnboardingCompleted', true);

    emit(state.copyWith(isCompleted: true, progress: 1.0));
  }
}
