abstract class LocalStorageState {}

class EmptyLocalStorageState extends LocalStorageState {}

class LoadingLocalStorage extends LocalStorageState {}

class LoadedLocalStorage extends LocalStorageState {
  String value;
  LoadedLocalStorage({required this.value});
}
