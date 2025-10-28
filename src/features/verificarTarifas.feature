Feature: Verificar tarifas de productos para colaborador
  Como colaborador del sistema
  Quiero visualizar las tarifas de los productos disponibles
  Para validar que se muestren correctamente según mis condiciones

  Background:
    Given Cristian opens the application
    When he loads the authentication token and goes to the homepage
    And el usuario está en el módulo "/benefits/portfolio-services"

  @Verificar_Tarifas_Productos_Colaborador
  Scenario Outline: Verificar tarifas para Colaborador
    And el colaborador actualiza su fecha de nacimiento con "<Id>", "<birthDate>" y "<eps>"
    And el selecciona el "<servicio>", "<categoria>" y selecciona la "<entidad>"
    And el colaborador activa el beneficio "<producto>", "<metodoPago>"
    Then la plataforma muestra el "<producto>" disponible y la respectiva "<tarifa>" del producto

    Examples:
      | servicio | categoria            | entidad    | producto    | metodoPago | tarifa  | Id | birthDate                | eps | condicion   |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 322560  | 5  | 2007-05-05T00:00:00.000Z | 13  | Plena       |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 446482  | 5  | 2005-05-05T00:00:00.000Z | 13  | Plena       |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 518064  | 5  | 1983-05-05T00:00:00.000Z | 13  | Plena       |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 690248  | 5  | 1973-05-05T00:00:00.000Z | 13  | Plena       |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 1607986 | 5  | 1964-05-05T00:00:00.000Z | 13  | Plena       |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 310590  | 5  | 2007-01-27T00:00:00.000Z | 15  | Simulteidad |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 434512  | 5  | 1990-01-27T00:00:00.000Z | 15  | Simulteidad |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 506094  | 5  | 1984-01-27T00:00:00.000Z | 15  | Simulteidad |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 678278  | 5  | 1974-01-27T00:00:00.000Z | 15  | Simulteidad |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 1596016 | 5  | 1965-01-27T00:00:00.000Z | 15  | Simulteidad |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 213464  | 5  | 2007-01-27T00:00:00.000Z | 13  | Plena       |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 355243  | 5  | 1990-01-27T00:00:00.000Z | 13  | Plena       |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 412197  | 5  | 1984-01-27T00:00:00.000Z | 13  | Plena       |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 628458  | 5  | 1974-01-27T00:00:00.000Z | 13  | Plena       |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 1295229 | 5  | 1965-01-27T00:00:00.000Z | 13  | Plena       |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 201494  | 5  | 2007-01-27T00:00:00.000Z | 15  | Simulteidad |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 343273  | 5  | 1990-01-27T00:00:00.000Z | 15  | Simulteidad |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 400227  | 5  | 1984-01-27T00:00:00.000Z | 15  | Simulteidad |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 616488  | 5  | 1974-01-27T00:00:00.000Z | 15  | Simulteidad |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 1283259 | 5  | 1965-01-27T00:00:00.000Z | 15  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 384300  | 5  | 2011-05-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 384300  | 5  | 2010-05-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 384300  | 5  | 1964-05-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1234590 | 5  | 1960-05-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1340535 | 5  | 1954-05-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1340535 | 5  | 1950-05-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1563660 | 5  | 1949-05-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1563660 | 5  | 1945-05-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1563660 | 5  | 1940-05-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1563660 | 5  | 1934-05-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 363300  | 5  | 2011-05-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 363300  | 5  | 2010-05-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 363300  | 5  | 1964-05-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1213590 | 5  | 1960-05-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1319535 | 5  | 1954-05-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1542660 | 5  | 1949-05-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1542660 | 5  | 1945-05-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1542660 | 5  | 1940-05-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1542660 | 5  | 1935-05-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 247695  | 5  | 2011-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 247695  | 5  | 2010-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 247695  | 5  | 1964-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 824775  | 5  | 1960-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 896595  | 5  | 1954-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1115310 | 5  | 1950-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1115310 | 5  | 1945-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1115310 | 5  | 1940-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1115310 | 5  | 1935-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 226695  | 5  | 2011-01-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 226695  | 5  | 2010-01-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 226695  | 5  | 1964-01-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 803775  | 5  | 1960-01-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 803775  | 5  | 1960-01-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 875595  | 5  | 1954-01-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1094310 | 5  | 1950-01-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1094310 | 5  | 1945-01-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1094310 | 5  | 1940-01-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1094310 | 5  | 1935-01-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colmédica  | Diamante    | Bolsa      | 474330  | 5  | 1990-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colmédica  | Diamante    | Bolsa      | 1416711 | 5  | 1960-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colmédica  | Diamante    | Bolsa      | 463158  | 5  | 1990-01-27T00:00:00.000Z | 1   | Simulteidad |
      | Salud    | Medicinas prepagadas | Colmédica  | Diamante    | Bolsa      | 1405539 | 5  | 1960-01-27T00:00:00.000Z | 1   | Simulteidad |
      | Salud    | Medicinas prepagadas | Colmédica  | Zafiro      | Bolsa      | 402642  | 5  | 1990-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colmédica  | Zafiro      | Bolsa      | 1183226 | 5  | 1960-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colmédica  | Zafiro      | Bolsa      | 391470  | 5  | 1990-01-27T00:00:00.000Z | 1   | Simulteidad |
      | Salud    | Medicinas prepagadas | Colmédica  | Zafiro      | Bolsa      | 1134883 | 5  | 1960-01-27T00:00:00.000Z | 1   | Simulteidad |
      | Salud    | Medicinas prepagadas | Emermédica | Emermédica  | Bolsa      | 44065   | 5  | 1960-01-27T00:00:00.000Z | 1   | Simulteidad |

  @Verificar_Tarifas_Productos_Familiar
  Scenario Outline: Verificar tarifas de productos para Familiar
    And el colaborador actualiza la fecha de nacimiento del familiar con "<Id>", "<birthDate>" y "<eps>"
    And el selecciona el "<servicio>", "<categoria>" y selecciona la "<entidad>"
    And el colaborador activa el beneficio "<producto>", "<metodoPago>" para el familiar "<nombreFamiliar>"
    Then la plataforma muestra el "<producto>" disponible y la respectiva "<tarifa>" del producto

    Examples:
      | servicio | categoria        | entidad | producto | metodoPago | tarifa | Id   | birthDate                | eps | condicion | nombreFamiliar |
      | Salud    | Pólizas de salud | Sura    | Global   | Bolsa      | 322560 | 2797 | 2007-05-05T00:00:00.000Z | 13  | Plena     | Ana López      |
