import 'package:flutter/material.dart';
import 'package:state_managements/features/provider_example/presentation/provider/provider_auth_notifier.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController =
        Provider.of<ProviderAuthNotifier>(context).emailController;
    final passwordController =
        Provider.of<ProviderAuthNotifier>(context).passwordController;
    final providerAuthNotifier = Provider.of<ProviderAuthNotifier>(context);
    // final state = providerAuthNotifier.state;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<ProviderAuthNotifier>(
        builder: (context, notifier, child) {
          final state = notifier.state;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (state.status == AuthStatus.success) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Login successful')));
            } else if (state.status == AuthStatus.error) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error ?? 'Error')));
            }
          });
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child:
                  state.status == AuthStatus.loading
                      ? CircularProgressIndicator(color: Colors.blue)
                      : SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 40),
                            TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: const Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: const Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              obscureText: true,
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (emailController.text.isEmpty ||
                                      passwordController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Please fill in all fields',
                                        ),
                                      ),
                                    );
                                  } else {
                                    await providerAuthNotifier.login(
                                      emailController.text,
                                      passwordController.text,
                                    );

                                    // final updatedState = providerAuthNotifier.state;

                                    // if (updatedState.status == AuthStatus.success) {
                                    //   ScaffoldMessenger.of(context).showSnackBar(
                                    //     const SnackBar(
                                    //       content: Text('Login successful'),
                                    //     ),
                                    //   );
                                    // } else if (updatedState.status ==
                                    //     AuthStatus.error) {
                                    //   ScaffoldMessenger.of(context).showSnackBar(
                                    //     SnackBar(
                                    //       content: Text(
                                    //         updatedState.error ?? 'Error',
                                    //       ),
                                    //     ),
                                    //   );
                                    // }
                                  }
                                },

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
            ),
          );
        },
      ),
    );
  }
}
