// import { Task, Interaction} from "@serenity-js/core";
// import axios from "axios";

// export class ActualizarColaboradorApi {
//   static withData(id: string, birthDate: string, eps: string) {
//     const token = process.env.AT || "";
//     const idCompany = process.env.ID_COMPANY || "";
//     console.log(
//       `🔑 Usando ${token} de autenticación y ${idCompany} de compañía del entorno`
//     );

//     const payload = {
//       id: parseInt(id),
//       id_company: parseInt(idCompany),
//       documentType: 1,
//       documentNumber: "1108761455",
//       firstName: "Cristian",
//       middleName: "Javier",
//       firstSurname: "Hernandez",
//       secondLastName: "Zabala",
//       email: "cristian.hernandezz@avaldigitallabs.com",
//       eps: parseInt(eps),
//       compensationFund: "",
//       assignedAmount: 4800000,
//       dayAmount: 450000,
//       birthDate,
//       startDateBenefits: "2024-03-01T00:00:00.000Z",
//       endDateBenefits: "2025-02-28T00:00:00.000Z",
//       maritalStatus: 3,
//       role: 1,
//       genderType: 2,
//       city: "11001",
//       department: "11",
//       address: "Calle falsa 321",
//       cellphone: "3057993821",
//       userVip: false,
//       userRefund: false,
//       refundValue: 0,
//       dateWithdrew: "2124-11-23T00:37:04.864Z",
//       dateWithdrewCovenant: "2124-11-23T00:37:04.864Z",
//       salaryValue: 11500000,
//       entryDate: "2019-06-04T00:00:00.000Z",
//       appointment: "Ingeniero de Implementacion Sr",
//       status: true,
//       contactChannel: 2,
//       confirmed_benefit: false,
//     };

//     console.log("📡 Actualizando colaborador:", payload);

//     return Task.where(
//       "#actor actualiza la información del colaborador",
//       Interaction.where(`#wait 5 seconds`, async () => {
//         try {
//           const response = await axios.put(
//             "https://benefits-dev-api.migrupoesaval.com/associates/api/associates/",
//             payload,
//             { headers: { Authorization: `Bearer ${token}` } }
//           );
//           console.log(
//             "✅ Colaborador actualizado exitosamente:",
//             response.data
//           );
          
//         } catch (error) {
//           console.error("❌ Error al actualizar el colaborador:", error);
//         }
//       })
//     );
//   }
// }
 
import { Task, Interaction } from "@serenity-js/core";
import { Send, PutRequest } from '@serenity-js/rest';

export class ActualizarColaboradorApi {
  static withData(id: string, birthDate: string, eps: string) {
    const idCompany = process.env.ID_COMPANY || '';

    const payload = {
      id: parseInt(id),
      id_company: parseInt(idCompany),
      documentType: 1,
      documentNumber: '1108761455',
      firstName: 'Cristian',
      middleName: 'Javier',
      firstSurname: 'Hernandez',
      secondLastName: 'Zabala',
      email: 'cristian.hernandezz@avaldigitallabs.com',
      eps: parseInt(eps),
      compensationFund: '',
      assignedAmount: 4800000,
      dayAmount: 450000,
      birthDate,
      startDateBenefits: '2024-03-01T00:00:00.000Z',
      endDateBenefits: '2025-02-28T00:00:00.000Z',
      maritalStatus: 3,
      role: 1,
      genderType: 2,
      city: '11001',
      department: '11',
      address: 'Calle falsa 321',
      cellphone: '3057993821',
      userVip: false,
      userRefund: false,
      refundValue: 0,
      dateWithdrew: '2124-11-23T00:37:04.864Z',
      dateWithdrewCovenant: '2124-11-23T00:37:04.864Z',
      salaryValue: 11500000,
      entryDate: '2019-06-04T00:00:00.000Z',
      appointment: 'Ingeniero de Implementacion Sr',
      status: true,
      contactChannel: 2,
      confirmed_benefit: false,
    };

    return Task.where(
      '#actor actualiza la información del colaborador',
      Send.a(PutRequest.to('/associates/api/associates/').with(payload)),
      Interaction.where(`#wait 2 seconds`, async () => {
        await new Promise(resolve => setTimeout(resolve, 2000)); 
      }
    )     

    );
  }
}
