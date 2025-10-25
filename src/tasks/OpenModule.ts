import { Task, Interaction, Wait, Duration } from '@serenity-js/core';
import { Click } from '@serenity-js/web';
import { HomePage } from '../ui/HomePage';


export class OpenModule {
    static called(nombreModulo: string) {
        Wait.for(Duration.ofSeconds(56));
        return Task.where(`#open the module ${nombreModulo}`,
            Click.on(HomePage.BUTTON_MODULO(nombreModulo)),

            // Espera opcional para asegurar carga completa
            Interaction.where(`#wait 10 seconds`, async () => {
                await new Promise(resolve => setTimeout(resolve, 10000));
            }),
            
        );        
    }
}