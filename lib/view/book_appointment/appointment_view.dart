import 'package:flutter/material.dart';
import 'package:flutter_medical_app/consts/colors.dart';
import 'package:flutter_medical_app/controller/appointment_controller.dart';
import 'package:flutter_medical_app/controller/auth_controller.dart';
import 'package:flutter_medical_app/view/book_appointment/appointment_details.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class AppointmentView extends StatelessWidget {

final bool isDoctor;
  const AppointmentView({Key? key,  this.isDoctor = false, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        title: Text(
          "Appointment",
          style: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(onPressed: ()=>AuthController().signOut(), icon: const Icon(Icons.logout))
        ],
      ),
      body: FutureBuilder(
        future: controller.getAppointmentList(isDoctor),
        builder: (context, snapshot){

          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
          }
          else{
            final data = snapshot.data!.docs;
            print("data $data");

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index){
                    print(" length is ${data.length}");
                    return ListTile(
                      onTap: (){
                        Get.to(()=> AppointmentDetails(docs: data[index],),);
                      },
                      leading: CircleAvatar(
                        child: Image.asset('assets/images/image_signup.png'),
                      ),
                      title: Text(isDoctor ? data[index]['appName'] : data[index]['appWithDoc'],
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text("${data[index]['appDay']} - ${data[index]['appTime']}",
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          color: AppColor.black54.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                    );
                  }),
            );
          }
        },
      )
    );
    
  }
}
