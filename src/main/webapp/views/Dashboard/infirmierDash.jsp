  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <!-- Stats Cards -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            <div class="bg-white rounded-lg shadow p-6">
                <div class="flex items-center">
                    <div class="flex-shrink-0 bg-blue-100 rounded-full p-3">
                        <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"></path>
                        </svg>
                    </div>
                    <div class="ml-4">
                        <p class="text-sm font-medium text-gray-600">Patients en attente</p>
                        <p class="text-2xl font-bold text-gray-900">8</p>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow p-6">
                <div class="flex items-center">
                    <div class="flex-shrink-0 bg-green-100 rounded-full p-3">
                        <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                        </svg>
                    </div>
                    <div class="ml-4">
                        <p class="text-sm font-medium text-gray-600">Enregistrés aujourd'hui</p>
                        <p class="text-2xl font-bold text-gray-900">12</p>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow p-6">
                <div class="flex items-center">
                    <div class="flex-shrink-0 bg-purple-100 rounded-full p-3">
                        <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                        </svg>
                    </div>
                    <div class="ml-4">
                        <p class="text-sm font-medium text-gray-600">Temps d'attente moyen</p>
                        <p class="text-2xl font-bold text-gray-900">25 min</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Action Buttons -->
        <div class="mb-8">
            <button onclick="showModal()" class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg font-medium shadow-sm transition flex items-center gap-2">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                </svg>
                Nouvel Accueil Patient
            </button>
        </div>

       <!-- Full Patients List -->
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

                   <tbody class="bg-white divide-y divide-gray-200">
                       <!-- Example Patient Row -->
                      <c:forEach var="patient" items="${patients}" >
                       <tr class="hover:bg-gray-50">
                           <td class="px-4 py-2">${patient.nom} </td>
                           <td class="px-4 py-2">${patient.prenom}</td>
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
                       <!-- Add more rows for other patients -->
                   </tbody>
               </table>
           </div>
       </div>

    <!-- Modal for New Patient -->
    <div id="patientModal" class="hidden fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full z-50">
        <div class="relative top-20 mx-auto p-5 border w-full max-w-3xl shadow-lg rounded-md bg-white">
            <div class="flex justify-between items-center mb-4">
                <h3 class="text-xl font-semibold text-gray-900">Accueil Patient</h3>
                <button onclick="closeModal()" class="text-gray-400 hover:text-gray-600">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                    </svg>
                </button>
            </div>

            <!-- Search Patient Section -->
            <div class="mb-6 p-4 bg-blue-50 rounded-lg">
                <label class="block text-sm font-medium text-gray-700 mb-2">Rechercher un patient existant</label>
                <div class="flex gap-2">
                    <input type="text" placeholder="N° Sécurité Sociale ou Nom" class="flex-1 px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                    <button class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded-lg font-medium transition">
                        Rechercher
                    </button>
                </div>
            </div>


            <form action="${pageContext.request.contextPath}/dashboard/infirmier/save"  method="POST" class="space-y-6">
                <!-- Personal Information -->
                <div>
                    <h2 class="text-lg font-semibold mb-4">Personal Information</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label for="nom" class="block text-sm font-medium text-gray-700">Last Name</label>
                            <input type="text" id="nom" name="nom" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="prenom" class="block text-sm font-medium text-gray-700">First Name</label>
                            <input type="text" id="prenom" name="prenom" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="dateNaissance" class="block text-sm font-medium text-gray-700">Date of Birth</label>
                            <input type="date" id="dateNaissance" name="dateNaissance" required class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="telephone" class="block text-sm font-medium text-gray-700">Phone Number</label>
                            <input type="tel" id="telephone" name="telephone" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                            <input type="email" id="email" name="email" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="numSecu" class="block text-sm font-medium text-gray-700">Social Security Number</label>
                            <input type="text" id="numSecu" name="numSecu" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="adresse" class="block text-sm font-medium text-gray-700">Address</label>
                            <input type="text" id="adresse" name="adresse" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="ville" class="block text-sm font-medium text-gray-700">City</label>
                            <input type="text" id="ville" name="ville" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="codePostal" class="block text-sm font-medium text-gray-700">Postal Code</label>
                            <input type="text" id="codePostal" name="codePostal" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="mutuelle" class="block text-sm font-medium text-gray-700">Insurance Provider</label>
                            <input type="text" id="mutuelle" name="mutuelle" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="numMutuelle" class="block text-sm font-medium text-gray-700">Insurance Number</label>
                            <input type="text" id="numMutuelle" name="numMutuelle" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                    </div>
                </div>

                <!-- Medical Information -->
                <div>
                    <h2 class="text-lg font-semibold mb-4">Medical Information</h2>
                    <div class="grid grid-cols-1 gap-4">
                        <div>
                            <label for="antecedents" class="block text-sm font-medium text-gray-700">Medical History</label>
                            <textarea id="antecedents" name="antecedents" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" rows="4"></textarea>
                        </div>
                        <div>
                            <label for="allergies" class="block text-sm font-medium text-gray-700">Allergies</label>
                            <textarea id="allergies" name="allergies" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" rows="4"></textarea>
                        </div>
                        <div>
                            <label for="traitements" class="block text-sm font-medium text-gray-700">Current Treatments</label>
                            <textarea id="traitements" name="traitements" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" rows="4"></textarea>
                        </div>
                        <div>
                            <label for="groupeSanguin" class="block text-sm font-medium text-gray-700">Blood Type</label>
                            <input type="text" id="groupeSanguin" name="groupeSanguin" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                    </div>
                </div>

                <!-- Vital Signs -->
                <div>
                    <h2 class="text-lg font-semibold mb-4">Vital Signs</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label for="poids" class="block text-sm font-medium text-gray-700">Weight (kg)</label>
                            <input type="number" id="poids" name="poids" step="0.1" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="taille" class="block text-sm font-medium text-gray-700">Height (cm)</label>
                            <input type="number" id="taille" name="taille" step="0.1" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="temperature" class="block text-sm font-medium text-gray-700">Temperature (°C)</label>
                            <input type="number" id="temperature" name="temperature" step="0.1" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="tension" class="block text-sm font-medium text-gray-700">Blood Pressure</label>
                            <input type="text" id="tension" name="tension" placeholder="e.g., 120/80" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="freqCardiaque" class="block text-sm font-medium text-gray-700">Heart Rate (bpm)</label>
                            <input type="number" id="freqCardiaque" name="freqCardiaque" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label for="freqRespiratoire" class="block text-sm font-medium text-gray-700">Respiratory Rate (breaths/min)</label>
                            <input type="number" id="freqRespiratoire" name="freqRespiratoire" class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                    </div>
                </div>

                <!-- Submit Button -->
                <div class="text-center">
                    <button type="submit" class="bg-blue-500 text-white px-6 py-2 rounded-md hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-500">Submit</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        function showModal() {
            document.getElementById('patientModal').classList.remove('hidden');
        }

        function closeModal() {
            document.getElementById('patientModal').classList.add('hidden');
        }

        function logout() {
            if(confirm('Êtes-vous sûr de vouloir vous déconnecter?')) {
                window.location.href = 'login.jsp';
            }
        }

        // Close modal when clicking outside
        document.getElementById('patientModal').addEventListener('click', function(e) {
            if(e.target === this) {
                closeModal();
            }
        });
    </script>