import 'package:erp_app/pages_erp/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      debugShowCheckedModeBanner: false,
      home: Container(color:Colors.white,width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(children: [
                   
                    Padding(
                      padding: const EdgeInsets.only(top: 22,left: 10,right: 264,bottom: 50),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/svg/backbutton_svg.svg",height: 42,width: 85,),],
                      ),
                    ),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 26),
                        child: Stack(
                          children: [
                            Container(height: 200,width: 334,
                              child: SvgPicture.asset("assets/svg/bgstars_svg.svg")),
                              Padding(
                                padding: const EdgeInsets.only(left: 98,top: 53),
                                child: Container(height: 118,width: 99,
                                  child: SvgPicture.asset("assets/svg/otp_verification_svg.svg"),
                                ),
                              )
                          ],
                        ),
                      )
                      ],
                    ),
                   Padding(
                     padding: const EdgeInsets.only(top: 12),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("OTP Verification",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24),)
                      ],
                  ),
                   ),
                   Padding(
                    padding: const EdgeInsets.only(top: 13,bottom: 17),
                    child: SvgPicture.asset("assets/svg/green_dots.svg",width: 88,height: 6)),
                   Row(mainAxisAlignment: MainAxisAlignment.center,
                         children: const [
                            Text("A One-Time Password (OTP) has been sent",)
                      ],
                    ),
                   Row(mainAxisAlignment: MainAxisAlignment.center,
                       children: const [
                            Text("to your Mobile Number.",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                 ],
               ),
                   Padding(
                   padding: const EdgeInsets.only(top: 13),
                   child: Container(
                          child: const Text("+91 9876* ***20",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Color.fromRGBO(35, 133, 59, 1)),),

                    ),
                  ),
                     Padding(
                      padding: const EdgeInsets.only(top: 14,bottom: 17),
                      child: Container(height: 50,width: 251,
                          child: Row(
                            children: [  
                              Container(
                                height: 50,
                                  width: 50,
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    maxLength: 1,
                                    cursorColor: Theme.of(context).primaryColor,
                                    decoration: const InputDecoration(
                                                  contentPadding: EdgeInsets.only(top: 11),
                                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                                  counterText: '',
                                                  hintText: "0",
                                                  hintStyle: TextStyle(color: Colors.grey, fontSize: 18,fontWeight: FontWeight.w500)),
                                                
                      ),
                    ),
                     Padding(
                       padding: const EdgeInsets.only(left: 17,right: 17),
                       child: Container(
                    height: 50,
                    width: 50,
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 11),
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                        counterText: '',
                        hintText: "0",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18,fontWeight: FontWeight.w500)),
                    
                        ),
                    ),
                     ),
                     Container(
                    height: 50,
                    width: 50,
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(top: 11),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                      counterText: '',
                      hintText: "0",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18,fontWeight: FontWeight.w500)),
                    
                      ),
                    ),
                     Padding(
                       padding: const EdgeInsets.only(left: 17),
                       child: Container(
                    height: 50,
                    width: 50,
      child: TextField(
        
        showCursor: false,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(top: 11),
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                        counterText: '',
                        hintText: "0",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18,fontWeight: FontWeight.w500)),
                    
                        ),
                    ),
                     )
                ],
                ),
              ),
            ),
            Container(height: 27,width: 58,alignment: Alignment.center,
              child: Text("00:46",style: TextStyle(fontSize:18,fontWeight:FontWeight.w600,color:Color.fromRGBO(35, 133, 59, 1))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26,right: 25,top: 17),
              child: ClipRRect(borderRadius: BorderRadius.circular(16),
              child: Container(height:50,width:305,
              child:ElevatedButton(onPressed: ()=> Navigator.push(context,
                                 MaterialPageRoute(builder: (context) => HomePage(),)), 
              child: const Text("Verify",style: TextStyle(fontSize: 14,fontWeight:FontWeight.w500)),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(35, 133, 59, 1))),
              )
              )
              ),
            ),
             ]
            )))));
  }
}