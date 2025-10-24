
Feature: registrarAsegurados
  Como usuario del módulo "Gestiona tus asegurados"
  Quiero registrar información de mis asegurados
  Para mantener los datos actualizados y completos

  Background:
    Given Cristian opens the application
    When he loads the authentication token and goes to the homepage
    And el usuario está en el módulo " Gestiona tus asegurados "
    
  @registro_familiar @Regresion
  Scenario: Registrar un nuevo familiar
    And el usuario está en el sesion " Mi familia "
    And el usuario completa el formulario con los siguientes datos
      | primerNombre   | segundoNombre | primerApellido | segundoApellido | tipoDocumento | numeroDocumento | fechaNacimiento | genero  | parentesco | eps            | departamento   | ciudad        |
      | Juan           | Carlos        | Pérez          | Gómez           | Cédula de ciudadanía | 145521478    | 1990-01-01     | Masculino |  Hijo(a)  | Aliansalud eps | Antioquia      | Medellín      |
    And el usuario hace clic en Registrar
    Then el sistema debe mostrar un mensaje de éxito


  @registro_familiar_excel
  Scenario: Registrar varios familiares desde Excel
    And el usuario está en el sesion " Mi familia "
    And el usuario carga los familiares desde el archivo "src/data/asegurados.xlsx"
    #And el usuario hace clic en Registrar
    #Then el sistema debe mostrar un mensaje de éxito    


@registro_mascota 
  Scenario: Registrar una nueva mascota
    And el usuario está en el sesion " Mis mascotas "    
    And el usuario completa el formulario de mascota con los siguientes datos
      | nombreMascota | tipoMascota | fechaNacimiento | raza      | genero  |
      | LunaQA        | Perro       | 2021-06-10      | Labrador Retriever  | Hembra  |
    And el usuario hace clic en Registrar
    Then el sistema debe mostrar un mensaje de éxito


 @registro_mascota_excel
  Scenario: Registrar mascotas desde Excel
    And el usuario está en el sesion " Mis mascotas " 
    When el usuario registra todas las mascotas desde el archivo "src/data/asegurados.xlsx"
    # Then el sistema debe mostrar un mensaje de éxito    