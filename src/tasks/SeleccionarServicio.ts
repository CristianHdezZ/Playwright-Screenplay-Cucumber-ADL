import { Task, Wait, Duration } from '@serenity-js/core';
import { Click, Scroll, isVisible } from '@serenity-js/web';
import { VerificarTarifasPage } from '../ui/VerificarTarifasPage';

export class SeleccionarServicio {
  static with(servicio: string, categoria: string, entidad: string) {
   console.log(`⚙️ Seleccionando servicio: ${servicio}, categoría: ${categoria}, entidad: ${entidad}`);

        return Task.where(`#actor selecciona el servicio "${servicio}", la categoría "${categoria}" y la entidad "${entidad}"`,
            Scroll.to(VerificarTarifasPage.CARD_SERVICIO(servicio)),
            Click.on(VerificarTarifasPage.CARD_SERVICIO(servicio)),

            Wait.upTo(Duration.ofSeconds(5)).until(VerificarTarifasPage.CARD_CATEGORIA(categoria), isVisible()),

            Scroll.to(VerificarTarifasPage.CARD_CATEGORIA(categoria)),
            Click.on(VerificarTarifasPage.CARD_CATEGORIA(categoria)),

            Wait.for(Duration.ofSeconds(3)), // espera general para asegurar renderizado
            Scroll.to(VerificarTarifasPage.CARD_ENTIDAD(entidad)),
            Wait.for(Duration.ofSeconds(3)),
            //Wait.upTo(Duration.ofSeconds(5)).until(VerificarTarifasPage.CARD_ENTIDAD(entidad), isVisible()),            
            Click.on(VerificarTarifasPage.CARD_ENTIDAD(entidad)),
            Wait.for(Duration.ofSeconds(6)),
        );
  }
}
