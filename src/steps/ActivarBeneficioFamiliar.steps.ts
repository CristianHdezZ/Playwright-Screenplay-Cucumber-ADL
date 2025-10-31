import { When } from "@cucumber/cucumber";
import { Actor } from "@serenity-js/core";
import { ConfirmarBeneficio } from "../tasks/ConfirmarBeneficio";

When('{pronombre} colaborador confirma afiliación familiar', { timeout: 40000 },
  async (actor: Actor) => {
    await actor.attemptsTo(ConfirmarBeneficio.forFamily());
   });