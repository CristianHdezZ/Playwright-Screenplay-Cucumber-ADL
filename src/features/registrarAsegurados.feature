
Feature: registrarAsegurados
  Como usuario de la Consola de Colaborador de Seguros ADL
  Quiero registrar información de mis asegurados en el módulo "Gestiona tus asegurados"
  Para mantener los datos actualizados y completos

  Background:
    Given Cristian opens the application
    When he loads the authentication token and goes to the homepage
    And el usuario está en el módulo "/benefits/insured"

  @registro_familiar @Regresion @registrarAsegurados
  Scenario Outline: Registrar un nuevo familiar
    And el usuario está en la sesion " Mi familia "
    And el usuario completa el formulario con los siguientes datos
      | primerNombre   | segundoNombre   | primerApellido   | segundoApellido   | tipoDocumento   | numeroDocumento   | fechaNacimiento   | genero   | parentesco   | eps   | departamento   | ciudad   |
      | <primerNombre> | <segundoNombre> | <primerApellido> | <segundoApellido> | <tipoDocumento> | <numeroDocumento> | <fechaNacimiento> | <genero> | <parentesco> | <eps> | <departamento> | <ciudad> |
    And el usuario hace clic en Registrar
    Then el sistema debe mostrar un mensaje de éxito
    Examples:
      | primerNombre | segundoNombre | primerApellido | segundoApellido | tipoDocumento        | numeroDocumento | fechaNacimiento | genero    | parentesco | eps    | departamento | ciudad   |
      | María        | Fernanda      | López          | Rodríguez       | Cédula de ciudadanía | 178965400       | 1985-05-12      | Femenino  | Cónyuge    | Sura   | Antioquia    | Medellín |
      | Luis         | Alberto       | Martínez       | Sánchez         | Cédula de ciudadanía | 123456700       | 2000-09-30      | Masculino | Hijo(a)    | Mutual | Antioquia    | Medellín |


  @registro_familiar_excel @Regresion @registrarAsegurados
  Scenario: Registrar varios familiares desde Excel
    And el usuario está en la sesion " Mi familia "
    And el usuario carga los familiares desde el archivo "src/data/asegurados.xlsx"


  @actualizar_familiar @Regresion @editarAsegurado
  Scenario Outline: Actualizar la información de un familiar existente
    And el usuario está en la sesion " Mi familia "
    And el usuario selecciona el familiar con número de documento "<numeroDocumento>"    
    And el usuario actualiza el formulario con los siguientes datos
      | primerNombre   | segundoNombre   | primerApellido   | segundoApellido   | tipoDocumento   | numeroDocumento   | fechaNacimiento   | genero   | parentesco   | eps   | departamento   | ciudad   |
      | <primerNombre> | <segundoNombre> | <primerApellido> | <segundoApellido> | <tipoDocumento> | <numeroDocumento> | <fechaNacimiento> | <genero> | <parentesco> | <eps> | <departamento> | <ciudad> |
    Then el sistema debe mostrar un mensaje de éxito de la actualización

    Examples:
      | numeroDocumento | primerNombre | segundoNombre | primerApellido | segundoApellido | tipoDocumento        | fechaNacimiento | genero   | parentesco | eps  | departamento | ciudad   |
      | 145521155       | Ana          | María         | López          | Pérez           | Cédula de ciudadanía | 1992-03-15      | Femenino | Hermano(a) | Sura | Antioquia    | Medellín |


  @registro_mascota @Regresion @registrarAsegurados
  Scenario Outline: Registrar una nueva mascota
    And el usuario está en la sesion " Mis mascotas "
    And el usuario completa el formulario de mascota con los siguientes datos
      | nombreMascota   | tipoMascota   | fechaNacimiento   | raza   | genero   |
      | <nombreMascota> | <tipoMascota> | <fechaNacimiento> | <raza> | <genero> |
    And el usuario hace clic en Registrar
    Then el sistema debe mostrar un mensaje de éxito
    Examples:
      | nombreMascota | tipoMascota | fechaNacimiento | raza            | genero |
      | Max           | Gato        | 2020-03-15      | Siamés          | Macho  |
      | Bella         | Perro       | 2019-11-20      | Bulldog Francés | Hembra |


  @registro_mascota_excel @Regresion @registrarAsegurados
  Scenario: Registrar mascotas desde Excel
    And el usuario está en la sesion " Mis mascotas "
    When el usuario registra todas las mascotas desde el archivo "src/data/asegurados.xlsx"



  @registro_vehiculo @Regresion @registrarAsegurados
  Scenario Outline: Registrar un nuevo vehículo
    And el usuario está en la sesion " Mis vehículos "
    And el usuario completa el formulario de vehículo con los siguientes datos
      | placa   | modelo   | propietario   | tipoVehiculo   | marca   | esPropietario   | departamento   | ciudad   | tipoServicio   |
      | <placa> | <modelo> | <propietario> | <tipoVehiculo> | <marca> | <esPropietario> | <departamento> | <ciudad> | <tipoServicio> |
    And el usuario hace clic en Registrar
    Then el sistema debe mostrar un mensaje de éxito
    Examples:
      | placa  | modelo | propietario   | tipoVehiculo | marca  | esPropietario | departamento | ciudad   | tipoServicio |
      | OPU896 | 2025   | DAVID ALVAREZ | Automóvil    | TOYOTA | Sí            | Antioquia    | Medellín | Particular   |
      | ABX986 | 2020   | DAVID ALVAREZ | Automóvil    | TOYOTA | No            | Antioquia    | Medellín | Particular   |


  @registro_vehiculo_excel @Regresion @registrarAsegurados
  Scenario: Registrar vehículo desde Excel
    And el usuario está en la sesion " Mis vehículos "
    When el usuario registra todos los vehículos desde el archivo "src/data/asegurados.xlsx"


  @registro_inmueble @Regresion @registrarAsegurados
  Scenario Outline: Registrar un nuevo inmueble
    And el usuario está en la sesion " Mis inmuebles "
    And el usuario completa el formulario de inmueble con los siguientes datos
      | direccion   | departamento   | ciudad   | tipoInmueble   | conjunto   | yearConstruccion   | pisos   | nombreConjunto   | interior   | torre   | apartamento   |
      | <direccion> | <departamento> | <ciudad> | <tipoInmueble> | <conjunto> | <yearConstruccion> | <pisos> | <nombreConjunto> | <interior> | <torre> | <apartamento> |
    And el usuario hace clic en Registrar
    Then el sistema debe mostrar un mensaje de éxito
    Examples:
      | direccion       | departamento | ciudad   | tipoInmueble | conjunto | yearConstruccion | pisos | nombreConjunto        | interior | torre | apartamento |
      #| Carrera 45 #67-89 | Antioquia    | Medellín | Casa         | Abierto  | 10                | 2     | Villa Alegre           | N/A      | N/A   | N/A         |
      | Calle 23 #45-67 | Antioquia    | Medellín | Apto         | Cerrado  | 3                | 4     | Residencial Los Pinos | 1        | 2     | 201         |

  @registro_inmueble_excel @Regresion @registrarAsegurados
  Scenario: Registrar inmuebles desde Excel
    And el usuario está en la sesion " Mis inmuebles "
    When el usuario registra todos los inmuebles desde el archivo "src/data/asegurados.xlsx"


  @validacion_campos_numericos_inmueble @registrarAsegurados
  Scenario Outline: Validar que los campos Interior, Torre y Apartamento solo acepten valores numéricos
    Given el usuario está en la sesion " Mis inmuebles "
    When el usuario intenta ingresar valores no numéricos en los campos del formulario de inmueble
      | interior   | torre   | apartamento   |
      | <interior> | <torre> | <apartamento> |
    Then el sistema no debe permitir ingresar letras en dichos campos

    Examples:
      | interior | torre | apartamento |
      | A        | B     | C           |
      | ABC      | 12B   | x3          |
      | !@#      | $%^   | &*()        |