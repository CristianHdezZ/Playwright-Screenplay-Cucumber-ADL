import { When, Then } from '@cucumber/cucumber';
import { Actor } from '@serenity-js/core';
import { Ensure, equals } from "@serenity-js/assertions";
import { ActualizarColaboradorApi } from '../tasks/ActualizarColaboradorApi';
import { SeleccionarServicio } from '../tasks/SeleccionarServicio';
import { ActivarBeneficio } from '../tasks/ActivarBeneficio';
import { TarifaProducto } from '../questions/ReviweTarifaProducto';
import { ConfirmarBeneficio } from '../tasks/ConfirmarBeneficio';

When(
  '{pronombre} colaborador actualiza su fecha de nacimiento con {string}, {string} y {string}',
  async (actor: Actor,id: string, birthDate: string, eps: string) => {    
    await actor.attemptsTo(ActualizarColaboradorApi.withData(id, birthDate, eps));
  }
);

When(
  '{pronombre} selecciona el {string}, {string} y selecciona la {string}',
  async (actor: Actor, servicio: string, categoria: string, entidad: string) => {    
    await actor.attemptsTo(SeleccionarServicio.with(servicio, categoria, entidad));
  }
);

When(
  '{pronombre} colaborador activa el beneficio {string}, {string}',
  async (actor: Actor, producto: string, metodoPago: string) => {    
    await actor.attemptsTo(ActivarBeneficio.with(producto, metodoPago));
  }
);

Then(
  '{pronombre} plataforma muestra el {string} disponible y la respectiva {string} del producto',
  async (actor: Actor, producto: string, tarifaEsperada: string) => {    
    await actor.attemptsTo(
      Ensure.that(TarifaProducto.of(producto), equals(tarifaEsperada))
    );
  }
);

When(
  '{pronombre} colaborador confirma el beneficio',
  async (actor: Actor) => {
    await actor.attemptsTo(ConfirmarBeneficio.now());
  }
);
