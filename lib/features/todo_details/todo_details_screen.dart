import 'package:flutter/material.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/style_manegares/text_style.dart';
import 'package:todoapp/core/widgets/button2.dart';

class TodoDetailsScreen extends StatelessWidget {
  const TodoDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.primaryColor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios, color: Appcolors.mint),
        ),
      ),
      body: Container(
        color: Appcolors.primaryColor,
        child: SafeArea(
          child: Stack(
            children: [
              Container(decoration: BoxDecoration(color: Appcolors.mint)),
              ClipPath(
                clipper: CurvedClipper(),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  height: height * 0.42,
                  decoration: BoxDecoration(color: Appcolors.primaryColor),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: ListView(
                  children: [
                    SizedBox(height: height * 0.12),
                    Text(
                      "Todo Title",
                      style: CustmizedTextStyle.headerText.copyWith(
                        fontSize: width * 0.1,
                      ),
                    ),
                    Text(
                      "Todo deadline : 17/2/2025",
                      style: CustmizedTextStyle.headerText.copyWith(
                        fontSize: width * 0.04,
                      ),
                    ),
                    SizedBox(height: height * 0.145),
                    Text(
                      "lorem askdn kjash dkjvdhasdvas hvdjas dasv dahvsdhvsnbvsanv dhasvdhg ashg dh sadjb aghdjkas bdjas jdvas dhvash dvas vdhas jhv kjsad sjb adsb hab sdnv asba sdjm jsabdjas djavdsj asvdmansbd uaghlkhldKJAB ",
                      style: CustmizedTextStyle.headerText.copyWith(
                        color: Appcolors.secColor,
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Button2(
                          lable: "done",
                          icon: Icons.done_all_sharp,
                          color: Colors.green,
                          onTap: () {},
                        ),
                        Button2(
                          lable: "delete",
                          icon: Icons.delete_outlined,
                          color: Appcolors.primaryColor,
                          onTap: () {},
                        ),
                        Button2(
                          lable: "done",
                          icon: Icons.edit_outlined,
                          color: Colors.amberAccent,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);

    // 🟡 منحنى دائري
    path.quadraticBezierTo(
      size.width / 2,
      size.height, // النقطة اللي في النص (قمة المنحنى)
      size.width,
      size.height - 100, // النقطة الأخيرة
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CurvedClipper oldClipper) => false;
}
