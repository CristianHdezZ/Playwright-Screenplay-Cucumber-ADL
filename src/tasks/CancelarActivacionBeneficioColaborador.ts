import { Task, Wait, Duration } from "@serenity-js/core";
import { Click, Scroll, isVisible } from "@serenity-js/web";
import { RegistrarFamiliarPage } from "../ui/RegistrarFamiliarPage";
import { Ensure } from "@serenity-js/assertions";

export class CancelarActivacionBeneficioColaborador {
  static with() {
    return Task.where(
      "#actor desactiva el beneficios del colaborador",

      // 1️⃣ Cancelar beneficio familiar (si aplica)
      Wait.for(Duration.ofSeconds(2)),
      Scroll.to(RegistrarFamiliarPage.BTN_CANCELAR_FAMILIAR),
      Ensure.that(RegistrarFamiliarPage.BTN_CANCELAR_FAMILIAR, isVisible()),
      Click.on(RegistrarFamiliarPage.BTN_CANCELAR_FAMILIAR),
      Wait.for(Duration.ofSeconds(5)),

      // 2️⃣ Regresar al listado principal
      Scroll.to(RegistrarFamiliarPage.BTN_REGRESAR),
      Ensure.that(RegistrarFamiliarPage.BTN_REGRESAR, isVisible()),
      Click.on(RegistrarFamiliarPage.BTN_REGRESAR),
      Wait.for(Duration.ofSeconds(5)),

      // 3️⃣ Eliminar beneficio del colaborador
      Scroll.to(RegistrarFamiliarPage.BTN_ELIMINAR_BENEFICIO_COLABORADOR),
      Ensure.that(
        RegistrarFamiliarPage.BTN_ELIMINAR_BENEFICIO_COLABORADOR,
        isVisible()
      ),
      Click.on(RegistrarFamiliarPage.BTN_ELIMINAR_BENEFICIO_COLABORADOR),
      Wait.for(Duration.ofSeconds(5)),

      // 4️⃣ Aceptar eliminación (primer confirmación)
      Scroll.to(RegistrarFamiliarPage.BTN_ACEPTAR_ELIMINAR_BENEFICIO),
      Ensure.that(
        RegistrarFamiliarPage.BTN_ACEPTAR_ELIMINAR_BENEFICIO,
        isVisible()
      ),
      Click.on(RegistrarFamiliarPage.BTN_ACEPTAR_ELIMINAR_BENEFICIO),
      Wait.for(Duration.ofSeconds(10)),

      // 5️⃣ Confirmar eliminación final
      Scroll.to(RegistrarFamiliarPage.BTN_ACEPTAR_ELIMINACION_FINAL),
      Ensure.that(
        RegistrarFamiliarPage.BTN_ACEPTAR_ELIMINACION_FINAL,
        isVisible()
      ),

      Click.on(RegistrarFamiliarPage.BTN_ACEPTAR_ELIMINACION_FINAL),
      Wait.for(Duration.ofSeconds(5))
    );
  }
}
