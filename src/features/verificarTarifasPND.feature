Feature: Verificar tarifas de productos para colaborador
  Como colaborador del sistema
  Quiero visualizar las tarifas de los productos disponibles
  Para validar que se muestren correctamente según mis condiciones

  Background:
    Given Cristian opens the application
    When he loads the authentication token and goes to the homepage
    And el usuario está en el módulo "/benefits/portfolio-services"

  @Verificar_Tarifas_Productos_Colaborador @RegressionPND
  Scenario Outline: Verificar tarifas para Colaborador
    And el colaborador actualiza su fecha de nacimiento con "<Id>", "<birthDate>" y "<eps>"
    Then la respuesta del API debe ser exitosamente para la actualización del colaborador con "<Id>"
    And el selecciona el "<servicio>", "<categoria>" y selecciona la "<entidad>"
    And el colaborador activa el beneficio "<producto>", "<metodoPago>"
    Then la plataforma muestra el "<producto>" disponible y la respectiva "<tarifa>" del producto

    Examples:
      | servicio | categoria            | entidad    | producto    | metodoPago | tarifa  | Id | birthDate                | eps | condicion   |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 322560  |35| 2007-05-05T00:00:00.000Z | 13  | Plena       |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 446482  |35| 2005-05-05T00:00:00.000Z | 13  | Plena       |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 518064  |35| 1983-05-05T00:00:00.000Z | 13  | Plena       |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 690248  |35| 1973-05-05T00:00:00.000Z | 13  | Plena       |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 1607986 |35| 1964-05-05T00:00:00.000Z | 13  | Plena       |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 310590  |35| 2007-01-27T00:00:00.000Z | 15  | Simulteidad |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 434512  |35| 1990-01-27T00:00:00.000Z | 15  | Simulteidad |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 506094  |35| 1984-01-27T00:00:00.000Z | 15  | Simulteidad |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 678278  |35| 1974-01-27T00:00:00.000Z | 15  | Simulteidad |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 1596016 |35| 1965-01-27T00:00:00.000Z | 15  | Simulteidad |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 213464  |35| 2007-01-27T00:00:00.000Z | 13  | Plena       |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 355243  |35| 1990-01-27T00:00:00.000Z | 13  | Plena       |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 412197  |35| 1984-01-27T00:00:00.000Z | 13  | Plena       |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 628458  |35| 1974-01-27T00:00:00.000Z | 13  | Plena       |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 1295229 |35| 1965-01-27T00:00:00.000Z | 13  | Plena       |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 201494  |35| 2007-01-27T00:00:00.000Z | 15  | Simulteidad |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 343273  |35| 1990-01-27T00:00:00.000Z | 15  | Simulteidad |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 400227  |35| 1984-01-27T00:00:00.000Z | 15  | Simulteidad |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 616488  |35| 1974-01-27T00:00:00.000Z | 15  | Simulteidad |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 1283259 |35| 1965-01-27T00:00:00.000Z | 15  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 384300  |35| 2011-05-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 384300  |35| 2010-05-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 384300  |35| 1964-05-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1234590 |35| 1960-05-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1340535 |35| 1954-05-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1340535 |35| 1950-05-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1563660 |35| 1949-05-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1563660 |35| 1945-05-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1563660 |35| 1940-05-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1563660 |35| 1934-05-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 363300  |35| 2011-05-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 363300  |35| 2010-05-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 363300  |35| 1964-05-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1213590 |35| 1960-05-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1319535 |35| 1954-05-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1542660 |35| 1949-05-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1542660 |35| 1945-05-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1542660 |35| 1940-05-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1542660 |35| 1935-05-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 247695  |35| 2011-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 247695  |35| 2010-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 247695  |35| 1964-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 824775  |35| 1960-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 896595  |35| 1954-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1115310 |35| 1950-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1115310 |35| 1945-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1115310 |35| 1940-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1115310 |35| 1935-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 226695  |35| 2011-01-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 226695  |35| 2010-01-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 226695  |35| 1964-01-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 803775  |35| 1960-01-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 803775  |35| 1960-01-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 875595  |35| 1954-01-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1094310 |35| 1950-01-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1094310 |35| 1945-01-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1094310 |35| 1940-01-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1094310 |35| 1935-01-27T00:00:00.000Z | 13  | Simulteidad |
      | Salud    | Medicinas prepagadas | Colmédica  | Diamante    | Bolsa      | 474330  |35| 1990-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colmédica  | Diamante    | Bolsa      | 1416711 |35| 1960-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colmédica  | Diamante    | Bolsa      | 463158  |35| 1990-01-27T00:00:00.000Z | 1   | Simulteidad |
      | Salud    | Medicinas prepagadas | Colmédica  | Diamante    | Bolsa      | 1405539 |35| 1960-01-27T00:00:00.000Z | 1   | Simulteidad |
      | Salud    | Medicinas prepagadas | Colmédica  | Zafiro      | Bolsa      | 402642  |35| 1990-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colmédica  | Zafiro      | Bolsa      | 1183226 |35| 1960-01-27T00:00:00.000Z | 15  | Plena       |
      | Salud    | Medicinas prepagadas | Colmédica  | Zafiro      | Bolsa      | 391470  |35| 1990-01-27T00:00:00.000Z | 1   | Simulteidad |
      | Salud    | Medicinas prepagadas | Colmédica  | Zafiro      | Bolsa      | 1134883 |35| 1960-01-27T00:00:00.000Z | 1   | Simulteidad |
      | Salud    | Medicinas prepagadas | Emermédica | Emermédica  | Bolsa      | 44065   |35| 1960-01-27T00:00:00.000Z | 1   | Simulteidad |

  @Verificar_Tarifas_Productos_Familiar @RegressionPND
  Scenario Outline: Verificar tarifas de productos para Familiar
    And el colaborador actualiza la fecha de nacimiento del familiar con "<Id>", "<birthDate>" y "<eps>"
    Then la respuesta del API debe ser exitosamente para la actualización del familiar con "<Id>"
    And el selecciona el "<servicio>", "<categoria>" y selecciona la "<entidad>"
    And el colaborador activa el beneficio "<producto>", "<metodoPago>" para el familiar "<nombreFamiliar>"
    Then la plataforma muestra el "<producto>" disponible y la respectiva "<tarifa>" del producto

    Examples:
      | servicio | categoria            | entidad    | producto    | metodoPago | tarifa  | Id   | birthDate                | eps | condicion   | nombreFamiliar |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 322560  |2426| 2007-05-05T00:00:00.000Z | 13  | Plena       | Ana López      |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 446482  |2426| 2005-05-05T00:00:00.000Z | 13  | Plena       | Ana López      |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 518064  |2426| 1983-05-05T00:00:00.000Z | 13  | Plena       | Ana López      |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 690248  |2426| 1973-05-05T00:00:00.000Z | 13  | Plena       | Ana López      |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 1607986 |2426| 1964-05-05T00:00:00.000Z | 13  | Plena       | Ana López      |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 310590  |2426| 2007-01-27T00:00:00.000Z | 15  | Simulteidad | Ana López      |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 434512  |2426| 1990-01-27T00:00:00.000Z | 15  | Simulteidad | Ana López      |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 506094  |2426| 1984-01-27T00:00:00.000Z | 15  | Simulteidad | Ana López      |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 678278  |2426| 1974-01-27T00:00:00.000Z | 15  | Simulteidad | Ana López      |
      | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 1596016 |2426| 1965-01-27T00:00:00.000Z | 15  | Simulteidad | Ana López      |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 213464  |2426| 2007-01-27T00:00:00.000Z | 13  | Plena       | Ana López      |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 355243  |2426| 1990-01-27T00:00:00.000Z | 13  | Plena       | Ana López      |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 412197  |2426| 1984-01-27T00:00:00.000Z | 13  | Plena       | Ana López      |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 628458  |2426| 1974-01-27T00:00:00.000Z | 13  | Plena       | Ana López      |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 1295229 |2426| 1965-01-27T00:00:00.000Z | 13  | Plena       | Ana López      |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 201494  |2426| 2007-01-27T00:00:00.000Z | 15  | Simulteidad | Ana López      |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 343273  |2426| 1990-01-27T00:00:00.000Z | 15  | Simulteidad | Ana López      |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 400227  |2426| 1984-01-27T00:00:00.000Z | 15  | Simulteidad | Ana López      |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 616488  |2426| 1974-01-27T00:00:00.000Z | 15  | Simulteidad | Ana López      |
      | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 1283259 |2426| 1965-01-27T00:00:00.000Z | 15  | Simulteidad | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 384300  |2426| 2011-05-27T00:00:00.000Z | 15  | Plena       | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 384300  |2426| 2010-05-27T00:00:00.000Z | 15  | Plena       | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 384300  |2426| 1964-05-27T00:00:00.000Z | 15  | Plena       | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1234590 |2426| 1960-05-27T00:00:00.000Z | 15  | Plena       | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1340535 |2426| 1954-05-27T00:00:00.000Z | 15  | Plena       | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1340535 |2426| 1950-05-27T00:00:00.000Z | 15  | Plena       | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1563660 |2426| 1949-05-27T00:00:00.000Z | 15  | Plena       | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1563660 |2426| 1945-05-27T00:00:00.000Z | 15  | Plena       | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1563660 |2426| 1940-05-27T00:00:00.000Z | 15  | Plena       | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1563660 |2426| 1934-05-27T00:00:00.000Z | 15  | Plena       | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 363300  |2426| 2011-05-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 363300  |2426| 2010-05-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 363300  |2426| 1964-05-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1213590 |2426| 1960-05-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1319535 |2426| 1954-05-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1542660 |2426| 1949-05-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1542660 |2426| 1945-05-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1542660 |2426| 1940-05-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1542660 |2426| 1935-05-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 247695  |2426| 2011-01-27T00:00:00.000Z | 15  | Plena       | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 247695  |2426| 2010-01-27T00:00:00.000Z | 15  | Plena       | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 247695  |2426| 1964-01-27T00:00:00.000Z | 15  | Plena       | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 824775  |2426| 1960-01-27T00:00:00.000Z | 15  | Plena       | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 896595  |2426| 1954-01-27T00:00:00.000Z | 15  | Plena       | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1115310 |2426| 1950-01-27T00:00:00.000Z | 15  | Plena       | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1115310 |2426| 1945-01-27T00:00:00.000Z | 15  | Plena       | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1115310 |2426| 1940-01-27T00:00:00.000Z | 15  | Plena       | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1115310 |2426| 1935-01-27T00:00:00.000Z | 15  | Plena       | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 226695  |2426| 2011-01-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 226695  |2426| 2010-01-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 226695  |2426| 1964-01-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 803775  |2426| 1960-01-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 875595  |2426| 1954-01-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1094310 |2426| 1950-01-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1094310 |2426| 1945-01-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1094310 |2426| 1940-01-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1094310 |2426| 1935-01-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |



  @Verificar_Tarifas_PlanDental_Plena @RegressionPND
  Scenario Outline: PlanDental_Plena
    And el colaborador actualiza su fecha de nacimiento con "<idColaborador>", "<birthDate>" y "<eps>"
    Then la respuesta del API debe ser exitosamente para la actualización del colaborador con "<idColaborador>"
    And el colaborador actualiza la fecha de nacimiento del familiar con "<idFamiliar>", "<birthDate>" y "<eps>"
    Then la respuesta del API debe ser exitosamente para la actualización del familiar con "<idFamiliar>"
    And el selecciona el "<servicio>", "<categoria>" y selecciona la "<entidad>"
    And el colaborador activa el beneficio "<producto>", "<metodoPago>"
    Then la plataforma muestra el "<producto>" disponible y la respectiva "<tarifa>" del producto
    When el colaborador confirma el beneficio
    And el colaborador tambien activa el beneficio "<producto>", "<metodoPago>" para el familiar "<nombreFamiliar>"
    Then la plataforma muestra el "<producto>" disponible y la respectiva "<tarifa>" del producto
    When el colaborador desactiva el beneficio

    Examples:
      | servicio | categoria       | entidad    | producto    | metodoPago | tarifa | idColaborador | idFamiliar | birthDate                | eps | condicion                                 | nombreFamiliar |
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 19110  |35           |2426      | 2019-05-05T00:00:00.000Z | 15  | Plena                                     | Ana López      |
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 35490  |35           |2426      | 2015-05-05T00:00:00.000Z | 15  | Plena                                     | Ana López      |
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 56070  |35           |2426      | 2009-05-05T00:00:00.000Z | 15  | Plena                                     | Ana López      |
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 52815  |35           |2426      | 1999-05-05T00:00:00.000Z | 15  | Plena                                     | Ana López      |
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 54495  |35           |2426      | 1963-05-05T00:00:00.000Z | 15  | Plena                                     | Ana López      |
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 18155  |35           |2426      | 2019-05-05T00:00:00.000Z | 13  | Usuarios afiliados solo a EPS Sanitas  5% | Ana López      |
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 33716  |35           |2426      | 2015-05-05T00:00:00.000Z | 13  | Usuarios afiliados solo a EPS Sanitas  5% | Ana López      |
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 53267  |35           |2426      | 2009-05-05T00:00:00.000Z | 13  | Usuarios afiliados solo a EPS Sanitas  5% | Ana López      |
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 50174  |35           |2426      | 1999-05-05T00:00:00.000Z | 13  | Usuarios afiliados solo a EPS Sanitas  5% | Ana López      |
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 51770  |35           |2426      | 1963-05-05T00:00:00.000Z | 13  | Usuarios afiliados solo a EPS Sanitas  5% | Ana López      |


  @Verificar_Add_Medisanitas @RegressionPND
  Scenario Outline: Add Medisanitas
    And el colaborador actualiza su fecha de nacimiento con "<idColaborador>", "<birthDate>" y "<eps>"
    Then la respuesta del API debe ser exitosamente para la actualización del colaborador con "<idColaborador>"
    And el colaborador actualiza la fecha de nacimiento del familiar con "<idFamiliar>", "<birthDate>" y "<eps>"
    Then la respuesta del API debe ser exitosamente para la actualización del familiar con "<idFamiliar>"
    And el selecciona el "<servicio>", "<categoria>" y selecciona la "<entidad>"
    And el colaborador activa el beneficio "<producto>", "<metodoPago>"
    Then la plataforma muestra el "<producto>" disponible y la respectiva "<tarifa>" del producto
    When el colaborador confirma el beneficio
    And el colaborador tambien activa el beneficio "<producto>", "<metodoPago>" para el familiar "<nombreFamiliar>"
    Then la plataforma muestra el "<producto>" disponible y la respectiva "<tarifa>" del producto
    When el colaborador confirma afiliación familiar


    Examples:
      | servicio | categoria            | entidad    | producto    | metodoPago | tarifa | idColaborador | idFamiliar | birthDate                | eps | condicion | nombreFamiliar |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 247695 |35           |2426      | 1990-05-05T00:00:00.000Z | 15  | Plena     | Ana López      |


  @Verificar_Tarifas_PlanDental_ConColsanitas_Medisanitas @RegressionPND
  Scenario Outline: PlanDental - Con Colsanitas o Medisanitas
    And el colaborador actualiza su fecha de nacimiento con "<idColaborador>", "<birthDate>" y "<eps>"
    Then la respuesta del API debe ser exitosamente para la actualización del colaborador con "<idColaborador>"
    And el colaborador actualiza la fecha de nacimiento del familiar con "<idFamiliar>", "<birthDate>" y "<eps>"
    Then la respuesta del API debe ser exitosamente para la actualización del familiar con "<idFamiliar>"
    And el selecciona el "<servicio>", "<categoria>" y selecciona la "<entidad>"
    And el colaborador activa el beneficio "<producto>", "<metodoPago>"
    Then la plataforma muestra el "<producto>" disponible y la respectiva "<tarifa>" del producto
    When el colaborador confirma el beneficio
    And el colaborador tambien activa el beneficio "<producto>", "<metodoPago>" para el familiar "<nombreFamiliar>"
    Then la plataforma muestra el "<producto>" disponible y la respectiva "<tarifa>" del producto
    When el colaborador desactiva el beneficio

    Examples:
      | servicio | categoria       | entidad    | producto    | metodoPago | tarifa | idColaborador | idFamiliar | birthDate                | eps | condicion                                                       | nombreFamiliar |
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 17199  |35           |2426      | 2019-05-05T00:00:00.000Z | 13  | Usuarios Colsanitas o Medisanitas afiliados a EPS Sanitas   10% | Ana López      |
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 31941  |35           |2426      | 2015-05-05T00:00:00.000Z | 13  | Usuarios Colsanitas o Medisanitas afiliados a EPS Sanitas   10% | Ana López      |
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 50463  |35           |2426      | 2009-05-05T00:00:00.000Z | 13  | Usuarios Colsanitas o Medisanitas afiliados a EPS Sanitas   10% | Ana López      |
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 47534  |35           |2426      | 1999-05-05T00:00:00.000Z | 13  | Usuarios Colsanitas o Medisanitas afiliados a EPS Sanitas   10% | Ana López      |
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 49046  |35           |2426      | 1963-05-05T00:00:00.000Z | 13  | Usuarios Colsanitas o Medisanitas afiliados a EPS Sanitas   10% | Ana López      |
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 17581  |35           |2426      | 2019-05-05T00:00:00.000Z | 15  | Usuarios Colsanitas o Medisanitas afiliados a otra EPS  8%      | Ana López      |
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 32651  |35           |2426      | 2015-05-05T00:00:00.000Z | 15  | Usuarios Colsanitas o Medisanitas afiliados a otra EPS  8%      | Ana López      |
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 52584  |35           |2426      | 2009-05-05T00:00:00.000Z | 15  | Usuarios Colsanitas o Medisanitas afiliados a otra EPS  8%      | Ana López      |
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 48590  |35           |2426      | 1999-05-05T00:00:00.000Z | 15  | Usuarios Colsanitas o Medisanitas afiliados a otra EPS  8%      | Ana López      |
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 50135  |35           |2426      | 1963-05-05T00:00:00.000Z | 15  | Usuarios Colsanitas o Medisanitas afiliados a otra EPS  8%      | Ana López      |



  @Verificar_Delete_Medisanitas @RegressionPND
  Scenario Outline: Delete Medisanitas
    And el colaborador actualiza la fecha de nacimiento del familiar con "<idFamiliar>", "<birthDate>" y "<eps>"
    Then la respuesta del API debe ser exitosamente para la actualización del familiar con "<idFamiliar>"
    When el selecciona el "<servicio>", "<categoria>" y selecciona la "<entidad>"
    And el colaborador desactiva el beneficio "<producto>", "<metodoPago>"
    And el colaborador desactiva el beneficio "<producto>", "<metodoPago>" para el familiar "<nombreFamiliar>"++
    Then la plataforma muestra el "<producto>" disponible y la respectiva "<tarifa>" del producto
    When el colaborador confirma afiliación familiar

    Examples:
      | servicio | categoria            | entidad    | producto    | metodoPago          | tarifa | idColaborador | idFamiliar | birthDate                | eps | condicion | nombreFamiliar |
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Descuento de nómina | 247695 |35           |2426      | 1990-05-05T00:00:00.000Z | 15  | Plena     | Ana López      |