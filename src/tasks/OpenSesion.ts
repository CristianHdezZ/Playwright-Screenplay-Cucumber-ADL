import { Task, Interaction } from '@serenity-js/core';
import { Click } from '@serenity-js/web';
import { RegistrarFamiliarPage } from '../ui/RegistrarFamiliarPage';


export class OpenSesion {
    static called(nombreSesion: string) {
        return Task.where(`#open the module ${nombreSesion}`,
            Click.on(RegistrarFamiliarPage.BUTTON_MI_FAMILIA(nombreSesion)),

            // Espera opcional para asegurar carga completa
            Interaction.where(`#wait 5 seconds`, async () => {
                await new Promise(resolve => setTimeout(resolve, 5000));
            }),
            
        );        
    }
}