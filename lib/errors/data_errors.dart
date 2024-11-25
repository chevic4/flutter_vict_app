sealed class DataError {}

// ошибки на сетевом слое статус
class DataErrorNetowrkBadData implements DataError {
  final String errorStatusCode;

  DataErrorNetowrkBadData({required this.errorStatusCode});
}

// ошибки на сетевом неизвестная
class DataErrorNetowrkUnknown implements DataError {
  final String error;
  DataErrorNetowrkUnknown({
    required this.error,
  });
}

// ошибки данных
class DataErrorDataLayer implements DataError {}
