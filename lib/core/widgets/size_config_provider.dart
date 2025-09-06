import 'package:flutter/widgets.dart';
import 'package:rivy/core/utilities/size/size_config.dart';

class SizeConfigProvider extends StatefulWidget {
  final Widget child;
  const SizeConfigProvider({super.key, required this.child});

  @override
  State<SizeConfigProvider> createState() => _SizeConfigProviderState();
}

class _SizeConfigProviderState extends State<SizeConfigProvider> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    if (mounted) {
      SizeConfig.init(context);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return widget.child;
  }
}
