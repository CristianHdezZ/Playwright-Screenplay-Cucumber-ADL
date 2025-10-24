import { PageElement, By } from '@serenity-js/web';

export class RegistrarMascotaPage {

    static readonly BTN_MIS_MASCOTAS = PageElement.located(
        By.xpath("//button[normalize-space()='Mis mascotas']")
    ).describedAs('botón Mis mascotas');

    static readonly BTN_ADD_MASCOTA = PageElement.located(
        By.xpath("//button[contains(.,'Añadir mascota')]")
    ).describedAs('botón Añadir mascota');

    static readonly TITLE_REGISTRO_MASCOTA = PageElement.located(
        By.xpath("//h4[normalize-space()='Registra tu peludito']")
    ).describedAs('título del modal Registra tu peludito');

    static readonly INPUT_NOMBRE_MASCOTA = PageElement.located(
        By.xpath("//input[@formcontrolname='petName']")
    ).describedAs('campo Nombre mascota');

    static readonly SELECT_TIPO_MASCOTA = PageElement.located(
        By.xpath("//select[@formcontrolname='petTypeCode']")
    ).describedAs('selector Tipo de mascota');

    static readonly INPUT_FECHA_NACIMIENTO = PageElement.located(
        By.xpath("//input[@formcontrolname='age']")
    ).describedAs('campo Fecha de Nacimiento');

    static readonly SELECT_RAZA = PageElement.located(
        By.xpath("//select[@formcontrolname='petBreedCode']")
    ).describedAs('selector Raza');

    static readonly SELECT_GENERO = PageElement.located(
        By.xpath("//select[@formcontrolname='petGenderCode']")
    ).describedAs('selector Género');

    static readonly BTN_REGISTRAR = PageElement.located(
        By.xpath("//button[span[text()='Registrar']]")
    ).describedAs('botón Registrar');

    static readonly MSG_EXITO = PageElement.located(
        By.xpath("//h5[contains(text(),'¡Los datos fueron guardados con éxito!')]")
    ).describedAs('mensaje de éxito');
}
