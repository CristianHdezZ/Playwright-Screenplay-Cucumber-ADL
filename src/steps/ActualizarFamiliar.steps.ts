import { When, Then } from '@cucumber/cucumber';
import { Actor, actorInTheSpotlight } from "@serenity-js/core";
import { Ensure, equals} from "@serenity-js/assertions";
import { SeleccionarFamiliar } from '../tasks/SeleccionarFamiliar';
import { ActualizarFamiliar } from '../tasks/ActualizarFamiliar';
import { ReviewMensajeExitoUpdateFamiliar } from '../questions/ReviewMensajeExitoUpdateFamiliar';

When('{pronombre} usuario selecciona el familiar con número de documento {string}', { timeout: 40000 },
  async (actor: Actor, numeroDocumento: string) =>{
    await actor.attemptsTo(SeleccionarFamiliar.with(numeroDocumento)); 
  }   
);

When('{pronombre} usuario actualiza el formulario con los siguientes datos', { timeout: 40000 },
  async (actor: Actor, dataTable) => {
   // Convierte la tabla en un array de objetos
      const rows = dataTable.hashes();
  
      // Recorre las filas (por si se agregan varios familiares)
      for (const data of rows) {
        await actorInTheSpotlight().attemptsTo(
          ActualizarFamiliar.withData(data) // Usar solo la primera fila
        );
      }  
});

Then('{pronombre} sistema debe mostrar un mensaje de éxito de la actualización',{ timeout: 40000 },
  async (actor: Actor) => {
    await actorInTheSpotlight().attemptsTo(
      // Se usa la Question para validar visibilidad y texto
      Ensure.that(ReviewMensajeExitoUpdateFamiliar.isVisibleSuccessMessage, equals(true))
    );
  }   
    
);
