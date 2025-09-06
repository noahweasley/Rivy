import 'package:equatable/equatable.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

class OnboardingPageChanged extends OnboardingEvent {
  const OnboardingPageChanged(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}

class OnboardingNextPage extends OnboardingEvent {}

class OnboardingSkip extends OnboardingEvent {}

class OnboardingStart extends OnboardingEvent {}
