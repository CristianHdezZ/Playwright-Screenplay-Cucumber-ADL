// import { Task, Interaction } from "@serenity-js/core";
// import axios from "axios";

// export class ActualizarFamiliarApi {
//   static withData(id: string, birthDate: string, eps: string) {
//     const token = process.env.AT || "";
//     console.log(
//       `🔑 Usando ${token} de autenticación y ${id}, ${birthDate}, ${eps} de los parámetros`
//     );

//     const payload = {
//       TableName: "FAMILY",
//       TableFamily: {
//         id_family: parseInt(id),
//         first_name: "Ana",
//         middle_name: "MaríaTest",
//         first_surname: "López",
//         second_last_name: "Torres",
//         document_type_code: 1,
//         document_number: "145521153",
//         gender_type_code: 1,
//         eps_code: parseInt(eps),
//         birth_date: birthDate,
//         relationship_code: 7,
//         department_code: "05",
//         city_code: "05266",
//         address: "calle falsa 128",
//         stature: "",
//         weight: "",
//       },
//     };

//     console.log("📡 Actualizando familiar:", payload);

//     return Task.where(
//       "#actor actualiza la información del familiar",
//       Interaction.where(`#PUT actualizar familiar ${id}`, async () => {
//         try {
//           const response = await axios.put(
//             `https://benefits-dev-api.migrupoesaval.com/beneficiaries/api/beneficiaries/${id}?code=FAMILY`,
//             payload,
//             { headers: { Authorization: `Bearer ${token}` } }
//           );
//           console.log("✅ Familiar actualizado exitosamente:", response.data);
//         } catch (error: any) {
//           console.error(
//             "❌ Error al actualizar el familiar:",
//             error?.response?.data || error.message
//           );
//         }
//       })
//     );
//   }
// }


// tasks/ActualizarFamiliarApi.ts
import { Task } from '@serenity-js/core';
import { Send, PutRequest, LastResponse } from '@serenity-js/rest';

export class ActualizarFamiliarApi {
  static withData(id: string, birthDate: string, eps: string) {
    const payload = {
      TableName: "FAMILY",
      TableFamily: {
        id_family: parseInt(id),
        first_name: "Ana",
        middle_name: "MaríaTest",
        first_surname: "López",
        second_last_name: "Torres",
        document_type_code: 1,
        document_number: "145521153",
        gender_type_code: 1,
        eps_code: parseInt(eps),
        birth_date: birthDate,
        relationship_code: 7,
        department_code: "05",
        city_code: "05266",
        address: "calle falsa 128",
        stature: "",
        weight: "",
      },
    };

    // El endpoint incluye el id y el query ?code=FAMILY
    const endpoint = `/beneficiaries/api/beneficiaries/${id}?code=FAMILY`;

    return Task.where(
      '#actor actualiza la información del familiar',
      Send.a(PutRequest.to(endpoint).with(payload))      
    );
  }
}
