
import 'package:get/get.dart';
import 'package:officer_login/View/post_grievance.dart';
import '../Modal/PostGrievanceModal.dart';
import '../Repository/PostGrievanceRepo.dart';


class PostGrievanceVM extends GetxController {

   List<CitizenGrievanceImage> citizenGrievanceImages = [];
  PostGrievanceModal postGrievanceModal = PostGrievanceModal();
  var isLoading = true.obs;

  @override
  void onReady(){
   // postGrievanceInfo(postGrievanceModal);
  }


  postGrievanceInfo(PostGrievanceModal postGrievanceModal) async  {
    await PostGrievanceRepo.postGrievanceData(
      113,
      "",
      int.parse(selectedDistrictValue!),
      int.parse(selectedTalukaValue!),
       0,
      int.parse(selectedVillageValue!),
      int.parse(selectedDepartmentValue!),
      int.parse(selectedOfficeValue!),
      int.parse(selectedNatureValue!),
      description.text,
      0,
      "",
      "",
      "",
      0,
      1,
      postImageList,
    );


  }



}
class PostGrievanceVM1 extends GetxController {

   List<CitizenGrievanceImage> citizenGrievanceImages = [];
  PostGrievanceModal postGrievanceModal = PostGrievanceModal();
  var isLoading = true.obs;

  @override
  void onReady(){
   // postGrievanceInfo(postGrievanceModal);
  }


  postGrievanceInfo1(PostGrievanceModal postGrievanceModal) async  {
    await PostGrievanceRepo.postGrievanceData(
      113,
      "",
      int.parse(selectedDistrictValue1!),
      int.parse(selectedTalukaValue1!),
       0,
      int.parse(selectedVillageValue1!),
      int.parse(selectedDepartmentValue1!),
      int.parse(selectedOfficeValue1!),
      int.parse(selectedNatureValue1!),
      description1.text,
      1,
      postname.text,
      postmobile.text,
      postaddress.text,
      0,
      1,
      postImageList1,
    );

  }

}