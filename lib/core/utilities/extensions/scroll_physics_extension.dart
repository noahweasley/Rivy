import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// An extension on [BuildContext] to provide platform-specific [ScrollPhysics].
extension ScrollPhysicsExtension on BuildContext {
  /// Returns the appropriate [ScrollPhysics] based on the platform.
  ///
  /// - On iOS, it always returns [BouncingScrollPhysics] for a smooth bounce effect.
  /// - On Android:
  ///   - In debug mode, it returns [BouncingScrollPhysics] to override the default overscroll effect.
  ///   - In release mode, it returns [ClampingScrollPhysics] for a more natural Android scroll behavior.
  ScrollPhysics get platformScrollPhysics {
    if (kDebugMode) {
      // Overrides the default Android overscroll effect in debug mode.
      return const BouncingScrollPhysics();
    }
    return Platform.isIOS ? const BouncingScrollPhysics() : const ClampingScrollPhysics();
  }
}
