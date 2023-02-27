part of 'ip_address_cubit.dart';

abstract class IpAddressState extends Equatable {
  const IpAddressState();
}

class IpAddressInitial extends IpAddressState {
  @override
  List<Object> get props => [];
}

class Loading extends IpAddressState {
  @override
  List<Object> get props => [];
}


class Success extends IpAddressState {
  GetInfoOfIpRepoModel ipInfo;
  Success({required this.ipInfo});
  @override
  List<Object> get props => [ipInfo];
}


class Error extends IpAddressState {
  @override
  List<Object> get props => [];
}
