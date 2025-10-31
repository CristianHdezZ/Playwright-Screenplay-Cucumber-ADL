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
    Then la respuesta del API debe ser exitosamente para la actualización del colaborador con "<Id>"
    And el selecciona el "<servicio>", "<categoria>" y selecciona la "<entidad>"
    And el colaborador activa el beneficio "<producto>", "<metodoPago>"
    Then la plataforma muestra el "<producto>" disponible y la respectiva "<tarifa>" del producto

    Examples:
      | servicio | categoria        | entidad | producto | metodoPago | tarifa | Id | birthDate                | eps | condicion |
      | Salud    | Pólizas de salud | Sura    | Global   | Bolsa      | 322560 | 5  | 2007-05-05T00:00:00.000Z | 13  | Plena     |
  # | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 446482  | 5  | 2005-05-05T00:00:00.000Z | 13  | Plena       |
  # | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 518064  | 5  | 1983-05-05T00:00:00.000Z | 13  | Plena       |
  # | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 690248  | 5  | 1973-05-05T00:00:00.000Z | 13  | Plena       |
  # | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 1607986 | 5  | 1964-05-05T00:00:00.000Z | 13  | Plena       |
  # | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 310590  | 5  | 2007-01-27T00:00:00.000Z | 15  | Simulteidad |
  # | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 434512  | 5  | 1990-01-27T00:00:00.000Z | 15  | Simulteidad |
  # | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 506094  | 5  | 1984-01-27T00:00:00.000Z | 15  | Simulteidad |
  # | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 678278  | 5  | 1974-01-27T00:00:00.000Z | 15  | Simulteidad |
  # | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 1596016 | 5  | 1965-01-27T00:00:00.000Z | 15  | Simulteidad |
  # | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 213464  | 5  | 2007-01-27T00:00:00.000Z | 13  | Plena       |
  # | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 355243  | 5  | 1990-01-27T00:00:00.000Z | 13  | Plena       |
  # | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 412197  | 5  | 1984-01-27T00:00:00.000Z | 13  | Plena       |
  # | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 628458  | 5  | 1974-01-27T00:00:00.000Z | 13  | Plena       |
  # | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 1295229 | 5  | 1965-01-27T00:00:00.000Z | 13  | Plena       |
  # | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 201494  | 5  | 2007-01-27T00:00:00.000Z | 15  | Simulteidad |
  # | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 343273  | 5  | 1990-01-27T00:00:00.000Z | 15  | Simulteidad |
  # | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 400227  | 5  | 1984-01-27T00:00:00.000Z | 15  | Simulteidad |
  # | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 616488  | 5  | 1974-01-27T00:00:00.000Z | 15  | Simulteidad |
  # | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 1283259 | 5  | 1965-01-27T00:00:00.000Z | 15  | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 384300  | 5  | 2011-05-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 384300  | 5  | 2010-05-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 384300  | 5  | 1964-05-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1234590 | 5  | 1960-05-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1340535 | 5  | 1954-05-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1340535 | 5  | 1950-05-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1563660 | 5  | 1949-05-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1563660 | 5  | 1945-05-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1563660 | 5  | 1940-05-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1563660 | 5  | 1934-05-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 363300  | 5  | 2011-05-27T00:00:00.000Z | 13  | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 363300  | 5  | 2010-05-27T00:00:00.000Z | 13  | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 363300  | 5  | 1964-05-27T00:00:00.000Z | 13  | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1213590 | 5  | 1960-05-27T00:00:00.000Z | 13  | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1319535 | 5  | 1954-05-27T00:00:00.000Z | 13  | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1542660 | 5  | 1949-05-27T00:00:00.000Z | 13  | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1542660 | 5  | 1945-05-27T00:00:00.000Z | 13  | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1542660 | 5  | 1940-05-27T00:00:00.000Z | 13  | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1542660 | 5  | 1935-05-27T00:00:00.000Z | 13  | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 247695  | 5  | 2011-01-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 247695  | 5  | 2010-01-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 247695  | 5  | 1964-01-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 824775  | 5  | 1960-01-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 896595  | 5  | 1954-01-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1115310 | 5  | 1950-01-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1115310 | 5  | 1945-01-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1115310 | 5  | 1940-01-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1115310 | 5  | 1935-01-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 226695  | 5  | 2011-01-27T00:00:00.000Z | 13  | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 226695  | 5  | 2010-01-27T00:00:00.000Z | 13  | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 226695  | 5  | 1964-01-27T00:00:00.000Z | 13  | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 803775  | 5  | 1960-01-27T00:00:00.000Z | 13  | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 803775  | 5  | 1960-01-27T00:00:00.000Z | 13  | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 875595  | 5  | 1954-01-27T00:00:00.000Z | 13  | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1094310 | 5  | 1950-01-27T00:00:00.000Z | 13  | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1094310 | 5  | 1945-01-27T00:00:00.000Z | 13  | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1094310 | 5  | 1940-01-27T00:00:00.000Z | 13  | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1094310 | 5  | 1935-01-27T00:00:00.000Z | 13  | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colmédica  | Diamante    | Bolsa      | 474330  | 5  | 1990-01-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colmédica  | Diamante    | Bolsa      | 1416711 | 5  | 1960-01-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colmédica  | Diamante    | Bolsa      | 463158  | 5  | 1990-01-27T00:00:00.000Z | 1   | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colmédica  | Diamante    | Bolsa      | 1405539 | 5  | 1960-01-27T00:00:00.000Z | 1   | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colmédica  | Zafiro      | Bolsa      | 402642  | 5  | 1990-01-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colmédica  | Zafiro      | Bolsa      | 1183226 | 5  | 1960-01-27T00:00:00.000Z | 15  | Plena       |
  # | Salud    | Medicinas prepagadas | Colmédica  | Zafiro      | Bolsa      | 391470  | 5  | 1990-01-27T00:00:00.000Z | 1   | Simulteidad |
  # | Salud    | Medicinas prepagadas | Colmédica  | Zafiro      | Bolsa      | 1134883 | 5  | 1960-01-27T00:00:00.000Z | 1   | Simulteidad |
  # | Salud    | Medicinas prepagadas | Emermédica | Emermédica  | Bolsa      | 44065   | 5  | 1960-01-27T00:00:00.000Z | 1   | Simulteidad |

  @Verificar_Tarifas_Productos_Familiar
  Scenario Outline: Verificar tarifas de productos para Familiar
    And el colaborador actualiza la fecha de nacimiento del familiar con "<Id>", "<birthDate>" y "<eps>"
    Then la respuesta del API debe ser exitosamente para la actualización del familiar con "<Id>"
    And el selecciona el "<servicio>", "<categoria>" y selecciona la "<entidad>"
    And el colaborador activa el beneficio "<producto>", "<metodoPago>" para el familiar "<nombreFamiliar>"
    Then la plataforma muestra el "<producto>" disponible y la respectiva "<tarifa>" del producto

    Examples:
      | servicio | categoria        | entidad | producto | metodoPago | tarifa | Id   | birthDate                | eps | condicion | nombreFamiliar |
      | Salud    | Pólizas de salud | Sura    | Global   | Bolsa      | 322560 | 2797 | 2007-05-05T00:00:00.000Z | 13  | Plena     | Ana López      |
  # | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 446482  | 2797 | 2005-05-05T00:00:00.000Z | 13  | Plena       | Ana López      |
  # | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 518064  | 2797 | 1983-05-05T00:00:00.000Z | 13  | Plena       | Ana López      |
  # | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 690248  | 2797 | 1973-05-05T00:00:00.000Z | 13  | Plena       | Ana López      |
  # | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 1607986 | 2797 | 1964-05-05T00:00:00.000Z | 13  | Plena       | Ana López      |
  # | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 310590  | 2797 | 2007-01-27T00:00:00.000Z | 15  | Simulteidad | Ana López      |
  # | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 434512  | 2797 | 1990-01-27T00:00:00.000Z | 15  | Simulteidad | Ana López      |
  # | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 506094  | 2797 | 1984-01-27T00:00:00.000Z | 15  | Simulteidad | Ana López      |
  # | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 678278  | 2797 | 1974-01-27T00:00:00.000Z | 15  | Simulteidad | Ana López      |
  # | Salud    | Pólizas de salud     | Sura       | Global      | Bolsa      | 1596016 | 2797 | 1965-01-27T00:00:00.000Z | 15  | Simulteidad | Ana López      |
  # | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 213464  | 2797 | 2007-01-27T00:00:00.000Z | 13  | Plena       | Ana López      |
  # | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 355243  | 2797 | 1990-01-27T00:00:00.000Z | 13  | Plena       | Ana López      |
  # | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 412197  | 2797 | 1984-01-27T00:00:00.000Z | 13  | Plena       | Ana López      |
  # | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 628458  | 2797 | 1974-01-27T00:00:00.000Z | 13  | Plena       | Ana López      |
  # | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 1295229 | 2797 | 1965-01-27T00:00:00.000Z | 13  | Plena       | Ana López      |
  # | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 201494  | 2797 | 2007-01-27T00:00:00.000Z | 15  | Simulteidad | Ana López      |
  # | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 343273  | 2797 | 1990-01-27T00:00:00.000Z | 15  | Simulteidad | Ana López      |
  # | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 400227  | 2797 | 1984-01-27T00:00:00.000Z | 15  | Simulteidad | Ana López      |
  # | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 616488  | 2797 | 1974-01-27T00:00:00.000Z | 15  | Simulteidad | Ana López      |
  # | Salud    | Pólizas de salud     | Sura       | Clásica     | Bolsa      | 1283259 | 2797 | 1965-01-27T00:00:00.000Z | 15  | Simulteidad | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 384300  | 2797 | 2011-05-27T00:00:00.000Z | 15  | Plena       | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 384300  | 2797 | 2010-05-27T00:00:00.000Z | 15  | Plena       | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 384300  | 2797 | 1964-05-27T00:00:00.000Z | 15  | Plena       | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1234590 | 2797 | 1960-05-27T00:00:00.000Z | 15  | Plena       | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1340535 | 2797 | 1954-05-27T00:00:00.000Z | 15  | Plena       | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1340535 | 2797 | 1950-05-27T00:00:00.000Z | 15  | Plena       | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1563660 | 2797 | 1949-05-27T00:00:00.000Z | 15  | Plena       | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1563660 | 2797 | 1945-05-27T00:00:00.000Z | 15  | Plena       | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1563660 | 2797 | 1940-05-27T00:00:00.000Z | 15  | Plena       | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1563660 | 2797 | 1934-05-27T00:00:00.000Z | 15  | Plena       | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 363300  | 2797 | 2011-05-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 363300  | 2797 | 2010-05-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 363300  | 2797 | 1964-05-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1213590 | 2797 | 1960-05-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1319535 | 2797 | 1954-05-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1542660 | 2797 | 1949-05-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1542660 | 2797 | 1945-05-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1542660 | 2797 | 1940-05-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Integral    | Bolsa      | 1542660 | 2797 | 1935-05-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 247695  | 2797 | 2011-01-27T00:00:00.000Z | 15  | Plena       | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 247695  | 2797 | 2010-01-27T00:00:00.000Z | 15  | Plena       | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 247695  | 2797 | 1964-01-27T00:00:00.000Z | 15  | Plena       | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 824775  | 2797 | 1960-01-27T00:00:00.000Z | 15  | Plena       | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 896595  | 2797 | 1954-01-27T00:00:00.000Z | 15  | Plena       | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1115310 | 2797 | 1950-01-27T00:00:00.000Z | 15  | Plena       | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1115310 | 2797 | 1945-01-27T00:00:00.000Z | 15  | Plena       | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1115310 | 2797 | 1940-01-27T00:00:00.000Z | 15  | Plena       | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1115310 | 2797 | 1935-01-27T00:00:00.000Z | 15  | Plena       | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 226695  | 2797 | 2011-01-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 226695  | 2797 | 2010-01-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 226695  | 2797 | 1964-01-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 803775  | 2797 | 1960-01-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 875595  | 2797 | 1954-01-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1094310 | 2797 | 1950-01-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1094310 | 2797 | 1945-01-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1094310 | 2797 | 1940-01-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |
  # | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 1094310 | 2797 | 1935-01-27T00:00:00.000Z | 13  | Simulteidad | Ana López      |



  @Verificar_Tarifas_PlanDental_Plena
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
      | servicio | categoria       | entidad    | producto    | metodoPago | tarifa | idColaborador | idFamiliar | birthDate                | eps | condicion | nombreFamiliar |
      #| Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 19110  | 5             | 2797       | 2019-05-05T00:00:00.000Z | 15  | Plena     | Ana López      |
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 35490  | 5             | 2797       | 2015-05-05T00:00:00.000Z | 15  | Plena     | Ana López      |
  # | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa | 56070  | 5             | 2797       | 2009-05-05T00:00:00.000Z | 15  | Plena                                     |Ana López      |
  # | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa | 52815  | 5             | 2797       | 1999-05-05T00:00:00.000Z | 15  | Plena                                     |Ana López      |
  # | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa | 54495  | 5             | 2797       | 1963-05-05T00:00:00.000Z | 15  | Plena                                     |Ana López      |
  # | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa | 18155  | 5             | 2797       | 2019-05-05T00:00:00.000Z | 13  | Usuarios afiliados solo a EPS Sanitas  5% |Ana López      |
  # | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa | 33716  | 5             | 2797       | 2015-05-05T00:00:00.000Z | 13  | Usuarios afiliados solo a EPS Sanitas  5% |Ana López      |
  # | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa | 53267  | 5             | 2797       | 2009-05-05T00:00:00.000Z | 13  | Usuarios afiliados solo a EPS Sanitas  5% |Ana López      |
  # | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa | 50174  | 5             | 2797       | 1999-05-05T00:00:00.000Z | 13  | Usuarios afiliados solo a EPS Sanitas  5% |Ana López      |
  # | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa | 51770  | 5             | 2797       | 1963-05-05T00:00:00.000Z | 13  | Usuarios afiliados solo a EPS Sanitas  5% |Ana López      |


  @Verificar_Add_Medisanitas @smoke
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
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Bolsa      | 247695 | 5             | 2797       | 1990-05-05T00:00:00.000Z | 15  | Plena     | Ana López      |


  @Verificar_Tarifas_PlanDental_ConColsanitas_Medisanitas
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
      | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa      | 17199  | 5             | 2797       | 2019-05-05T00:00:00.000Z | 13  | Usuarios Colsanitas o Medisanitas afiliados a EPS Sanitas   10% | Ana López      |
  # | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa | 31941  | 5             | 2797       | 2015-05-05T00:00:00.000Z | 13  | Usuarios Colsanitas o Medisanitas afiliados a EPS Sanitas   10% | Ana López      |
  # | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa | 50463  | 5             | 2797       | 2009-05-05T00:00:00.000Z | 13  | Usuarios Colsanitas o Medisanitas afiliados a EPS Sanitas   10% | Ana López      |
  # | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa | 47534  | 5             | 2797       | 1999-05-05T00:00:00.000Z | 13  | Usuarios Colsanitas o Medisanitas afiliados a EPS Sanitas   10% | Ana López      |
  # | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa | 49046  | 5             | 2797       | 1963-05-05T00:00:00.000Z | 13  | Usuarios Colsanitas o Medisanitas afiliados a EPS Sanitas   10% | Ana López      |
  # | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa | 17581  | 5             | 2797       | 2019-05-05T00:00:00.000Z | 15  | Usuarios Colsanitas o Medisanitas afiliados a otra EPS  8%      | Ana López      |
  # | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa | 32651  | 5             | 2797       | 2015-05-05T00:00:00.000Z | 15  | Usuarios Colsanitas o Medisanitas afiliados a otra EPS  8%      | Ana López      |
  # | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa | 52584  | 5             | 2797       | 2009-05-05T00:00:00.000Z | 15  | Usuarios Colsanitas o Medisanitas afiliados a otra EPS  8%      | Ana López      |
  # | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa | 48590  | 5             | 2797       | 1999-05-05T00:00:00.000Z | 15  | Usuarios Colsanitas o Medisanitas afiliados a otra EPS  8%      | Ana López      |
  # | Salud    | Anexos de salud | Colsanitas | Plan dental | Bolsa | 50135  | 5             | 2797       | 1963-05-05T00:00:00.000Z | 15  | Usuarios Colsanitas o Medisanitas afiliados a otra EPS  8%      | Ana López      |



  @Verificar_Delete_Medisanitas
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
      | Salud    | Medicinas prepagadas | Colsanitas | Medisanitas | Descuento de nómina | 247695 | 5             | 2797       | 1990-05-05T00:00:00.000Z | 15  | Plena     | Ana López      |