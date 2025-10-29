import { Then } from '@cucumber/cucumber';
import { Actor } from '@serenity-js/core';
import { Ensure, equals } from '@serenity-js/assertions';
import { LastResponse } from '@serenity-js/rest';
import { ReviewMensajeExitoUpdateColaboradorApi } from '../questions/ReviewMensajeExitoUpdateColaboradorApi';
import { ReviewMensajeExitoUpdateFamiliarApi } from '../questions/ReviewMensajeExitoUpdateFamiliarApi';


Then('{pronombre} respuesta del API debe ser exitosamente para la actualización del colaborador con {string}',{ timeout: 70000 }, async (actor: Actor, idColaborador:string) => {
    await actor.attemptsTo(
        Ensure.that(LastResponse.status(), equals(200)),
        Ensure.that(ReviewMensajeExitoUpdateColaboradorApi.message, equals('Operation performed successfully')),
        Ensure.that(ReviewMensajeExitoUpdateColaboradorApi.id, equals(Number.parseInt(idColaborador))),
    );
});

Then('{pronombre} respuesta del API debe ser exitosamente para la actualización del familiar con {string}',{ timeout: 70000 }, async (actor: Actor, idFamily:string) => {
    await actor.attemptsTo(
        Ensure.that(LastResponse.status(), equals(200)),
        Ensure.that(ReviewMensajeExitoUpdateFamiliarApi.message, equals('Operation performed successfully')),
        Ensure.that(ReviewMensajeExitoUpdateFamiliarApi.id, equals(Number.parseInt(idFamily))),
    );
});





