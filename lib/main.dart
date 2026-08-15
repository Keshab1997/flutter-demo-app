import 'package:flutter/material.dart';

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'আমার ছোট অ্যাপ',
      themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4)),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB69DF8),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: HomePage(
        darkMode: _darkMode,
        onThemeChanged: (value) => setState(() => _darkMode = value),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    required this.darkMode,
    required this.onThemeChanged,
    super.key,
  });

  final bool darkMode;
  final ValueChanged<bool> onThemeChanged;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _taskController = TextEditingController();
  final List<String> _tasks = ['Flutter শেখা', 'প্রথম APK build করা'];
  int _count = 0;

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  void _addTask() {
    final String task = _taskController.text.trim();
    if (task.isEmpty) return;

    setState(() {
      _tasks.add(task);
      _taskController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('আমার ছোট অ্যাপ'),
        actions: [
          Icon(widget.darkMode ? Icons.dark_mode : Icons.light_mode),
          Switch(
            value: widget.darkMode,
            onChanged: widget.onThemeChanged,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [colors.primary, colors.tertiary],
                ),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                children: [
                  const Text(
                    'আপনি বাটন চাপিয়েছেন',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$_count বার',
                    key: const Key('counterText'),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  FilledButton.tonalIcon(
                    key: const Key('counterButton'),
                    onPressed: () => setState(() => _count++),
                    icon: const Icon(Icons.add),
                    label: const Text('একবার বাড়ান'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Text(
              'আজকের কাজ',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    key: const Key('taskInput'),
                    controller: _taskController,
                    onSubmitted: (_) => _addTask(),
                    decoration: const InputDecoration(
                      hintText: 'নতুন কাজ লিখুন',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton.filled(
                  key: const Key('addTaskButton'),
                  onPressed: _addTask,
                  icon: const Icon(Icons.add_task),
                  tooltip: 'কাজ যোগ করুন',
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (_tasks.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Center(child: Text('সব কাজ শেষ! 🎉')),
              )
            else
              ..._tasks.asMap().entries.map(
                    (entry) => Card(
                      child: ListTile(
                        leading: CircleAvatar(child: Text('${entry.key + 1}')),
                        title: Text(entry.value),
                        trailing: IconButton(
                          onPressed: () => setState(
                            () => _tasks.removeAt(entry.key),
                          ),
                          icon: const Icon(Icons.check_circle_outline),
                          tooltip: 'শেষ করুন',
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
