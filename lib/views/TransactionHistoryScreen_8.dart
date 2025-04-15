import 'package:flutter/material.dart';

class TransactionHistoryApp extends StatefulWidget {
  const TransactionHistoryApp({super.key});

  @override
  State<TransactionHistoryApp> createState() => _TransactionHistoryAppState();
}

class _TransactionHistoryAppState extends State<TransactionHistoryApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int rowsPerPage = 20;
  int currentPage = 1;

  final List<Map<String, String>> transactions = List.generate(50, (index) {
    return {
      'sl': '${index + 1}',
      'name': 'Md Akash Islam',
      'paymentMethod': 'Visa',
      'cardNumber': '**** 2468',
    };
  });

  List<Map<String, String>> get currentData {
    int start = (currentPage - 1) * rowsPerPage;
    int end = start + rowsPerPage;
    return transactions.sublist(
      start,
      end > transactions.length ? transactions.length : end,
    );
  }

  void nextPage() {
    setState(() {
      if ((currentPage * rowsPerPage) < transactions.length) {
        currentPage++;
      }
    });
  }

  void previousPage() {
    setState(() {
      if (currentPage > 1) currentPage--;
    });
  }

  void changeRowsPerPage(int? value) {
    if (value != null) {
      setState(() {
        rowsPerPage = value;
        currentPage = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.pink),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 30, color: Colors.pink),
                    ),
                    SizedBox(width: 10),
                    Text("Admin Panel", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.dashboard),
                    title: Text("Dashboard"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.card_giftcard),
                    title: Text("Package"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text("User Management"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text("Transaction"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.dashboard),
                    title: Text("Dashboard"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.restaurant),
                    title: Text("Plates"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.qr_code_scanner),
                    title: Text("Tic"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.app_registration),
                    title: Text("Registration"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.confirmation_number),
                    title: Text("Ticket"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.security),
                    title: Text("Insurance"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.error),
                    title: Text("Error Logs"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Account Setting"),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Logout", style: TextStyle(color: Colors.red)),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            // Topbar
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "images/drivelaar/drivelaar without back 1.png",
                    height: 40,
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.notifications, color: Colors.pink),
                        onPressed: () {},
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          "images/drivelaar/a-l-l-e-f-v-i-n-i-c-i-u-s-343875-unsplash.png",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                    icon: Icon(Icons.menu),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Transaction History",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),

            // Table header and content
            Expanded(
              child: Column(
                children: [
                  Container(
                    color: Color(0xFFD9C9E2),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            "S.L",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Name",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Payment Method",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white, // Set background color here
                      child: ListView.separated(
                        itemCount: currentData.length,
                        separatorBuilder: (_, __) => Divider(height: 1),
                        itemBuilder: (context, index) {
                          final tx = currentData[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Row(
                              children: [
                                Expanded(child: Text(tx['sl']!)),
                                Expanded(flex: 3, child: Text(tx['name']!)),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    children: [
                                      Text(tx['paymentMethod']!),
                                      SizedBox(width: 8),
                                      Text(tx['cardNumber']!),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Text("Sort by"),
                        SizedBox(width: 8),
                        DropdownButton<int>(
                          value: rowsPerPage,
                          items:
                              [10, 20, 50].map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Text("$e"),
                                );
                              }).toList(),
                          onChanged: changeRowsPerPage,
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: previousPage,
                          icon: Icon(Icons.arrow_left),
                        ),
                        Text("Page $currentPage"),
                        IconButton(
                          onPressed: nextPage,
                          icon: Icon(Icons.arrow_right),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
