class Environment {

  final String apiUrl;
  final LogOptions logOptions;


  Environment({required this.apiUrl, required this.logOptions});

}

class LogOptions {
  final bool requestHeader;
  final bool requestBody;
  final bool responseHeader;
  final bool responseBody;

  LogOptions.debug() :
        this.requestHeader = true,
        this.requestBody = true,
        this.responseHeader = true,
        this.responseBody = true;

  LogOptions.staging() :
      this.requestHeader = true,
      this.requestBody = false,
      this.responseHeader = true,
      this.responseBody = false;

  LogOptions.release() :
        this.requestHeader = false,
        this.requestBody = false,
        this.responseHeader = false,
        this.responseBody = false;

}

class EnvironmentValue {

  static final Environment dev = Environment(apiUrl: "undefined", logOptions: LogOptions.debug());

  static final Environment staging = Environment(apiUrl: "undefined", logOptions: LogOptions.staging());

  static final Environment release = Environment(apiUrl: "undefined", logOptions: LogOptions.release());

}