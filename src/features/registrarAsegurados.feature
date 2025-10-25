
Feature: registrarAsegurados
  Como usuario del módulo "Gestiona tus asegurados"
  Quiero registrar información de mis asegurados
  Para mantener los datos actualizados y completos

  Background:
    Given Cristian opens the application
    When he loads the authentication token and goes to the homepage
    And el usuario está en el módulo " Gestiona tus asegurados "

  @registro_familiar @Regresion
  Scenario Outline: Registrar un nuevo familiar
    And el usuario está en el sesion " Mi familia "
    And el usuario completa el formulario con los siguientes datos
      | primerNombre   | segundoNombre   | primerApellido   | segundoApellido   | tipoDocumento   | numeroDocumento   | fechaNacimiento   | genero   | parentesco   | eps   | departamento   | ciudad   |
      | <primerNombre> | <segundoNombre> | <primerApellido> | <segundoApellido> | <tipoDocumento> | <numeroDocumento> | <fechaNacimiento> | <genero> | <parentesco> | <eps> | <departamento> | <ciudad> |
    And el usuario hace clic en Registrar
    Then el sistema debe mostrar un mensaje de éxito
    Examples:
      | primerNombre | segundoNombre | primerApellido | segundoApellido | tipoDocumento        | numeroDocumento | fechaNacimiento | genero    | parentesco | eps         | departamento    | ciudad |
      | María        | Fernanda      | López          | Rodríguez       | Cédula de ciudadanía | 178965432       | 1985-05-12      | Femenino  | Cónyuge    | Sura eps    | Cundinamarca    | Bogotá |
      | Luis         | Alberto       | Martínez       | Sánchez         | Cédula de ciudadanía | 123456789       | 2000-09-30      | Masculino | Hijo(a)    | Coomeva eps | Valle del Cauca | Cali   |


  @registro_familiar_excel @Regresion
  Scenario: Registrar varios familiares desde Excel
    And el usuario está en el sesion " Mi familia "
    And el usuario carga los familiares desde el archivo "src/data/asegurados.xlsx"


  @registro_mascota @Regresion
  Scenario Outline: Registrar una nueva mascota
    And el usuario está en el sesion " Mis mascotas "
    And el usuario completa el formulario de mascota con los siguientes datos
      | nombreMascota   | tipoMascota   | fechaNacimiento   | raza   | genero   |
      | <nombreMascota> | <tipoMascota> | <fechaNacimiento> | <raza> | <genero> |
    And el usuario hace clic en Registrar
    Then el sistema debe mostrar un mensaje de éxito
    Examples:
      | nombreMascota | tipoMascota | fechaNacimiento | raza   | genero |
      | Max           | Gato        | 2020-03-15      | Siamés | Macho  |
  # | Bella         | Perro       | 2019-11-20      | Bulldog Francés    | Hembra |


  @registro_mascota_excel @Regresion
  Scenario: Registrar mascotas desde Excel
    And el usuario está en el sesion " Mis mascotas "
    When el usuario registra todas las mascotas desde el archivo "src/data/asegurados.xlsx"



  @registro_vehiculo @Regresion
  Scenario Outline: Registrar un nuevo vehículo
    And el usuario está en el sesion " Mis vehículos "
    And el usuario completa el formulario de vehículo con los siguientes datos
      | placa   | modelo   | propietario   | tipoVehiculo   | marca   | esPropietario   | departamento   | ciudad   | tipoServicio   |
      | <placa> | <modelo> | <propietario> | <tipoVehiculo> | <marca> | <esPropietario> | <departamento> | <ciudad> | <tipoServicio> |
    And el usuario hace clic en Registrar
    Then el sistema debe mostrar un mensaje de éxito
    Examples:
      | placa  | modelo | propietario | tipoVehiculo | marca  | esPropietario | departamento | ciudad   | tipoServicio |
      | OPU78F | 2025   | Juan Pérez  | Automóvil    | TOYOTA | Sí            | Antioquia    | Medellín | Particular   |
      | ABX123 | 2020   | Ana Gómez   | Motocicleta  | HONDA  | No            | Cundinamarca | Bogotá   | Particular   |


  @registro_vehiculo_excel @Regresion
  Scenario: Registrar vehículo desde Excel
    And el usuario está en el sesion " Mis vehículos "
    When el usuario registra todas las mascotas desde el archivo "src/data/asegurados.xlsx"


