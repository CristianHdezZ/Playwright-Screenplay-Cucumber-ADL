import { Question } from '@serenity-js/core';
import { RegistrarMascotaPage } from '../ui/RegistrarMascotaPage';

export const ReviewRegistrarMascota = {
    successMessageVisible: Question.about(
        'el mensaje de éxito al registrar una mascota',
        async (actor) => {
            // Devuelve si el mensaje de éxito es visible
            return await actor.answer(RegistrarMascotaPage.MSG_EXITO.isVisible());
        }
    ),
};
