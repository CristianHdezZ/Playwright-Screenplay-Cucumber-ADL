import { Task, Interaction } from "@serenity-js/core";
import { Enter, Click, Select } from "@serenity-js/web";
import { RegistrarFamiliarPage } from "../ui/RegistrarFamiliarPage";
import { FamiliarData } from "../models/FamiliarData";

export class ActualizarFamiliar {
  static withData(datos: FamiliarData) {
    console.log("📋 Filling out the familiar registration form with datos:");
    console.log(`Primer Nombre: ${datos.primerNombre}`);
    console.log(`Segundo Nombre: ${datos.segundoNombre}`);
    console.log(`Primer Apellido: ${datos.primerApellido}`);
    console.log(`Segundo Apellido: ${datos.segundoApellido}`);
    console.log(`Tipo Documento: ${datos.tipoDocumento}`);
    console.log(`Número Documento: ${datos.numeroDocumento}`);
    console.log(`Fecha Nacimiento: ${datos.fechaNacimiento}`);

    return Task.where(
      `#actor actualiza los datos del familiar`,
      Enter.theValue(datos.primerNombre).into(
        RegistrarFamiliarPage.PRIMER_NOMBRE
      ),
      Enter.theValue(datos.segundoNombre).into(
        RegistrarFamiliarPage.SEGUNDO_NOMBRE
      ),
      Enter.theValue(datos.primerApellido).into(
        RegistrarFamiliarPage.PRIMER_APELLIDO
      ),
      Enter.theValue(datos.segundoApellido).into(
        RegistrarFamiliarPage.SEGUNDO_APELLIDO
      ),
      Select.option(datos.eps).from(RegistrarFamiliarPage.EPS),
      Select.option(datos.departamento).from(
        RegistrarFamiliarPage.DEPARTAMENTO
      ),
      Select.option(datos.ciudad).from(RegistrarFamiliarPage.CIUDAD),
      Click.on(RegistrarFamiliarPage.BTN_ACTUALIZAR),

      // Espera opcional para asegurar carga completa
      Interaction.where(`#wait 5 seconds`, async () => {
        await new Promise(resolve => setTimeout(resolve, 5000));      
      }),
    );
  }
}
