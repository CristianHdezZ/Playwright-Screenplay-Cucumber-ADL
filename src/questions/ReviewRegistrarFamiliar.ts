import { Question, AnswersQuestions, UsesAbilities, actorInTheSpotlight } from '@serenity-js/core';
import { Ensure, equals } from '@serenity-js/assertions';
import { Click, Scroll, isVisible } from '@serenity-js/web';
import { RegistrarFamiliarPage } from '../ui/RegistrarFamiliarPage';

export class ReviewRegistrarFamiliar {

    /**
     * Question para verificar visibilidad del mensaje de éxito
     * y que contenga el texto "¡Los datos fueron guardados con éxito!"
     */
    public static readonly isVisibleSuccessMessage = Question.about(
        'el mensaje de éxito de registro de familiar',
        async (actor: AnswersQuestions & UsesAbilities) => {

            const successMessage = RegistrarFamiliarPage.MSG_EXITO;

            // Scroll hasta el elemento y asegurar visibilidad
            await actorInTheSpotlight().attemptsTo(
                Scroll.to(successMessage),
                Ensure.that(successMessage, isVisible())
            );

            // Verificar que el texto sea el esperado
            await actorInTheSpotlight().attemptsTo(
                Ensure.that(successMessage.text(), equals('¡Los datos fueron guardados con éxito!'))
            ); 

            
            const isVisibleSuccessMessage = await actor.answer(successMessage.isVisible());
            console.log('Mensaje de éxito visible:', isVisibleSuccessMessage);
            
             await actorInTheSpotlight().attemptsTo(
                Scroll.to(RegistrarFamiliarPage.BTN_ACEPTAR),
                Click.on(RegistrarFamiliarPage.BTN_ACEPTAR)
            );

            return isVisibleSuccessMessage;
        }
    );
}
