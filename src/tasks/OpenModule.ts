import { Task, Interaction, Wait, Duration } from '@serenity-js/core';
import { Click, isVisible } from '@serenity-js/web';
import { HomePage } from '../ui/HomePage';


export class OpenModule {
    static called(nombreModulo: string) {
        Wait.for(Duration.ofSeconds(25));
        return Task.where(`#open the module ${nombreModulo}`,
            Wait.until(HomePage.BUTTON_MODULO(nombreModulo), isVisible()),
            Wait.for(Duration.ofSeconds(10)),
            Click.on(HomePage.BUTTON_MODULO(nombreModulo)),

            // Espera opcional para asegurar carga completa
            Interaction.where(`#wait 10 seconds`, async () => {
                await new Promise(resolve => setTimeout(resolve, 10000));
            }),
            
        );        
    }
}