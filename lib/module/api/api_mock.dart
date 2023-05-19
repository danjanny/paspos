class ApiMock {
  // FORM
  // 200
  static String responseSuccess =
      'https://run.mocky.io/v3/bb9d8a1b-f643-4dd0-8c42-36b29735490b';

  // 403
  static String responseFormError =
      "https://run.mocky.io/v3/05d050b6-5879-4605-b371-8b329b02f610";

  // selain 200, 401, 403
  static String responseGeneralError =
      "https://run.mocky.io/v3/dd18f165-8e4b-40a4-80a6-13e369a3739a";

  // LIST PRODUCT
  // 200
  static String productsResponseSuccess = "https://run.mocky.io/v3/52f2ad2f-59d8-4f57-9050-7241b36fcdcb";
  static String productResponseSuccess = "";

  // 404
  static String productsNoFound = "";

  // selain 200, 404
  static String productsGeneralError = "";
}
