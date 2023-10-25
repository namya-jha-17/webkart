import 'package:flutter/cupertino.dart';

@immutable
abstract class FlashState{}

class InitialFlashState extends  FlashState{

}

class FlashLoadingState extends FlashState{

}

class FlashLoadedState extends FlashState{

}