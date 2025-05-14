import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_managements/features/getx_example/presentation/getx/getx_auth_notifier.dart';

class GetXLoginScreen extends StatelessWidget {
  GetXLoginScreen({super.key});

  final GetXAuthController controller = Get.find<GetXAuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        final state = controller.state;

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
                    ? const CircularProgressIndicator(color: Colors.blue)
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
                            controller: controller.emailController,
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
                            controller: controller.passwordController,
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
                                final email = controller.emailController.text;
                                final password =
                                    controller.passwordController.text;

                                if (email.isEmpty || password.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Please fill in all fields',
                                      ),
                                    ),
                                  );
                                } else {
                                  await controller.login(email, password);
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
      }),
    );
  }
}
