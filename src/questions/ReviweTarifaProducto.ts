import { Question, AnswersQuestions, UsesAbilities, actorInTheSpotlight, Wait, Duration } from '@serenity-js/core';
import { PageElement, By, Scroll, isVisible, isEnabled, Click } from '@serenity-js/web';
import { Ensure } from '@serenity-js/assertions';

export class TarifaProducto {

  /**
   * Question para verificar la tarifa de un producto en el modal
   */
  public static of(nombreProducto: string) {
    return Question.about<string>(`la tarifa del producto ${nombreProducto}`, 
      async (actor: AnswersQuestions & UsesAbilities) => {

        const modalTexto = PageElement.located(By.xpath(`//app-modals//p[contains(.,'Has seleccionado')]`))
                                      .describedAs(`texto del modal con el valor de la tarifa`);

        const btnAceptar = PageElement.located(By.xpath(`//app-modals//button[contains(.,'Aceptar')]`))
                                      .describedAs('botón Aceptar del modal de confirmación');

        // Scroll y asegurarse que el modal sea visible
        await actorInTheSpotlight().attemptsTo(
          Wait.for(Duration.ofSeconds(2)),
          Scroll.to(modalTexto),
          Ensure.that(modalTexto, isVisible()),
          Ensure.that(modalTexto, isEnabled())
        );

        // Obtener el texto del modal
        const texto = await actor.answer(modalTexto.text());
        console.log(`💬 Texto del modal: ${texto}`);

        // Extraer el texto y convertir a número entero ignorando decimales        
        const tarifaExtraida = texto.match(/\$\s*([\d.]+),\d{2}/)?.[1].replace(/\./g, '') || '';
        console.log(`💰 Tarifa encontrada para ${nombreProducto}: ${tarifaExtraida}`);

        // Confirmar el modal
        await actorInTheSpotlight().attemptsTo(
          Scroll.to(btnAceptar),
          Ensure.that(btnAceptar, isVisible()),
          Ensure.that(btnAceptar, isEnabled()),
          //Click.on(btnAceptar),
          Wait.for(Duration.ofSeconds(2))
        );

        return tarifaExtraida;
      }
    );
  }
}
