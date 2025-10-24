import { Task, Interaction } from '@serenity-js/core';
import { Click } from '@serenity-js/web';
import { RegistrarFamiliarPage } from '../ui/RegistrarFamiliarPage';

export class CompletarRegistro {

    static conFomularioLleno() {  
        return Task.where('#actor finaliza registro de un familiar',
            Click.on(RegistrarFamiliarPage.BTN_REGISTRAR),
             // Espera opcional para asegurar carga completa
            Interaction.where(`#wait 5 seconds`, async () => {
                await new Promise(resolve => setTimeout(resolve, 5000));
            }),
        );
    }
}