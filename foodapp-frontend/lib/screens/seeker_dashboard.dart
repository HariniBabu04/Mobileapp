import 'package:flutter/material.dart';
import '../agents/seeker_agent.dart';
import '../models/user.dart';
import '../models/donation.dart';
import '../services/storage_service.dart';
import 'login_screen.dart';

class SeekerDashboard extends StatefulWidget {
  final User user;
  const SeekerDashboard({super.key, required this.user});

  @override
  _SeekerDashboardState createState() => _SeekerDashboardState();
}

class _SeekerDashboardState extends State<SeekerDashboard> {
  final SeekerAgent _seekerAgent = SeekerAgent();
  List<Donation> _availableDonations = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadAvailableFood();
  }

  void _loadAvailableFood() async {
    setState(() => _isLoading = true);
    final donations = await _seekerAgent.fetchAvailableFood();
    setState(() {
      _availableDonations = donations;
      _isLoading = false;
    });
  }

  void _handleAccept(int donationId) async {
    final success = await _seekerAgent.acceptFreeFood(donationId, widget.user.userId!);
    if (success) {
      _loadAvailableFood();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Food accepted! Contact donor for pickup.")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Failed to accept food.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seeker Dashboard"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              StorageService.logout();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _availableDonations.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.search_off, size: 64, color: Colors.grey),
                      const SizedBox(height: 16),
                      const Text("No food available right now.", style: TextStyle(color: Colors.grey)),
                      TextButton(onPressed: _loadAvailableFood, child: const Text("Refresh")),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: () async => _loadAvailableFood(),
                  child: ListView.builder(
                    itemCount: _availableDonations.length,
                    itemBuilder: (context, index) {
                      final d = _availableDonations[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(d.foodName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  Chip(label: Text("${d.quantity} units"), backgroundColor: Colors.tealAccent),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text("Type: ${d.foodType}"),
                              Text("Donor: ${d.contactPerson}"),
                              Text("Pickup: ${d.pickupAddress}"),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () => _handleAccept(d.donationId!),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 45),
                                  backgroundColor: Colors.teal,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text("ACCEPT FREE FOOD"),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
