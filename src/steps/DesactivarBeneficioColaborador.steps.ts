import { When } from "@cucumber/cucumber";
import { Actor } from "@serenity-js/core";
import { DesactivarBeneficioColaborador } from "../tasks/DesactivarBeneficioColaborador";

When(
  "{pronombre} colaborador desactiva el beneficio", { timeout: 40000 },
  async (actor: Actor) => {
    await actor.attemptsTo(DesactivarBeneficioColaborador.with());
  }
);
