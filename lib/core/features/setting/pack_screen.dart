import 'package:digital_card_grader/core/common/common_scaffold.dart';
import 'package:digital_card_grader/core/features/setting/controllers/pack_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../common/common_appbar.dart';
import '../../models/pack_model.dart';

class PacksScreen extends StatefulWidget {
  const PacksScreen({super.key});

  @override
  State<PacksScreen> createState() => _PacksScreenState();
}

class _PacksScreenState extends State<PacksScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  double _currentPage = 0.0;
  final PacksController packController = Get.put(PacksController());


  final List<PackModel> packs = [
    PackModel(
      title: "Bronze Pack",
      credits: 10,
      chance: "5% chance of a limited grade frame",
      price: 5,
    ),
    PackModel(
      title: "Silver Pack",
      credits: 20,
      chance: "50% chance of a limited grade frame",
      price: 20,
    ),
    PackModel(
      title: "Gold Pack",
      credits: 100,
      chance: "Guaranteed limited border\n+ 5% chance of another frame",
      price: 50,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: commonAppBar(
        title: "",
        child: ListTile(
          title: Text(
            "Packs",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
        actions: [Padding(padding: const EdgeInsets.symmetric(horizontal: 35))],
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
         /* const Text(
            "Find the right pack",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),*/
          const SizedBox(height: 20),
          SizedBox(
            height: 420,
            child: PageView.builder(
              controller: _pageController,
              itemCount: packs.length,
              itemBuilder: (context, index) {
                return _buildPackCard(packs[index], _currentPage, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPackCard(PackModel pack, double currentPage, int index) {
    final double diff = (currentPage - index).abs();
    final bool isSelected = diff < 0.5;

    double scale = 1.0 - (diff * 0.15);
    if (scale < 0.85) scale = 0.85;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
        boxShadow: isSelected
            ? [
          BoxShadow(
            color: Colors.blue.withOpacity(0.25),
            blurRadius: 14,
            spreadRadius: 3,
            offset: const Offset(0, 5),
          )
        ]
            : [],
      ),
      child: Transform.scale(
        scale: scale,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                pack.title,
                style: TextStyle(
                  fontSize: isSelected ? 22 : 17,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.blue : Colors.grey.shade700,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.check_circle,
                  size: 18,
                  color: isSelected ? Colors.blue : Colors.grey.shade600,
                ),
                const SizedBox(width: 8),
                Text(
                  "${pack.credits} Credits",
                  style: TextStyle(
                    color: isSelected ? Colors.black87 : Colors.grey.shade700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check_circle,
                  size: 18,
                  color: isSelected ? Colors.blue : Colors.grey.shade600,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    pack.chance,
                    style: TextStyle(
                      fontSize: 13,
                      color: isSelected ? Colors.black87 : Colors.grey.shade700,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                packController.packBuy(index);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Colors.blue : Colors.grey.shade400,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                "Buy Now (\$${pack.price})",
                style: const TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}