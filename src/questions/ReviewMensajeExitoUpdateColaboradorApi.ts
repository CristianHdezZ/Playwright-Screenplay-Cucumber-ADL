import { Question, AnswersQuestions, UsesAbilities } from '@serenity-js/core';
import { LastResponse } from '@serenity-js/rest';


interface ApiResponse {
    responseCode: number;
    message: string;
    data: {
        id: number;
        id_company: number;
        firstName: string;
        middleName: string;
        firstSurname: string;
        secondLastName: string;
        documentType: number;
        documentNumber: string;
    };
    timestamp: string;
}

export class ReviewMensajeExitoUpdateColaboradorApi {

    /**
     * Question para verificar que el mensaje de éxito del API
     * sea "Operation performed successfully"
     */
    public static readonly message = Question.about(
        'el mensaje de éxito del API',
        async (actor: AnswersQuestions & UsesAbilities) => {
            // Extraer body del LastResponse
            const body = await actor.answer(LastResponse.body<ApiResponse>());
            console.log('Mensaje del API:', body.message);
            return body.message;
        }
    );

    /**
     * Question para obtener el id del colaborador actualizado
     */
    public static readonly id = Question.about(
        'el id del colaborador en el API',
        async (actor: AnswersQuestions & UsesAbilities) => {
            const body = await actor.answer(LastResponse.body<ApiResponse>());
            console.log('ID del colaborador:', body.data.id);
            return body.data.id;
        }
    );
}
