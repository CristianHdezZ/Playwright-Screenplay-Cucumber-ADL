import { Task, Interaction, Wait, Duration } from '@serenity-js/core';
import { Click, isVisible, Scroll } from '@serenity-js/web';
import { HomePage } from '../ui/HomePage';


export class OpenModule {
    static called(nombreModulo: string) {
       
        return Task.where(`#open the module ${nombreModulo}`,           

            Wait.for(Duration.ofSeconds(8)), // espera general para asegurar renderizado
            Scroll.to(HomePage.BUTTON_MODULO(nombreModulo)),          
            Wait.until(HomePage.BUTTON_MODULO(nombreModulo), isVisible()),
            Click.on(HomePage.BUTTON_MODULO(nombreModulo)),
            // Espera opcional para asegurar carga completa
            Interaction.where(`#wait 5 seconds`, async () => {
                await new Promise(resolve => setTimeout(resolve, 5000));
            }),
            
        );        
    }
}