import 'package:flutter/material.dart';
import 'package:ur_place/test/feature_flag_manager.dart';

class FeatureFlagsPage extends StatefulWidget {
  const FeatureFlagsPage({super.key});

  @override
  State<FeatureFlagsPage> createState() => _FeatureFlagsPageState();
}

class _FeatureFlagsPageState extends State<FeatureFlagsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('⚠️ Debug Page - Feature Flags'),
      ),
      body: ListView(
        children: FeatureFlag.values.map((flag) {
          return ListTile(
            title: Text(flag.toString().split('.').last),
            subtitle: Text('Default: ${FFManager.defaultFlags[flag]}, Override: ${FFManager.overrides[flag]}'),
            trailing: Switch(
              value: FFManager.isEnabled(flag),
              onChanged: (bool value) {
                setState(() {
                  FFManager.setFeatureOverride(flag, value);
                });
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
