import 'package:flutter/material.dart';
import '../agents/auth_agent.dart';
import '../models/user.dart';
import 'register_screen.dart';
import 'donor_dashboard.dart';
import 'seeker_dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _selectedRole = 'DONOR';
  final AuthAgent _authAgent = AuthAgent();
  bool _isLoading = false;

  void _handleLogin() async {
    setState(() => _isLoading = true);
    final result = await _authAgent.login(
      _emailController.text,
      _passwordController.text,
      _selectedRole,
    );
    setState(() => _isLoading = false);

    if (result['success']) {
      User user = result['user'];
      _navigateToDashboard(user);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result['message'])),
      );
    }
  }

  void _handleBiometricLogin() async {
    bool authenticated = await _authAgent.authenticateBiometrically();
    if (authenticated) {
      // Logic to fetch stored user and proceed
      // For simplicity in this demo, we assume success if biometrics pass
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Biometric logic triggered. (Requires stored session)")),
      );
    }
  }

  void _navigateToDashboard(User user) {
    if (user.role?.toUpperCase() == 'DONOR') {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => DonorDashboard(user: user)));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SeekerDashboard(user: user)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.teal, Colors.tealAccent],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.volunteer_activism, size: 64, color: Colors.teal),
                    const SizedBox(height: 16),
                    const Text(
                      "Welcome Back",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _selectedRole,
                      decoration: InputDecoration(
                        labelText: "I am a...",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      items: const [
                        DropdownMenuItem(value: 'DONOR', child: Text("Donor")),
                        DropdownMenuItem(value: 'NGO', child: Text("Seeker (NGO)")),
                      ],
                      onChanged: (val) => setState(() => _selectedRole = val!),
                    ),
                    const SizedBox(height: 32),
                    _isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: _handleLogin,
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              backgroundColor: Colors.teal,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text("LOGIN"),
                          ),
                    const SizedBox(height: 16),
                    IconButton(
                      onPressed: _handleBiometricLogin,
                      icon: const Icon(Icons.fingerprint, size: 48, color: Colors.teal),
                      tooltip: "Login with Biometrics",
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterScreen())),
                      child: const Text("Don't have an account? Register"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
