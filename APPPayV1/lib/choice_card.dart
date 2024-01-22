import 'package:flutter/material.dart';
import 'package:apppayv1/widgets_utils//card.dart';
class ChoiceCard extends StatefulWidget {
  const ChoiceCard({super.key});

  @override
  State<ChoiceCard> createState() => _ChoiceCardState();
}

class _ChoiceCardState extends State<ChoiceCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            InkWell(
                onTap: () {

                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey)
                  ),
                  child: const Icon(Icons.keyboard_arrow_left_rounded, color: Colors.black,),
                )
            ),
            Expanded(child: Container()),
            const Center(child: Text("Chọn loại card", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),)),
            Expanded(child: Container()),
            Container()
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30,),
              CardUtils.card1(),
              const SizedBox(height: 30,),
              CardUtils.card2(0xFF2FA2B9, 0xFFFBBB00),
              const SizedBox(height: 30,),
              CardUtils.card3()
            ],
          ),
        ),
      )
    );
  }
}
