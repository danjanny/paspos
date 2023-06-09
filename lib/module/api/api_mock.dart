class ApiMock {
  // FORM
  // 200
  static String responseSuccess =
      'https://run.mocky.io/v3/bb9d8a1b-f643-4dd0-8c42-36b29735490b';

  // 403
  static String responseFormError =
      "https://run.mocky.io/v3/05d050b6-5879-4605-b371-8b329b02f610";

  // 500
  static String responseInternalServerError =
      "https://run.mocky.io/v3/dd18f165-8e4b-40a4-80a6-13e369a3739a";

  // LIST PRODUCT
  // 200
  static String productsResponseSuccess =
      "https://run.mocky.io/v3/001b7f03-d9a7-4140-9617-87dbb20e2db6";
  static String productResponseSuccess =
      "https://run.mocky.io/v3/95c70155-4842-4ce2-95d8-f17d00df7a95";

  // 404
  static String productsNotFound =
      "https://run.mocky.io/v3/63472546-6f91-42a5-b3e2-2d6bd7275474";

  // selain 200, 404, 401, 403, 500
  static String productsGeneralError =
      "https://run.mocky.io/v3/ed925cc3-4636-499a-a722-a83e17002567";
}
