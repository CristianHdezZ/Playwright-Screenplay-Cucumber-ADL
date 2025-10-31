import { When } from "@cucumber/cucumber";
import { Actor } from "@serenity-js/core";
import { CancelarActivacionBeneficioColaborador } from "../tasks/CancelarActivacionBeneficioColaborador";
import { DesactivarBeneficioColaborador } from "../tasks/DesactivarBeneficioColaborador";

When(
  "{pronombre} colaborador desactiva el beneficio", { timeout: 40000 },
  async (actor: Actor) => {
    await actor.attemptsTo(CancelarActivacionBeneficioColaborador.with());
  }
);

When('{pronombre} colaborador desactiva el beneficio {string}, {string}', { timeout: 40000 },
  async (actor: Actor, producto: string, metodoPago: string) =>{
    await actor.attemptsTo(DesactivarBeneficioColaborador.with(producto, metodoPago));
      
    });

When('{pronombre} colaborador desactiva el beneficio {string}, {string} para el familiar {string}', { timeout: 40000 },
  async (actor: Actor, producto: string, metodoPago: string, nombreFamiliar: string) =>{
    await actor.attemptsTo(DesactivarBeneficioColaborador.forFamilyWith(producto, metodoPago, nombreFamiliar));      
    });    

  