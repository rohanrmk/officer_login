import 'package:get/get.dart';
import 'package:officer_login/Modal/getDepartmentModalgriev.dart';

import '../Repository/getDepartmentRepoGriev.dart';


DepartmentRepository districtRepository=DepartmentRepository();
class DepartmentViewModal extends GetxController{
  List<DepartmentModalClass>  departmentList=[];
  var isLoading =true.obs;
  @override
  void onInit(){
    super.onInit();
    getAllDepartment();
  }

  getAllDepartment()async{
    var departmentDetails =await districtRepository.getDepartmentData();
    print(departmentDetails);
    if(departmentDetails != null){
      departmentList=departmentDetails;
      isLoading.value=false;
    }
    print(departmentList);
  }
}