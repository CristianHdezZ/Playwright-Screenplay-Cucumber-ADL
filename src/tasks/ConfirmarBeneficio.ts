import { Task, Wait, Duration } from "@serenity-js/core";
import { Click, Scroll } from "@serenity-js/web";
import { VerificarTarifasPage } from "../ui/VerificarTarifasPage";


export class ConfirmarBeneficio {
  static now() {
    return Task.where(
      "#actor confirma el beneficio seleccionado",

      Wait.for(Duration.ofSeconds(2)),
      Scroll.to(VerificarTarifasPage.BTN_CONFIRMAR_BENEFICIO),
      Click.on(VerificarTarifasPage.BTN_CONFIRMAR_BENEFICIO),
      Wait.for(Duration.ofSeconds(5)),
      Click.on(VerificarTarifasPage.BTN_FINALIZAR_ACTIVACION),
      Wait.for(Duration.ofSeconds(3))

    );
  }
}
