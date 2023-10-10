abstract class LocalStorageEvent {}

class GetInfoEvent extends LocalStorageEvent {
  String key;

  GetInfoEvent(this.key);
}

class PutInfoEvent extends LocalStorageEvent {
  String key;
  String value;
  PutInfoEvent(this.key, this.value);
}
