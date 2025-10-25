import { Task, Interaction, Wait, Duration } from '@serenity-js/core';
import { Click } from '@serenity-js/web';
import { HomePage } from '../ui/HomePage';


export class OpenModule {
    static called(nombreModulo: string) {
        Wait.for(Duration.ofSeconds(120));
        return Task.where(`#open the module ${nombreModulo}`,
            Click.on(HomePage.BUTTON_MODULO(nombreModulo)),

            // Espera opcional para asegurar carga completa
            Interaction.where(`#wait 15 seconds`, async () => {
                await new Promise(resolve => setTimeout(resolve, 15000));
            }),
            
        );        
    }
}