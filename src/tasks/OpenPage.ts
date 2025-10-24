import { Task } from '@serenity-js/core';
import { Navigate } from '@serenity-js/web';

export class OpenPage {
    static atBaseUrl() {
        return Task.where(`#open the application base URL`,
            Navigate.to('https://security-dev.migrupoesaval.com/security/unauthorized'),
        );
    }
}
