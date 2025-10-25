import { When, Then } from '@cucumber/cucumber';
import { Actor, actorInTheSpotlight, Wait, Duration } from '@serenity-js/core';
import { RegistrarInmueble } from '../tasks/RegistrarInmueble';
import { CompletarRegistro } from '../tasks/CompletarRegistro';
import { ReviewRegistrarFamiliar } from '../questions/ReviewRegistrarFamiliar';
import { Ensure, equals } from '@serenity-js/assertions';
import { InmuebleData } from '../models/InmuebleData';
import { ExcelReader } from '../utils/ExcelReader';
import { ValidarCamposNumericos } from '../tasks/ValidarCamposNumericosInmueble';
import { RegistrarInmueblePage } from '../ui/RegistrarInmueblePage';

When('{pronombre} usuario completa el formulario de inmueble con los siguientes datos', 
{ timeout: 40000 }, async (actor: Actor, dataTable) => {
    const [data] = dataTable.hashes() as InmuebleData[];
    await actorInTheSpotlight().attemptsTo(
        RegistrarInmueble.withData(data)
    );
});

// ⚙️ Step para cargar y registrar inmuebles desde archivo Excel
When(
    '{pronombre} usuario registra todos los inmuebles desde el archivo {string}',
    { timeout: 120000 },
    async (actor: Actor, filePath: string) => {
        // Leer datos desde el Excel
        const inmuebles: InmuebleData[] = ExcelReader.readSheet<InmuebleData>(filePath, 'Inmuebles');
        console.log(`🏠 Cargando ${inmuebles.length} inmuebles desde ${filePath}`);

        // Iterar sobre cada inmueble
        for (const data of inmuebles) {
            console.log("📋 Registrando inmueble:", data);
            await actor.attemptsTo(RegistrarInmueble.withData(data));

            // Clic en registrar
            await actor.attemptsTo(CompletarRegistro.conFomularioLleno());

            // Esperar y validar mensaje de éxito
            await actor.attemptsTo(Wait.for(Duration.ofSeconds(5)));
            await actor.attemptsTo(
                Ensure.that(ReviewRegistrarFamiliar.isVisibleSuccessMessage, equals(true))
            );
        }
    }
);

When(
  '{pronombre} usuario intenta ingresar valores no numéricos en los campos del formulario de inmueble',
  async (actor, dataTable) => {
    const [data] = dataTable.hashes();
    await actorInTheSpotlight().attemptsTo(
      ValidarCamposNumericos.withValues(data)
    );
  }
);

Then(
  '{pronombre} sistema no debe permitir ingresar letras en dichos campos',
  async (actor) => {
    await actorInTheSpotlight().attemptsTo(
      Ensure.that(RegistrarInmueblePage.INPUT_INTERIOR.value(), equals('')),
      Ensure.that(RegistrarInmueblePage.INPUT_TORRE.value(), equals('')),
      Ensure.that(RegistrarInmueblePage.INPUT_APARTAMENTO.value(), equals(''))
    );
  }
);

