import { When, Then } from "@cucumber/cucumber";
import { Actor, actorInTheSpotlight, Wait, Duration, notes } from "@serenity-js/core";
import { OpenModule } from "../tasks/OpenModule";
import { Ensure, equals} from "@serenity-js/assertions";
import { ModuleVisibility } from "../questions/ModuleVisibility";
import { RegisterFamiliar } from "../tasks/RegisterFamiliar";
import { OpenSesion } from "../tasks/OpenSesion";
import { CompletarRegistro } from "../tasks/CompletarRegistro";
import { ReviewRegistrarFamiliar } from "../questions/ReviewRegistrarFamiliar";
import { ExcelReader } from "../utils/ExcelReader";



When(
  "{pronombre} usuario está en el módulo {string}",
  { timeout: 70000 },
  async (actor: Actor, modulo: string) => {
    console.log(`Navegando al módulo: ${modulo}`);
    // await actor.attemptsTo(
    //   Ensure.that(ModuleVisibility.of(modulo), equals(true))
    // );
    await actor.attemptsTo(OpenModule.called(modulo));
    
  }
);

When(
  "{pronombre} usuario está en el sesion {string}",
  { timeout: 40000 },
  async (actor: Actor, session: string) => {
    console.log(`Navegando al módulo: ${session}`);
    await actor.attemptsTo(OpenSesion.called(session));
  }
);

When(
  "{pronombre} usuario completa el formulario con los siguientes datos",
  { timeout: 40000 },
  async (actor: Actor, dataTable) => {
    // Convierte la tabla en un array de objetos
    const rows = dataTable.hashes();

    // Recorre las filas (por si se agregan varios familiares)
    for (const data of rows) {
      await actorInTheSpotlight().attemptsTo(
        RegisterFamiliar.withData(data) // Usar solo la primera fila
      );
    }
  }
);

// ⚙️ Step para cargar familiares desde archivo Excel o CSV
When(
  "{pronombre} usuario carga los familiares desde el archivo {string}",
  { timeout: 60000 },
  async (actor: Actor, filePath: string) => {
    const dataset = ExcelReader.readExcel("src/data/asegurados.xlsx");
    console.log(`📘 Cargando ${dataset.length} familiares desde ${filePath}`);
    
    

    for (const data of dataset) {
      console.log("🧍 Registrando asegurado:", data);
      

      // 1️⃣ Llenar formulario con datos del familiar
      await actor.attemptsTo(RegisterFamiliar.withData(data));

      // 2️⃣ Hacer clic en "Registrar"
      console.log("🖱️ Haciendo clic en Registrar");
      await actor.attemptsTo(CompletarRegistro.conFomularioLleno());

      // 3️⃣ Validar el mensaje de éxito
      console.log("✅ Validando mensaje de éxito");
      await actor.attemptsTo(
        Wait.for(Duration.ofSeconds(5)), // ⏱️ Espera 5 segundos antes de validar
        Ensure.that(ReviewRegistrarFamiliar.isVisibleSuccessMessage, equals(true))
      );

      
    }
  }
);

When(
  "{pronombre} usuario hace clic en Registrar",
  { timeout: 40000 },
  async (actor: Actor) => {
    console.log("Haciendo clic en Registrar");
    await actor.attemptsTo(CompletarRegistro.conFomularioLleno());
  }
);

Then(
  "{pronombre} sistema debe mostrar un mensaje de éxito",
  { timeout: 40000 },
  async (actor: Actor) => {
    await actorInTheSpotlight().attemptsTo(
      // Se usa la Question para validar visibilidad y texto
      Ensure.that(ReviewRegistrarFamiliar.isVisibleSuccessMessage, equals(true))
    );
  }
);
