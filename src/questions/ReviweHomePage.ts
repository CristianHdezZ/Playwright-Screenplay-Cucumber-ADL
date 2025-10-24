import { Question, AnswersQuestions, UsesAbilities, actorInTheSpotlight } from '@serenity-js/core';
import { PageElement, By, Scroll, isVisible, isEnabled } from '@serenity-js/web';
import { Ensure } from '@serenity-js/assertions';
import { HomePage } from '../ui/HomePage';

export class ReviewHomePage {

  /**
   * Question para verificar visibilidad de Main Content,
   * haciendo scroll automático y asegurando interactuabilidad
   */
  public static readonly isVisibleMainContent = Question.about(
    'the main content of the page',
    async (actor: AnswersQuestions & UsesAbilities) => {
      const element_mainContent = PageElement.located(By.xpath(HomePage.MAIN_CONTENT_PERFIL));

      // Scroll + asegurarse de visibilidad y habilitado
      await actorInTheSpotlight().attemptsTo(
        Scroll.to(element_mainContent),
        Ensure.that(element_mainContent, isVisible()),
        Ensure.that(element_mainContent, isEnabled())
      );

      // Retornar visibilidad para la Question
      return await actor.answer(element_mainContent.isVisible());
    }
  );

  /**
   * Question para verificar visibilidad del Form Title
   */
  public static readonly isVisibleTitle = Question.about(
    'the title of the form',
    async (actor: AnswersQuestions & UsesAbilities) => {
      const element_formTitle = PageElement.located(By.xpath(HomePage.FORM_TITLE));

      await actorInTheSpotlight().attemptsTo(
        Scroll.to(element_formTitle),
        Ensure.that(element_formTitle, isVisible()),
        Ensure.that(element_formTitle, isEnabled())
      );

      return await actor.answer(element_formTitle.isVisible());
    }
  );
}