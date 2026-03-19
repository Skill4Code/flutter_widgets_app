import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicators')),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text("Circular Progress Indicator"),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.white,
          ),

          const SizedBox(height: 30),
          Text("Circular y Linear Indicator controlado"),
          SizedBox(height: 10),
          const _ControlledProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value * 2) / 100; //0.0, 1.0
      }).takeWhile((value) => value < 100),

      builder: (context, snapshot) {

        final progressValue = snapshot.data ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: Colors.black12,
                value: progressValue,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: LinearProgressIndicator(
                  backgroundColor: Colors.white,
                  value: progressValue,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
