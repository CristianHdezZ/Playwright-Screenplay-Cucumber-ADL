import { Task, Wait, Duration } from '@serenity-js/core';
import { Click, Select, Scroll } from '@serenity-js/web';
import { VerificarTarifasPage } from '../ui/VerificarTarifasPage';

export class ActivarBeneficio {
  static with(producto: string, metodoPago: string) {
    return Task.where(`#actor activa el beneficio`,
      Wait.for(Duration.ofSeconds(3)), // espera general para asegurar renderizado
      Scroll.to(VerificarTarifasPage.CARD_PRODUCTO(producto)),
      Click.on(VerificarTarifasPage.CARD_PRODUCTO(producto)),
      Wait.for(Duration.ofSeconds(2)),
      Select.option(metodoPago).from(VerificarTarifasPage.SELECT_METODO_PAGO),    
      Wait.for(Duration.ofSeconds(2)),  
      Click.on(VerificarTarifasPage.BTN_ACTIVAR_BENEFICIO),
      Wait.for(Duration.ofSeconds(3))
    );
  }
}
