import { Task, Interaction, actorInTheSpotlight } from '@serenity-js/core';
import { Enter, Click, Scroll } from '@serenity-js/web';
import { RegistrarInmueblePage } from '../ui/RegistrarInmueblePage';
import { Ensure, equals } from '@serenity-js/assertions';

export class ValidarCamposNumericos {

    static withValues(data: { interior: string; torre: string; apartamento: string }) {
        return Task.where(`#actor intenta ingresar valores no numéricos en los campos`,

            Scroll.to(RegistrarInmueblePage.BTN_ADD_INMUEBLE),
            Click.on(RegistrarInmueblePage.BTN_ADD_INMUEBLE),
            
            // Crear Interactions separadas usando Interaction.from
            Interaction.where(`#actor intenta ingresar valores no numéricos`, async actor => {
                const campos = [
                    { value: data.interior, element: RegistrarInmueblePage.INPUT_INTERIOR, nombre: 'Interior' },
                    { value: data.torre, element: RegistrarInmueblePage.INPUT_TORRE, nombre: 'Torre' },
                    { value: data.apartamento, element: RegistrarInmueblePage.INPUT_APARTAMENTO, nombre: 'Apartamento' }
                ];

                for (const campo of campos) {
                    try {
                        await actorInTheSpotlight().attemptsTo(
                            Enter.theValue(campo.value).into(campo.element)
                        );
                        console.log(`✅ Intentó ingresar '${campo.value}' en ${campo.nombre}`);
                    } catch (error: any) {
                        console.log(`❌ No se puede ingresar '${campo.value}' en ${campo.nombre}: ${error.message}`);
                    }
                }
            }),

            // Validaciones posteriores
            Ensure.that(RegistrarInmueblePage.INPUT_INTERIOR.value(), equals('')),
            Ensure.that(RegistrarInmueblePage.INPUT_TORRE.value(), equals('')),
            Ensure.that(RegistrarInmueblePage.INPUT_APARTAMENTO.value(), equals('')),
        );
    }
}
