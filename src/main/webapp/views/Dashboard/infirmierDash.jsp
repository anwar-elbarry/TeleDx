  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <!-- New Patient Creation -->
        <div class="mb-8">
            <button onclick="showNewPatientModal()" class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg font-medium shadow-sm transition flex items-center gap-2">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                </svg>
                Nouvel Accueil Patient
            </button>
        </div>
        <div class="mb-6 flex gap-4">
            <button onclick="switchTable('liste')" id="btnListe" class="px-6 py-2 bg-blue-600 text-white rounded-lg font-medium hover:bg-blue-700 transition">
                Liste Complète
            </button>
            <button onclick="switchTable('attente')" id="btnAttente" class="px-6 py-2 bg-gray-400 text-white rounded-lg font-medium hover:bg-gray-500 transition">
                File d'Attente
            </button>
        </div>
        <div class="mb-6">
            <div class="relative">
                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                    <svg class="h-5 w-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path>
                    </svg>
                </div>
                <input type="text" id="searchInput" class="block w-full pl-10 pr-3 py-2 border border-gray-300 rounded-md leading-5 bg-white placeholder-gray-500 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm" placeholder="Rechercher un patient par nom...">
            </div>
        </div>
       <!-- Full Patients List -->
        <div id="tableList" class="bg-white rounded-lg shadow overflow-hidden">
       <div class="bg-white rounded-lg shadow overflow-hidden">
           <div class="px-6 py-4 border-b border-gray-200">
               <h2 class="text-lg font-semibold text-gray-900">Liste Complète des Patients</h2>
               <p class="text-sm text-gray-600 mt-1">Toutes les informations disponibles sur les patients enregistres</p>
           </div>

           <div class="overflow-x-auto">
               <table class="min-w-full divide-y divide-gray-200 text-sm">
                   <thead class="bg-gray-50">
                       <tr>
                           <th class="px-4 py-2 text-left font-semibold text-gray-600">Nom</th>
                           <th class="px-4 py-2 text-left font-semibold text-gray-600">Prenom</th>
                           <th class="px-4 py-2 text-left font-semibold text-gray-600">Date de Naissance</th>
                           <th class="px-4 py-2 text-left font-semibold text-gray-600">N° Securite Sociale</th>
                           <th class="px-4 py-2 text-left font-semibold text-gray-600">Téléphone</th>
                           <th class="px-4 py-2 text-left font-semibold text-gray-600">Email</th>
                           <th class="px-4 py-2 text-left font-semibold text-gray-600">Adresse</th>
                           <th class="px-4 py-2 text-left font-semibold text-gray-600">Ville</th>
                           <th class="px-4 py-2 text-left font-semibold text-gray-600">Code Postal</th>
                           <th class="px-4 py-2 text-left font-semibold text-gray-600">Mutuelle</th>
                           <th class="px-4 py-2 text-left font-semibold text-gray-600">N° Mutuelle</th>

                           <th class="px-4 py-2 text-left font-semibold text-gray-600">Antecedents</th>
                           <th class="px-4 py-2 text-left font-semibold text-gray-600">Allergies</th>
                           <th class="px-4 py-2 text-left font-semibold text-gray-600">Traitements en cours</th>

                           <th class="px-4 py-2 text-left font-semibold text-gray-600">Poids (kg)</th>
                           <th class="px-4 py-2 text-left font-semibold text-gray-600">Taille (cm)</th>
                           <th class="px-4 py-2 text-left font-semibold text-gray-600">Temperature (°C)</th>
                           <th class="px-4 py-2 text-left font-semibold text-gray-600">Tension Arterielle</th>
                           <th class="px-4 py-2 text-left font-semibold text-gray-600">Fréq. Cardiaque (bpm)</th>
                           <th class="px-4 py-2 text-left font-semibold text-gray-600">Fréq. Respiratoire (resp/min)</th>
                           <th class="px-4 py-2 text-left font-semibold text-gray-600">Groupe Sanguin</th>

                           <th class="px-4 py-2 text-left font-semibold text-gray-600">Heure d’Arrivee</th>
                           <th class="px-4 py-2 text-left font-semibold text-gray-600">En Attente Médecin</th>
                           <th class="px-4 py-2 text-left font-semibold text-gray-600">Priorite</th>
                       </tr>
                   </thead>

                   <tbody id="listeBody" class="bg-white divide-y divide-gray-200">
                       <!-- Example Patient Row -->
                      <c:forEach var="patient" items="${patients}" >
                       <tr class="hover:bg-gray-50">
                           <td class="px-4 py-2">
                               <a href="#" onclick="showPatientDetails(event, '${patient.nom}', '${patient.prenom}', '${patient.date_naissance}', '${patient.num_securite_soc}', '${patient.telephone}', '${patient.email}')" class="text-blue-600 hover:text-blue-800 hover:underline">
                                       ${patient.nom}
                               </a>
                           </td>
                           <td class="px-4 py-2">
                               <a href="#" onclick="showPatientDetails(event, '${patient.nom}', '${patient.prenom}', '${patient.date_naissance}', '${patient.num_securite_soc}', '${patient.telephone}', '${patient.email}')" class="text-blue-600 hover:text-blue-800 hover:underline">
                                       ${patient.prenom}
                               </a>
                           </td>
                           <td class="px-4 py-2">${patient.date_naissance}</td>
                           <td class="px-4 py-2">${patient.num_securite_soc}</td>
                           <td class="px-4 py-2">${patient.telephone}</td>
                           <td class="px-4 py-2">${patient.email}</td>
                           <td class="px-4 py-2">${patient.adresse}</td>
                           <td class="px-4 py-2">${patient.ville}</td>
                           <td class="px-4 py-2">${patient.codePostal}</td>
                           <td class="px-4 py-2">${patient.mutuelle}</td>
                           <td class="px-4 py-2">${patient.numMutuelle}</td>

                           <td class="px-4 py-2">${patient.antecedents}</td>
                           <td class="px-4 py-2">${patient.allergies}</td>
                           <td class="px-4 py-2">${patient.traitementsEnCours}</td>

                           <td class="px-4 py-2">${patient.poids}</td>
                           <td class="px-4 py-2">${patient.taille}</td>
                           <td class="px-4 py-2">${patient.temperature}</td>
                           <td class="px-4 py-2">${patient.tensionArterielle}</td>
                           <td class="px-4 py-2">${patient.frequenceCardiaque}</td>
                           <td class="px-4 py-2">${patient.frequenceRespiratoire}</td>
                           <td class="px-4 py-2">${patient.groupeSanguin}</td>

                           <td class="px-4 py-2">${patient.dateArrivee}</td>
                           <td class="px-4 py-2">
                               <c:choose>
                                   <c:when test="${patient.enAttenteMedecin}">
                                       <span class="px-2 py-1 text-xs font-semibold rounded-full bg-yellow-100 text-yellow-800">
                                           En attente
                                       </span>
                                   </c:when>
                                   <c:otherwise>
                                       <span class="px-2 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">
                                           Consulté
                                       </span>
                                   </c:otherwise>
                               </c:choose>
                           </td>
                           <td class="px-4 py-2">3</td>
                       </tr>
                       </c:forEach>
                   </tbody>
               </table>
           </div>

           <!-- Patient Details Modal -->
           <div id="patientDetailsModal" class="hidden fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full z-50">
               <div class="relative top-20 mx-auto p-5 border w-full max-w-2xl shadow-lg rounded-md bg-white">
                   <div class="flex justify-between items-center mb-4">
                       <h3 class="text-xl font-semibold text-gray-900">Détails du Patient</h3>
                       <button onclick="closePatientDetails()" class="text-gray-400 hover:text-gray-600">
                           <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                               <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                           </svg>
                       </button>
                   </div>
                   <div class="space-y-4">
                       <div class="grid grid-cols-2 gap-4">
                           <div>
                               <p class="text-sm text-gray-500">Nom</p>
                               <p id="detail-nom" class="font-medium"></p>
                           </div>
                           <div>
                               <p class="text-sm text-gray-500">Prénom</p>
                               <p id="detail-prenom" class="font-medium"></p>
                           </div>
                           <div>
                               <p class="text-sm text-gray-500">Date de Naissance</p>
                               <p id="detail-naissance" class="font-medium"></p>
                           </div>
                           <div>
                               <p class="text-sm text-gray-500">N° Sécurité Sociale</p>
                               <p id="detail-secu" class="font-medium"></p>
                           </div>
                           <div>
                               <p class="text-sm text-gray-500">Téléphone</p>
                               <p id="detail-tel" class="font-medium"></p>
                           </div>
                           <div>
                               <p class="text-sm text-gray-500">Email</p>
                               <p id="detail-email" class="font-medium"></p>
                           </div>
                       </div>
                       <div class="pt-4 border-t mt-4">
                           <button onclick="closePatientDetails()" class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2">
                               Fermer
                           </button>
                       </div>
                   </div>
               </div>
           </div>
       </div>
        </div>
        <div id="tableAttente" class="hidden">
            <!-- Queue Statistics -->
            <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
                <div class="bg-white rounded-lg shadow p-4">
                    <p class="text-sm text-gray-600">En attente</p>
                    <p id="queueCount" class="text-2xl font-bold text-gray-900">0</p>
                </div>
                <div class="bg-white rounded-lg shadow p-4">
                    <p class="text-sm text-gray-600">Attente moyenne</p>
                    <p id="avgWaitTime" class="text-2xl font-bold text-gray-900">0 min</p>
                </div>
                <div class="bg-white rounded-lg shadow p-4">
                    <p class="text-sm text-gray-600">Cas urgents</p>
                    <p id="urgentCount" class="text-2xl font-bold text-red-600">0</p>
                </div>
                <div class="bg-white rounded-lg shadow p-4">
                    <p class="text-sm text-gray-600">Temps max</p>
                    <p id="maxWaitTime" class="text-2xl font-bold text-gray-900">0 min</p>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow overflow-hidden">
                <div class="px-6 py-4 border-b border-gray-200">
                    <h2 class="text-lg font-semibold text-gray-900">File d'Attente</h2>
                    <p class="text-sm text-gray-600 mt-1">Patients en attente de consultation médicale</p>
                </div>

                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200 text-sm">
                        <thead class="bg-gray-50">
                        <tr>
                            <th class="px-4 py-2 text-left font-semibold text-gray-600">Position</th>
                            <th class="px-4 py-2 text-left font-semibold text-gray-600">Nom</th>
                            <th class="px-4 py-2 text-left font-semibold text-gray-600">Prenom</th>
                            <th class="px-4 py-2 text-left font-semibold text-gray-600">Date de Naissance</th>
                            <th class="px-4 py-2 text-left font-semibold text-gray-600">Téléphone</th>
                            <th class="px-4 py-2 text-left font-semibold text-gray-600">Heure d'Arrivee</th>
                            <th class="px-4 py-2 text-left font-semibold text-gray-600">Temps d'Attente</th>
                            <th class="px-4 py-2 text-left font-semibold text-gray-600">Priorite</th>
                            <th class="px-4 py-2 text-left font-semibold text-gray-600">Actions</th>
                        </tr>
                        </thead>

                        <tbody class="bg-white divide-y divide-gray-200" id="attenteBody">
                        <c:forEach var="patient" items="${patients}" varStatus="status">
                            <c:if test="${patient.enAttenteMedecin}">
                                <tr class="hover:bg-gray-50">
                                    <td class="px-4 py-2 font-bold text-blue-600">${status.index + 1}</td>
                                    <td class="px-4 py-2">
                                        <a href="#" onclick="showPatientDetails(event, '${patient.nom}', '${patient.prenom}', '${patient.date_naissance}', '${patient.num_securite_soc}', '${patient.telephone}', '${patient.email}')" class="text-blue-600 hover:text-blue-800 hover:underline">
                                                ${patient.nom}
                                        </a>
                                    </td>
                                    <td class="px-4 py-2">${patient.prenom}</td>
                                    <td class="px-4 py-2">${patient.date_naissance}</td>
                                    <td class="px-4 py-2">${patient.telephone}</td>
                                    <td class="px-4 py-2">${patient.dateArrivee}</td>
                                    <td class="px-4 py-2">25 min</td>
                                    <td class="px-4 py-2">
                                <span class="px-2 py-1 text-xs font-semibold rounded-full bg-red-100 text-red-800">
                                    Urgent
                                </span>
                                    </td>
                                    <td class="px-4 py-2 flex gap-2">
                                        <button class="px-3 py-1 bg-indigo-600 text-white text-xs rounded hover:bg-indigo-700" onclick="openEdit('${patient.id}')">Éditer</button>
                                        <c:if test="${!patient.enAttenteMedecin}">
                                            <button class="px-3 py-1 bg-blue-600 text-white text-xs rounded hover:bg-blue-700" onclick="addToQueue('${patient.id}')">Ajouter à la file</button>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    <!-- Modal for Edit Patient -->
    <div id="patientModal" class="hidden fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full z-50">
        <div class="relative top-20 mx-auto p-5 border w-full max-w-3xl shadow-lg rounded-md bg-white">
            <div class="flex justify-between items-center mb-4">
                <h3 class="text-xl font-semibold text-gray-900">Éditer le patient</h3>
                <button onclick="closeModal()" class="text-gray-400 hover:text-gray-600">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                    </svg>
                </button>
            </div>
            <form action="${pageContext.request.contextPath}/dashboard/infirmier/update"  method="POST" class="space-y-6">
                <input type="hidden" id="id" name="id" />
                <!-- Personal Information -->
                <div>
                    <h2 class="text-lg font-semibold mb-4">Informations personnelles</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label for="nom" class="block text-sm font-medium text-gray-700">Nom</label>
                            <input type="text" id="nom" name="nom" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="prenom" class="block text-sm font-medium text-gray-700">Prénom</label>
                            <input type="text" id="prenom" name="prenom" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                         <div>
                            <label for="dateNaissance" class="block text-sm font-medium text-gray-700">Date de naissance</label>
                            <input type="date" id="dateNaissance" name="dateNaissance" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="telephone" class="block text-sm font-medium text-gray-700">Téléphone</label>
                            <input type="tel" id="telephone" name="telephone" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="email" class="block text-sm font-medium text-gray-700">Courriel</label>
                            <input type="email" id="email" name="email" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="numSecu" class="block text-sm font-medium text-gray-700">Numéro de sécurité sociale</label>
                            <input type="text" id="numSecu" name="numSecu" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="adresse" class="block text-sm font-medium text-gray-700">Adresse</label>
                            <input type="text" id="adresse" name="adresse" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="ville" class="block text-sm font-medium text-gray-700">Ville</label>
                            <input type="text" id="ville" name="ville" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="codePostal" class="block text-sm font-medium text-gray-700">Code postal</label>
                            <input type="text" id="codePostal" name="codePostal" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="mutuelle" class="block text-sm font-medium text-gray-700">Mutuelle</label>
                            <input type="text" id="mutuelle" name="mutuelle" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="numMutuelle" class="block text-sm font-medium text-gray-700">Numéro de mutuelle</label>
                            <input type="text" id="numMutuelle" name="numMutuelle" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                    </div>
                </div>

                <!-- Medical Information -->
                <div>
                    <h2 class="text-lg font-semibold mb-4">Informations médicales</h2>
                    <div class="grid grid-cols-1 gap-4">
                        <div>
                            <label for="antecedents" class="block text-sm font-medium text-gray-700">Antécédents médicaux</label>
                            <textarea id="antecedents" name="antecedents" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" rows="4"></textarea>
                        </div>
                        <div>
                            <label for="allergies" class="block text-sm font-medium text-gray-700">Allergies</label>
                            <textarea id="allergies" name="allergies" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" rows="4"></textarea>
                        </div>
                        <div>
                            <label for="traitements" class="block text-sm font-medium text-gray-700">Traitements en cours</label>
                            <textarea id="traitements" name="traitements" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" rows="4"></textarea>
                        </div>
                        <div>
                            <label for="groupeSanguin" class="block text-sm font-medium text-gray-700">Groupe sanguin</label>
                            <input type="text" id="groupeSanguin" name="groupeSanguin" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                    </div>
                </div>

                <!-- Vital Signs -->
                <div>
                    <h2 class="text-lg font-semibold mb-4">Signes vitaux</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label for="poids" class="block text-sm font-medium text-gray-700">Poids (kg)</label>
                            <input type="number" id="poids" name="poids" step="0.1" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="taille" class="block text-sm font-medium text-gray-700">Taille (cm)</label>
                            <input type="number" id="taille" name="taille" step="0.1" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="temperature" class="block text-sm font-medium text-gray-700">Température (°C)</label>
                            <input type="number" id="temperature" name="temperature" step="0.1" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="tension" class="block text-sm font-medium text-gray-700">Tension artérielle</label>
                            <input type="text" id="tension" name="tension" placeholder="ex. 120/80" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="freqCardiaque" class="block text-sm font-medium text-gray-700">Fréquence cardiaque (bpm)</label>
                            <input type="number" id="freqCardiaque" name="freqCardiaque" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="freqRespiratoire" class="block text-sm font-medium text-gray-700">Fréquence respiratoire (resp/min)</label>
                            <input type="number" id="freqRespiratoire" name="freqRespiratoire" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                    </div>
                </div>

                <!-- Submit Button -->
                <div class="text-center">
                    <button type="submit" class="bg-indigo-600 text-white px-6 py-2 rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-600">Enregistrer</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Modal for New Patient -->
    <div id="newPatientModal" class="hidden fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full z-50">
        <div class="relative top-20 mx-auto p-5 border w-full max-w-3xl shadow-lg rounded-md bg-white">
            <div class="flex justify-between items-center mb-4">
                <h3 class="text-xl font-semibold text-gray-900">Nouvel accueil patient</h3>
                <button onclick="closeNewPatientModal()" class="text-gray-400 hover:text-gray-600">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                    </svg>
                </button>
            </div>
            <form action="${pageContext.request.contextPath}/dashboard/infirmier/save"  method="POST" class="space-y-6">
                <!-- Personal Information -->
                <div>
                    <h2 class="text-lg font-semibold mb-4">Informations personnelles</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label for="np_nom" class="block text-sm font-medium text-gray-700">Nom</label>
                            <input type="text" id="np_nom" name="nom" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="np_prenom" class="block text-sm font-medium text-gray-700">Prénom</label>
                            <input type="text" id="np_prenom" name="prenom" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                         <div>
                            <label for="np_dateNaissance" class="block text-sm font-medium text-gray-700">Date de naissance</label>
                            <input type="date" id="np_dateNaissance" name="dateNaissance" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="np_telephone" class="block text-sm font-medium text-gray-700">Téléphone</label>
                            <input type="tel" id="np_telephone" name="telephone" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="np_email" class="block text-sm font-medium text-gray-700">Courriel</label>
                            <input type="email" id="np_email" name="email" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="np_numSecu" class="block text-sm font-medium text-gray-700">Numéro de sécurité sociale</label>
                            <input type="text" id="np_numSecu" name="numSecu" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="np_adresse" class="block text-sm font-medium text-gray-700">Adresse</label>
                            <input type="text" id="np_adresse" name="adresse" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="np_ville" class="block text-sm font-medium text-gray-700">Ville</label>
                            <input type="text" id="np_ville" name="ville" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="np_codePostal" class="block text-sm font-medium text-gray-700">Code postal</label>
                            <input type="text" id="np_codePostal" name="codePostal" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="np_mutuelle" class="block text-sm font-medium text-gray-700">Mutuelle</label>
                            <input type="text" id="np_mutuelle" name="mutuelle" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="np_numMutuelle" class="block text-sm font-medium text-gray-700">Numéro de mutuelle</label>
                            <input type="text" id="np_numMutuelle" name="numMutuelle" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                    </div>
                </div>

                <!-- Medical Information -->
                <div>
                    <h2 class="text-lg font-semibold mb-4">Informations médicales</h2>
                    <div class="grid grid-cols-1 gap-4">
                        <div>
                            <label for="np_antecedents" class="block text-sm font-medium text-gray-700">Antécédents médicaux</label>
                            <textarea id="np_antecedents" name="antecedents" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" rows="4"></textarea>
                        </div>
                        <div>
                            <label for="np_allergies" class="block text-sm font-medium text-gray-700">Allergies</label>
                            <textarea id="np_allergies" name="allergies" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" rows="4"></textarea>
                        </div>
                        <div>
                            <label for="np_traitements" class="block text-sm font-medium text-gray-700">Traitements en cours</label>
                            <textarea id="np_traitements" name="traitements" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" rows="4"></textarea>
                        </div>
                        <div>
                            <label for="np_groupeSanguin" class="block text-sm font-medium text-gray-700">Groupe sanguin</label>
                            <input type="text" id="np_groupeSanguin" name="groupeSanguin" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                    </div>
                </div>

                <!-- Vital Signs -->
                <div>
                    <h2 class="text-lg font-semibold mb-4">Signes vitaux</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label for="np_poids" class="block text-sm font-medium text-gray-700">Poids (kg)</label>
                            <input type="number" id="np_poids" name="poids" step="0.1" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="np_taille" class="block text-sm font-medium text-gray-700">Taille (cm)</label>
                            <input type="number" id="np_taille" name="taille" step="0.1" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="np_temperature" class="block text-sm font-medium text-gray-700">Température (°C)</label>
                            <input type="number" id="np_temperature" name="temperature" step="0.1" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="np_tension" class="block text-sm font-medium text-gray-700">Tension artérielle</label>
                            <input type="text" id="np_tension" name="tension" placeholder="ex. 120/80" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="np_freqCardiaque" class="block text-sm font-medium text-gray-700">Fréquence cardiaque (bpm)</label>
                            <input type="number" id="np_freqCardiaque" name="freqCardiaque" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="np_freqRespiratoire" class="block text-sm font-medium text-gray-700">Fréquence respiratoire (resp/min)</label>
                            <input type="number" id="np_freqRespiratoire" name="freqRespiratoire" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                    </div>
                </div>

                <!-- Submit Button -->
                <div class="text-center">
                    <button type="submit" class="bg-blue-600 text-white px-6 py-2 rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-600">Créer et ajouter à la file</button>
                </div>
            </form>
        </div>
    </div>
</div>
  <script>
      const BASE = '${pageContext.request.contextPath}';
      function showNewPatientModal() {
          document.getElementById('newPatientModal').classList.remove('hidden');
      }
      function closeNewPatientModal() {
          document.getElementById('newPatientModal').classList.add('hidden');
      }
      function closeModal() {
          document.getElementById('patientModal').classList.add('hidden');
      }

      document.getElementById('patientModal').addEventListener('click', function(e) {
          if(e.target === this) {
              closeModal();
          }
      });

      // Switch between tables
      function switchTable(tableType) {
          const tableList = document.getElementById('tableList');
          const tableAttente = document.getElementById('tableAttente');
          const btnListe = document.getElementById('btnListe');
          const btnAttente = document.getElementById('btnAttente');

          if (tableType === 'liste') {
              tableList.classList.remove('hidden');
              tableAttente.classList.add('hidden');
              btnListe.classList.remove('bg-gray-400', 'hover:bg-gray-500');
              btnListe.classList.add('bg-blue-600', 'hover:bg-blue-700');
              btnAttente.classList.remove('bg-blue-600', 'hover:bg-blue-700');
              btnAttente.classList.add('bg-gray-400', 'hover:bg-gray-500');
          } else if (tableType === 'attente') {
              tableList.classList.add('hidden');
              tableAttente.classList.remove('hidden');
              btnAttente.classList.remove('bg-gray-400', 'hover:bg-gray-500');
              btnAttente.classList.add('bg-blue-600', 'hover:bg-blue-700');
              btnListe.classList.remove('bg-blue-600', 'hover:bg-blue-700');
              btnListe.classList.add('bg-gray-400', 'hover:bg-gray-500');
          }
      }

      // Search functionality
      document.addEventListener('DOMContentLoaded', function() {
          const searchInput = document.getElementById('searchInput');
          const listeBody = document.getElementById('listeBody');
          const attenteBody = document.getElementById('attenteBody');

          function filterPatients() {
              const term = searchInput.value.trim();
              fetch(BASE + '/dashboard/infirmier/patients?q=' + encodeURIComponent(term))
                  .then(r => r.json())
                  .then(patients => {
                      // Rebuild liste table
                      listeBody.innerHTML = '';
                      patients.forEach(p => {
                          const tr = document.createElement('tr');
                          tr.className = 'hover:bg-gray-50';
                          tr.innerHTML =
                              '<td class="px-4 py-2"><a href="#" class="text-blue-600 hover:text-blue-800 hover:underline">' + (p.nom||'') + '</a></td>'+
                              '<td class="px-4 py-2"><a href="#" class="text-blue-600 hover:text-blue-800 hover:underline">' + (p.prenom||'') + '</a></td>'+
                              '<td class="px-4 py-2">' + (p.date_naissance||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.num_securite_soc||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.telephone||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.email||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.adresse||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.ville||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.codePostal||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.mutuelle||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.numMutuelle||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.antecedents||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.allergies||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.traitementsEnCours||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.poids||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.taille||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.temperature||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.tensionArterielle||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.frequenceCardiaque||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.frequenceRespiratoire||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.groupeSanguin||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.dateArrivee||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.enAttenteMedecin ? '<span class="px-2 py-1 text-xs font-semibold rounded-full bg-yellow-100 text-yellow-800">En attente</span>' : '<span class="px-2 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">Consulté</span>') + '</td>'+
                              '<td class="px-4 py-2">' + (p.priorite||'') + '</td>';
                          // action cell (edit + add-to-queue when not waiting)
                          const tdActions = document.createElement('td');
                          tdActions.className = 'px-4 py-2 flex gap-2';
                          const editBtn = document.createElement('button');
                          editBtn.className = 'px-3 py-1 bg-indigo-600 text-white text-xs rounded hover:bg-indigo-700';
                          editBtn.textContent = 'Éditer';
                          editBtn.addEventListener('click', () => openEdit(p.id));
                          tdActions.appendChild(editBtn);
                          if (!p.enAttenteMedecin) {
                              const addBtn = document.createElement('button');
                              addBtn.className = 'px-3 py-1 bg-blue-600 text-white text-xs rounded hover:bg-blue-700';
                              addBtn.textContent = 'Ajouter à la file';
                              addBtn.addEventListener('click', () => addToQueue(p.id));
                              tdActions.appendChild(addBtn);
                          }
                          tr.appendChild(tdActions);
                          listeBody.appendChild(tr);
                      });

                      // Rebuild attente table (only waiting)
                      attenteBody.innerHTML = '';
                      patients.filter(p => p.enAttenteMedecin).forEach((p, idx) => {
                          const tr = document.createElement('tr');
                          tr.className = 'hover:bg-gray-50';
                          tr.innerHTML =
                              '<td class="px-4 py-2 font-bold text-blue-600">' + (idx+1) + '</td>'+
                              '<td class="px-4 py-2">' + (p.nom||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.prenom||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.date_naissance||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.telephone||'') + '</td>'+
                              '<td class="px-4 py-2">' + (p.dateArrivee||'') + '</td>'+
                              '<td class="px-4 py-2">0 min</td>'+
                              '<td class="px-4 py-2"><span class="px-2 py-1 text-xs font-semibold rounded-full bg-red-100 text-red-800">Urgent</span></td>'+
                              '<td class="px-4 py-2 flex gap-2">' +
                                '<button class="px-3 py-1 bg-indigo-600 text-white text-xs rounded hover:bg-indigo-700" onclick="openEdit(\'' + p.id + '\')">Éditer</button>'+
                              '</td>';
                          attenteBody.appendChild(tr);
                      });

                      updateQueueStats();
                  })
                  .catch(() => {});
          }

          searchInput.addEventListener('input', filterPatients);
          updateQueueStats();
      });

      // Patient details modal functions
      function showPatientDetails(event, nom, prenom, naissance, secu, tel, email) {
          event.preventDefault();
          document.getElementById('detail-nom').textContent = nom;
          document.getElementById('detail-prenom').textContent = prenom;
          document.getElementById('detail-naissance').textContent = naissance;
          document.getElementById('detail-secu').textContent = secu;
          document.getElementById('detail-tel').textContent = tel || 'Non renseigné';
          document.getElementById('detail-email').textContent = email || 'Non renseigné';
          document.getElementById('patientDetailsModal').classList.remove('hidden');
      }

      function closePatientDetails() {
          document.getElementById('patientDetailsModal').classList.add('hidden');
      }

      document.getElementById('patientDetailsModal').addEventListener('click', function(e) {
          if(e.target === this) {
              closePatientDetails();
          }
      });

      // Edit-only
      async function openEdit(id) {
          try {
              const r = await fetch(BASE + '/dashboard/infirmier/patient-json?id=' + encodeURIComponent(id));
              if (!r.ok) { showModalPrefillFallback(); return; }
              const p = await r.json();
              document.getElementById('id').value = p.id || '';
              document.getElementById('nom').value = p.nom || '';
              document.getElementById('prenom').value = p.prenom || '';
              document.getElementById('dateNaissance').value = (p.date_naissance || '').toString();
              document.getElementById('telephone').value = p.telephone || '';
              document.getElementById('email').value = p.email || '';
              document.getElementById('numSecu').value = p.num_securite_soc || '';
              document.getElementById('adresse').value = p.adresse || '';
              document.getElementById('ville').value = p.ville || '';
              document.getElementById('codePostal').value = p.codePostal || '';
              document.getElementById('mutuelle').value = p.mutuelle || '';
              document.getElementById('numMutuelle').value = p.numMutuelle || '';
              document.getElementById('antecedents').value = p.antecedents || '';
              document.getElementById('allergies').value = p.allergies || '';
              document.getElementById('traitements').value = p.traitementsEnCours || '';
              document.getElementById('groupeSanguin').value = p.groupeSanguin || '';
              document.getElementById('poids').value = p.poids ?? '';
              document.getElementById('taille').value = p.taille ?? '';
              document.getElementById('temperature').value = p.temperature ?? '';
              document.getElementById('tension').value = p.tensionArterielle || '';
              document.getElementById('freqCardiaque').value = p.frequenceCardiaque ?? '';
              document.getElementById('freqRespiratoire').value = p.frequenceRespiratoire ?? '';
              document.getElementById('patientModal').classList.remove('hidden');
          } catch (_) {
              showModalPrefillFallback();
          }
      }

      function showModalPrefillFallback() {
          document.getElementById('patientModal').classList.remove('hidden');
      }

      // Update queue positions after removal
      function updateQueuePositions() {
          const rows = document.querySelectorAll('#attenteBody tr');
          rows.forEach((row, index) => {
              const positionCell = row.querySelector('td:first-child');
              positionCell.textContent = index + 1;
          });
      }

      // Update queue statistics
      function updateQueueStats() {
          const rows = document.querySelectorAll('#attenteBody tr');
          const queueCount = rows.length;
          document.getElementById('queueCount').textContent = queueCount;

          let totalWaitTime = 0;
          let maxWaitTime = 0;
          let urgentCount = 0;

          rows.forEach(row => {
              const timeCell = row.querySelector('td:nth-child(7)');
              const priorityCell = row.querySelector('td:nth-child(8)');
              const timeText = timeCell.textContent.trim();
              const minutes = parseInt(timeText);

              if (!isNaN(minutes)) {
                  totalWaitTime += minutes;
                  if (minutes > maxWaitTime) {
                      maxWaitTime = minutes;
                  }
              }

              if (priorityCell.textContent.includes('Urgent')) {
                  urgentCount++;
              }
          });

          const avgWaitTime = queueCount > 0 ? Math.round(totalWaitTime / queueCount) : 0;
          document.getElementById('avgWaitTime').textContent = avgWaitTime + ' min';
          document.getElementById('maxWaitTime').textContent = maxWaitTime + ' min';
          document.getElementById('urgentCount').textContent = urgentCount;
      }

      // Auto-update wait times every minute
      setInterval(function() {
          const cells = document.querySelectorAll('#attenteBody td:nth-child(7)');
          cells.forEach(cell => {
              const timeText = cell.textContent.trim();
              const minutes = parseInt(timeText);
              if (!isNaN(minutes)) {
                  cell.textContent = (minutes + 1) + ' min';
              }
          });
          updateQueueStats();
      }, 60000);
  </script>