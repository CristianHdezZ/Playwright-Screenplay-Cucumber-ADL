import { When } from '@cucumber/cucumber';
import { Actor } from '@serenity-js/core';
import { ActualizarFamiliarApi } from '../tasks/ActualizarFamiliarApi';
import { ActivarBeneficioFamiliar } from '../tasks/ActivarBeneficioFamiliar';


When(
  '{pronombre} colaborador actualiza la fecha de nacimiento del familiar con {string}, {string} y {string}',
  async (actor: Actor, id: string, birthDate: string, eps: string) => {
    await actor.attemptsTo(
      ActualizarFamiliarApi.withData(id, birthDate, eps)
    );
  }
);


When(
  '{pronombre} colaborador activa el beneficio {string}, {string} para el familiar {string}',
  async (actor: Actor, producto: string, metodoPago: string, nombreFamiliar: string) => {    
    await actor.attemptsTo(ActivarBeneficioFamiliar.with(producto, metodoPago, nombreFamiliar));
  }
);






