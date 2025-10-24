import { Given, Then } from '@cucumber/cucumber';
import { Ensure, equals } from '@serenity-js/assertions';
import { OpenPage } from '../tasks/OpenPage';
import { ReviewHomePage } from '../questions/ReviweHomePage';
import { Actor, actorInTheSpotlight  } from '@serenity-js/core';
import { LoadinAuthToken } from '../tasks/LoadinAuthToken';

Given('{actor} opens the application', { timeout: 40000 }, async (actor: Actor) => {
  console.log('🚀 Opening the application');
  await actor.attemptsTo(OpenPage.atBaseUrl());
});

Then('{pronoun} loads the authentication token and goes to the homepage', { timeout: 40000 }, async (actor: Actor) => {
  console.log('🔐 Loading authentication token and navigating to homepage');
  await actor.attemptsTo(LoadinAuthToken.andNavigateToHomepage());  
});

Then('{pronoun} should see the page title My Seguros Adl', { timeout: 40000 }, async (actor: Actor) => { 
  console.log('👀 Verifying the homepage is visible');  
  await actorInTheSpotlight().attemptsTo(
        Ensure.that(ReviewHomePage.isVisibleMainContent, equals(true))
    );
});