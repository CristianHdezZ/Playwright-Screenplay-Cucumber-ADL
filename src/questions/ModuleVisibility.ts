import { Question, AnswersQuestions, UsesAbilities, actorInTheSpotlight, Wait, Duration } from '@serenity-js/core';
import { PageElement, By, Scroll, isVisible, isEnabled } from '@serenity-js/web';
import { Ensure } from '@serenity-js/assertions';

export class ModuleVisibility {

  /**
   * Question para verificar visibilidad del título del módulo
   * según el nombre del módulo (dinámico)
   */
  public static of(nombreModulo: string) {
    return Question.about(
      `la visibilidad del módulo "${nombreModulo}"`,
      async (actor: AnswersQuestions & UsesAbilities) => {

        Wait.for(Duration.ofSeconds(80));

        // Localizamos el <h1> del módulo dinámicamente
        const moduleTitle = PageElement.located(
          By.xpath(`(//a[contains(.,'${nombreModulo}')])[2]`)
        ).describedAs(`título visible del módulo "${nombreModulo}"`);

        // Desplazamos hasta el elemento y verificamos que esté visible y habilitado
        await actorInTheSpotlight().attemptsTo(
          //Scroll.to(moduleTitle),
          Ensure.that(moduleTitle, isVisible()),
          Ensure.that(moduleTitle, isEnabled())
        );

        // Retornamos true/false según visibilidad
        return await actor.answer(moduleTitle.isVisible());
      }
    );
  }
}