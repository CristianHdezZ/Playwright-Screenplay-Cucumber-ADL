import { When } from '@cucumber/cucumber';
import { Actor, actorInTheSpotlight, Wait, Duration } from "@serenity-js/core";
import { RegistrarMascota } from '../tasks/RegistrarMascota';
import { MascotaData } from '../models/MascotaData';
import { ExcelReader } from '../utils/ExcelReader';
import { CompletarRegistro } from "../tasks/CompletarRegistro";
import { ReviewRegistrarFamiliar } from "../questions/ReviewRegistrarFamiliar";
import { Ensure, equals } from "@serenity-js/assertions";

When('{pronombre} usuario completa el formulario de mascota con los siguientes datos',{ timeout: 40000 }, async (actor: Actor,dataTable) => {
    const [data] = dataTable.hashes();
    await actorInTheSpotlight().attemptsTo(
        RegistrarMascota.withData(data)
    );
});

// ⚙️ Step para cargar y registrar mascotas desde archivo Excel
When(
  '{pronombre} usuario registra todas las mascotas desde el archivo {string}',
  { timeout: 120000 }, // tiempo ampliado por seguridad
  async (actor: Actor, filePath: string) => {
    // 1️⃣ Leer datos desde el Excel
    const mascotas: MascotaData[] = ExcelReader.readSheet<MascotaData>(filePath, 'Mascotas');
    console.log(`📘 Cargando ${mascotas.length} mascotas desde ${filePath}`);

    // 2️⃣ Iterar sobre cada registro
    for (const data of mascotas) {
      console.log("🐶 Registrando mascota:", data);

      // 📝 Completar formulario con datos de la mascota
      await actor.attemptsTo(RegistrarMascota.withData(data));

      // 🖱️ Hacer clic en "Registrar"
      console.log("🖱️ Haciendo clic en Registrar");
      await actor.attemptsTo(CompletarRegistro.conFomularioLleno());

      // ⏳ Esperar antes de validar mensaje de éxito
      console.log("⏳ Esperando antes de validar mensaje de éxito");
      await actor.attemptsTo(Wait.for(Duration.ofSeconds(5)));

      // ✅ Validar mensaje de éxito
      console.log("✅ Validando mensaje de éxito");
      await actor.attemptsTo(
        Ensure.that(ReviewRegistrarFamiliar.isVisibleSuccessMessage, equals(true))
      );
    }

  }
);


