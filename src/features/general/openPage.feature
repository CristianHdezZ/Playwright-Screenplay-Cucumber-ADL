Feature: OpenPage
  Como usuario de la aplicación Seguros Adl
  Quiero abrir la página principal
  Para verificar que la aplicación se carga correctamente

  @smoke
  Scenario: User opens the base URL
    Given Cristian opens the application
    When he loads the authentication token and goes to the homepage
    Then he should see the page title My Seguros Adl