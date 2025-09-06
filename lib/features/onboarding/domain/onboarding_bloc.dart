import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rivy/features/onboarding/domain/bloc.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState(currentIndex: 0)) {
    on<OnboardingPageChanged>(_onPageChanged);
    on<OnboardingNextPage>(_onNextPage);
  }

  void _onPageChanged(OnboardingPageChanged event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(currentIndex: event.index));
  }

  void _onNextPage(OnboardingNextPage event, Emitter<OnboardingState> emit) {
    if (state.currentIndex < 2) {
      emit(state.copyWith(currentIndex: state.currentIndex + 1));
    }
  }
}
