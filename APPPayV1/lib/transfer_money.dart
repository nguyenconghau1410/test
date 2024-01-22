import 'package:flutter/material.dart';

const TextStyle h4 = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
  fontSize: 24,
  letterSpacing: -0.2,
  height: 1.1,
  color: Colors.white
);
const TextStyle h6 = TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        fontSize: 20,
        letterSpacing: 0.3,
        color: Color(0xff2fa2b9));
const TextStyle body_small_bold = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
  fontSize: 12,
  letterSpacing: 0.3,
  height: 1.8,
  color: Color.fromRGBO(47, 162, 185, 1)
);
const TextStyle body_large_bold = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
  fontSize: 16,
  letterSpacing: 0.3,
  color: Colors.white,
);

class transfer extends StatefulWidget {
  const transfer({super.key});

  @override
  State<transfer> createState() => _transferState();
}

class _transferState extends State<transfer> {
  @override
  Widget build(BuildContext context) {
    var _search_contact = TextEditingController();
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white70,
            foregroundColor: Colors.black,
            leading: Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: Colors.grey)),
              child: IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () {},
              ),
            ),
            title: const Text(
              'Transfer',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                letterSpacing: 0.3,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Choose cards',
                  style: h6,
                ),

                // Visa card
                Card(
                  elevation: 0,
                  child: Container(
                    width: 310,
                    height: 190,
                    decoration: BoxDecoration(
                      color: Color(0xff2fa2b9),
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image:
                            AssetImage('assets/kit-/images/mask-group-fEM.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 24, top: 24),
                          width: 24,
                          child:
                              Image.asset('assets/kit-/images/check-LBP.png'),
                        ),
                        Container(
                          width: double.infinity,
                          height: 78,
                        ),
                        Container(
                          width: double.infinity,
                          height: 64,
                          decoration: const BoxDecoration(
                            color: Color(0xfffbbb00),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text('\$15,365.00', style: h4),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                Container(
                                  width: 43,
                                  height: 26,
                                  child: Image.asset(
                                    'assets/kit-/images/group-18274-tZT.png',
                                    width: 43,
                                    height: 26,
                                  ),
                                )
                              ]),
                        )
                      ],
                    ),
                  ),
                ),

                // Card(
                //   elevation: 0,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10)),
                //   child: // Empires card
                //       Container(
                //     width: 310,
                //     height: 190,
                //     decoration: BoxDecoration(
                //       color: Color.fromRGBO(251, 187, 0, 1),
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Container(
                //           margin: EdgeInsets.all(24),
                //           child: Image.asset(
                //             'assets/kit-/images/auto-group-3rwj.png',
                //           ),
                //         ),
                //         Container(
                //           width: 270,
                //           alignment: Alignment.bottomLeft,
                //           margin: EdgeInsets.all(20),
                //           child: const Text(
                //             '****  ****  ****  1990',
                //             style: TextStyle(
                //                 fontFamily: 'Roboto',
                //                 fontSize: 13,
                //                 color: Colors.white,
                //                 letterSpacing: 0.3,
                //                 fontWeight: FontWeight.w700),
                //           ),
                //         ),
                //         Container(
                //           width: double.infinity,
                //           child: Row(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               Container(
                //                 margin: EdgeInsets.only(
                //                   left: 20,
                //                 ),
                //                 // padding: EdgeInsets.all(24),
                //                 child: Text(
                //                   '\$10,250.00',
                //                   style: h4,
                //                 ),
                //               ),
                //               SizedBox(
                //                 width: 64,
                //               ),
                //               Container(
                //                 child: Column(
                //                     crossAxisAlignment: CrossAxisAlignment.end,
                //                     children: [
                //                       Container(
                //                         margin: EdgeInsets.only(bottom: 2),
                //                         child: const Text(
                //                           'Empires',
                //                           style: TextStyle(
                //                               fontFamily: 'Roboto',
                //                               fontSize: 13,
                //                               color: Colors.white,
                //                               letterSpacing: 0.3,
                //                               fontWeight: FontWeight.w700),
                //                         ),
                //                       ),
                //                       const Text(
                //                         '09/2023',
                //                         style: TextStyle(
                //                             fontFamily: 'Roboto',
                //                             fontSize: 13,
                //                             color: Colors.white,
                //                             letterSpacing: 0.3,
                //                             fontWeight: FontWeight.w700),
                //                       ),
                //                     ]),
                //               )
                //             ],
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),

                const Text(
                  'Choose recepients',
                  style: h6,
                ),

                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  color: Color.fromARGB(10, 10, 10, 1),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 8, bottom: 8, right: 8),
                    child: TextField(
                      controller: _search_contact,
                      decoration: InputDecoration(
                        icon: Image.asset(
                          'assets/kit-/images/search-vRs.png',
                          scale: 3,
                        ),
                        hintStyle:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                        hintText: 'Search contacts...',
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        // Xử lý khi giá trị thay đổi
                      },
                      onSubmitted: (value) {
                        // Xử lý khi người dùng nhấn "Enter" hoặc hoàn thành nhập liệu
                      },
                    ),
                  ),
                ),

                Row(
                  
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: const BorderSide(color: Colors.orange)),
                        child: Stack(children: [
                          Container(
                            width: 130,
                            height: 154,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/kit-/images/unsplash-k4a59mzzty-bg-5vm.png'),
                                  radius: 24,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('Linda John', style: body_small_bold,)
                              ],
                            ),
                          ),
                          const Positioned(
                              top: 10,
                              right: 10,
                              child: Icon(
                                Icons.check,
                                color: Colors.orange,
                              )),
                        ]),
                      ),
                    ),
                    SizedBox(width: 12,),
                    InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: const BorderSide(color: Colors.grey)),
                        child: Container(
                          width: 130,
                          height: 154,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/kit-/images/unsplash-hrfz1yoqwe-bg.png'),
                                radius: 24,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('David Wiliam', style: body_small_bold,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(47, 162, 185, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: () {
                        
                      },
                      child: Text('Continue', style: body_large_bold,)),
                )
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
