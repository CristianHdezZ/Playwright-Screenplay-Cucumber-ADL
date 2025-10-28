import { Task, Wait, Duration } from '@serenity-js/core';
import { Click, Select, Scroll } from '@serenity-js/web';
import { VerificarTarifasPage } from '../ui/VerificarTarifasPage';

export class ActivarBeneficioFamiliar {
  static with(producto: string, metodoPago: string, nombreFamiliar: string) {
    return Task.where(`#actor activa el beneficio de familiar ${producto} con método de pago ${metodoPago}`,
      Wait.for(Duration.ofSeconds(3)), // espera general para asegurar renderizado
      Scroll.to(VerificarTarifasPage.CARD_PRODUCTO(producto)),
      Click.on(VerificarTarifasPage.CARD_PRODUCTO(producto)),
      Wait.for(Duration.ofSeconds(10)),
      Click.on(VerificarTarifasPage.BTN_ADD_BENEFICIARIO),
      Wait.for(Duration.ofSeconds(8)),
      Select.option(metodoPago).from(VerificarTarifasPage.SELECT_METODO_PAGO_FAMILIAR(nombreFamiliar)),
      Wait.for(Duration.ofSeconds(5)),
      Click.on(VerificarTarifasPage.CHECKBOX_SELECT_BENEFITS_FAMILIAR(nombreFamiliar)),
      Wait.for(Duration.ofSeconds(5))
    );
  }
}