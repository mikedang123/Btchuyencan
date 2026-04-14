import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cấu hình game',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.light,
        ),
        checkboxTheme: CheckboxThemeData(
          side: const BorderSide(color: Colors.black, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        sliderTheme: SliderThemeData(
          trackHeight: 2,
          activeTrackColor: Colors.black,
          inactiveTrackColor: Colors.black,
          thumbColor: Colors.black,
          overlayColor: Colors.black.withValues(alpha: 0.12),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      home: const GameSettingsPage(),
    );
  }
}

class GameSettingsPage extends StatefulWidget {
  const GameSettingsPage({super.key});

  @override
  State<GameSettingsPage> createState() => _GameSettingsPageState();
}

class _GameSettingsPageState extends State<GameSettingsPage> {
  bool soundEnabled = false;
  bool autoSaveEnabled = false;
  double volume = 0.08;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AspectRatio(
            aspectRatio: 0.52,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _StatusBar(),
                  const SizedBox(height: 22),
                  const Text(
                    'Cấu hình game đố vui',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Column(
                      children: [
                        _SettingRow(
                          label: 'Âm thanh',
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                value: soundEnabled,
                                onChanged: (value) {
                                  setState(() {
                                    soundEnabled = value ?? false;
                                  });
                                },
                              ),
                              const Text(
                                'Bật',
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        const _SettingRow(
                          label: 'Điểm cao nhất',
                          value: '3500',
                        ),
                        const SizedBox(height: 18),
                        _SettingRow(
                          label: 'Tự động lưu game',
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                value: autoSaveEnabled,
                                onChanged: (value) {
                                  setState(() {
                                    autoSaveEnabled = value ?? false;
                                  });
                                },
                              ),
                              const Text(
                                'Bật',
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 22),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Volume',
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Slider(
                          value: volume,
                          min: 0,
                          max: 1,
                          onChanged: (value) {
                            setState(() {
                              volume = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusBar extends StatelessWidget {
  const _StatusBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      color: const Color(0xFFE0E0E0),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Icon(Icons.wifi, size: 14, color: Colors.white),
          SizedBox(width: 4),
          Icon(Icons.signal_cellular_alt, size: 14, color: Colors.white),
          SizedBox(width: 4),
          Icon(Icons.battery_full, size: 14, color: Colors.white),
          SizedBox(width: 6),
          Text(
            '14:09',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingRow extends StatelessWidget {
  const _SettingRow({
    required this.label,
    this.value,
    this.child,
  });

  final String label;
  final String? value;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 128,
          child: Text(
            label,
            style: const TextStyle(fontSize: 17, color: Colors.black),
          ),
        ),
        if (value != null)
          Text(
            value!,
            style: const TextStyle(fontSize: 17, color: Colors.black),
          )
        else
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: child,
            ),
          ),
      ],
    );
  }
}
