import { Question, AnswersQuestions, UsesAbilities } from '@serenity-js/core';
import { LastResponse } from '@serenity-js/rest';

export interface ApiResponseFamiliar {
    responseCode: number;
    message: string;
    data: {
        id: number;
        collaborator: number;
        firstName: string;
        middleName: string;
        firstSurname: string;
        secondLastName: string;
        documentType: number;
        documentNumber: string; 
        genderType: number; 
        eps: number;
        birthDate: string;
        relationship: number;
        department: string;
        city: string;
        address: string;
    };
    timestamp: string;
}

export class ReviewMensajeExitoUpdateFamiliarApi {

    public static readonly message = Question.about(
        'el mensaje de éxito del API familiar',
        async (actor: AnswersQuestions & UsesAbilities) => {
            const body = await actor.answer(LastResponse.body<ApiResponseFamiliar>());
            console.log('Mensaje del API Familiar:', body.message);
            return body.message;
        }
    );

    public static readonly id = Question.about(
        'el id del familiar actualizado',
        async (actor: AnswersQuestions & UsesAbilities) => {
            const body = await actor.answer(LastResponse.body<ApiResponseFamiliar>());
            console.log('ID del familiar:', body.data.id);
            return body.data.id;
        }
    );
}
