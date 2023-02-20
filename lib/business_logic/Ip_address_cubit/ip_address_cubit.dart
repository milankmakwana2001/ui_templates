import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ui_templates/business_logic/models/getIpAddressRepoModel.dart';
import 'package:ui_templates/business_logic/models/get_info_of_ip_address_repo_model.dart';
import 'package:ui_templates/business_logic/reositories/get_info_of_ip_address_repo.dart';
import 'package:ui_templates/business_logic/reositories/get_ip_address_repo.dart';

part 'ip_address_state.dart';

class IpAddressCubit extends Cubit<IpAddressState> {
  GetIpAddressRepo getIpAddressRepo;
  GetInfoOfIpAddressRepo getInfoOfIpAddressRepo;

  IpAddressCubit({
    required this.getIpAddressRepo,
    required this.getInfoOfIpAddressRepo,
  }) : super(IpAddressInitial());

  Future getData() async {
    emit(Loading());
    try {
      GetIpAddressRepoModel ip = await getIpAddressRepo.getIpAddress();
      // emit(Loading());
      try {
        var response = await getInfoOfIpAddressRepo.getInfo(ip.ip);
        emit(
          Success(
            ipInfo: response,
          ),
        );
      } catch (e) {
        emit(Error());
      }
    } catch (e) {
      emit(Error());
    }
  }
}
