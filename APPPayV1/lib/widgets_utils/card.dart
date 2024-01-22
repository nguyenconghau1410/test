import 'package:flutter/material.dart';

class CardUtils {
  static Widget card1() {
    return Stack(
      children: [
        Container(
          width: 327,
          height: 193,
          decoration: BoxDecoration(
              color: const Color(0xFF2FA2B9),
              borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("**** **** **** 1121", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, top: 10),
                  child: Text("13/24", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.6))),
                ),
                const Text("Tommy Jason", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),),
              ],
            ),
          ),
        ),
        Positioned(
          top: 26,
          left: 24,
          child: Image.asset(
            "images/Group18274.png",
            width: 43,
            height: 26,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(
            "images/Vector59.png",
            width: 122,
            height: 99,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            "images/Vector58.png",
            width: 122,
            height: 99,
          ),
        )
      ],
    );
  }
  static Widget card2(int a, int b) {
    return Stack(
      children: [
        Container(
          width: 327,
          height: 193,
          decoration: BoxDecoration(
              color: Color(a),
              borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 24),
                child: Row(
                  children: [
                    Image.asset("images/Group244.png", width: 32, height: 24.38,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Image.asset("images/Chips.png", width: 32, height: 32,),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24, top: 30),
                child: Text("2564 8546 8421 1121", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),),
              )
            ],
          ),
        ),
        Image.asset("images/Vector140.png"),
        Positioned(
          bottom: 0,
          child: Container(
            width: 327,
            height: 64,
            decoration: BoxDecoration(
                color: Color(b),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 24,top: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Tommy Jason", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text("13/24", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.6))),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          bottom: 20,
          child: Image.asset("images/Group18274.png"),
        ),
      ],
    );
  }
  static Widget card3() {
    return Stack(
      children: [
        Container(
          width: 327,
          height: 193,
          decoration: BoxDecoration(
              color: const Color(0xFFFBBB00),
              borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 30, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Text("2564 8546 8421 1121", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text("Card Holder", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.6)),),
                        ),
                        const Text("Tommt Jason", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                      ],
                    ),
                    Expanded(child: Container()),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text("Expires", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.6)),),
                        ),
                        const Text("13/24", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 26,
          left: 24,
          child: Image.asset(
            "images/Group18274.png",
            width: 43,
            height: 26,
          ),
        ),
        Positioned(
          top: 26,
          right: 24,
          child: Image.asset("images/Chips@2x.png", width: 32, height: 32,),
        )
      ],
    );
  }
}
