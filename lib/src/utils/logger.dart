_Logger getLogger(String classname) => _Logger(classname);

class _Logger {
  final String className;

  _Logger(this.className);

  void log(String message, {Exception stacktrace}) {
    print("$className - $message");
    if (stacktrace != null) {
      print(stacktrace);
    } 
  }
}