import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:store/utils/popups/loaders.dart';

class NetworkManager extends GetxController{
/// Manages the network connectivity status  and provides methods to check and handle the connectivity changes.
  static NetworkManager get instance => Get.find();


// this is the core class of the package
final Connectivity _connectivity = Connectivity();
// stream of results >>> on the connection status 
late StreamSubscription<ConnectivityResult> _connectivitySubscription;

final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

/// Initialize the network manager and set up a stream to continually check and monitor the connection status.
@override
  void onInit() {
    super.onInit();
    // to make it like this not the list >>>> you should use the version 5.0.1 of the package connectivity_plus

    // to listen to changes in the connectivity and update the connection status when there is a change
    // open this stream once opening this class
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus)  ;
  }

/// update the connection status < connection new result >  based on changes in the connectivity and show a relevant popup for no internet connection.
Future<void> _updateConnectionStatus(ConnectivityResult result) async {
  _connectionStatus.value = result;
    if(_connectionStatus.value == ConnectivityResult.none){
      CLoaders.warningSnackBar(title: 'No Internet Connection');
      
    }
}

// check the internet connection status
// return true if connected otherwise false
  Future<bool> isConnected()async {
    
 
  
  final result = await _connectivity.checkConnectivity();
  try {
    if(result != ConnectivityResult.wifi && result != ConnectivityResult.mobile)
    {
            log(result.toString());

      return false; 
    }
    else
    {
      log(result.toString());
      return true;
    }
    // if the package cannot get the connectivity result from the device 
  } on PlatformException catch (_) {
    // so if the package cannot get the connectivity result from the device it will be disconnected
    return false ; 
  }
  }


  // dispose or close the active connectivity stream
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }


}