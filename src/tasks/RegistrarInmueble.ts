import { Task } from '@serenity-js/core';
import { Enter, Click, Select, Scroll } from '@serenity-js/web';
import { RegistrarInmueblePage } from '../ui/RegistrarInmueblePage';
import { InmuebleData } from '../models/InmuebleData';

export class RegistrarInmueble {
    static withData(data: InmuebleData) {
        console.log(`🏠 Registrando inmueble: ${data.direccion}`);
        return Task.where(`#actor completa el formulario de registro de inmueble`,            

            Scroll.to(RegistrarInmueblePage.BTN_ADD_INMUEBLE),
            Click.on(RegistrarInmueblePage.BTN_ADD_INMUEBLE),

            Enter.theValue(data.direccion).into(RegistrarInmueblePage.INPUT_DIRECCION),
            Select.option(data.departamento).from(RegistrarInmueblePage.SELECT_DEPARTAMENTO),
            Select.option(data.ciudad).from(RegistrarInmueblePage.SELECT_CIUDAD),
            Select.option(data.tipoInmueble).from(RegistrarInmueblePage.SELECT_TIPO_INMUEBLE),

            // Campos opcionales
            ...(data.nombreConjunto ? [Enter.theValue(data.nombreConjunto).into(RegistrarInmueblePage.INPUT_NOMBRE_CONJUNTO)] : []),
            ...(data.interior ? [Enter.theValue(data.interior).into(RegistrarInmueblePage.INPUT_INTERIOR)] : []),
            ...(data.torre ? [Enter.theValue(data.torre).into(RegistrarInmueblePage.INPUT_TORRE)] : []),
            ...(data.apartamento ? [Enter.theValue(data.apartamento).into(RegistrarInmueblePage.INPUT_APARTAMENTO)] : []),

            Select.option(data.conjunto).from(RegistrarInmueblePage.SELECT_CONJUNTO),
            Enter.theValue(data.yearConstruccion).into(RegistrarInmueblePage.INPUT_ANIOS_CONSTRUCCION),
            Enter.theValue(data.pisos).into(RegistrarInmueblePage.INPUT_PISOS),
        );
    }
}
