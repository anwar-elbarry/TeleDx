


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

        <!-- Patients List -->
        <div class="bg-white rounded-lg shadow overflow-hidden">
            <div class="px-6 py-4 border-b border-gray-200">
                <h2 class="text-lg font-semibold text-gray-900">Liste des Patients Enregistrés</h2>
                <p class="text-sm text-gray-600 mt-1">Patients du jour - Triés par heure d'arrivée</p>
            </div>

            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Patient</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">N° Sécurité Sociale</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Heure d'arrivée</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Signes Vitaux</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Statut</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <tr class="hover:bg-gray-50">
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="text-sm font-medium text-gray-900">{@}</div>
                                <div class="text-sm text-gray-500">45 ans</div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">1 85 03 75 123 456</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">08:15</td>
                            <td class="px-6 py-4">
                                <div class="text-xs space-y-1">
                                    <div><span class="font-medium">TA:</span> 120/80 mmHg</div>
                                    <div><span class="font-medium">FC:</span> 72 bpm</div>
                                    <div><span class="font-medium">Temp:</span> 36.8°C</div>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <span class="px-2 py-1 inline-flex text-xs leading-5 font-semibold rounded-full bg-yellow-100 text-yellow-800">
                                    En attente
                                </span>
                            </td>
                        </tr>
                        <tr class="hover:bg-gray-50">
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="text-sm font-medium text-gray-900">Fatima El Amrani</div>
                                <div class="text-sm text-gray-500">32 ans</div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">2 90 06 15 234 567</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">08:30</td>
                            <td class="px-6 py-4">
                                <div class="text-xs space-y-1">
                                    <div><span class="font-medium">TA:</span> 115/75 mmHg</div>
                                    <div><span class="font-medium">FC:</span> 68 bpm</div>
                                    <div><span class="font-medium">Temp:</span> 37.2°C</div>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <span class="px-2 py-1 inline-flex text-xs leading-5 font-semibold rounded-full bg-yellow-100 text-yellow-800">
                                    En attente
                                </span>
                            </td>
                        </tr>
                        <tr class="hover:bg-gray-50">
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="text-sm font-medium text-gray-900">Mohammed Kadiri</div>
                                <div class="text-sm text-gray-500">58 ans</div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">1 67 01 20 345 678</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">08:45</td>
                            <td class="px-6 py-4">
                                <div class="text-xs space-y-1">
                                    <div><span class="font-medium">TA:</span> 140/90 mmHg</div>
                                    <div><span class="font-medium">FC:</span> 85 bpm</div>
                                    <div><span class="font-medium">Temp:</span> 36.5°C</div>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <span class="px-2 py-1 inline-flex text-xs leading-5 font-semibold rounded-full bg-yellow-100 text-yellow-800">
                                    En attente
                                </span>
                            </td>
                        </tr>
                        <tr class="hover:bg-gray-50">
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="text-sm font-medium text-gray-900">Samira Benjelloun</div>
                                <div class="text-sm text-gray-500">27 ans</div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">2 98 04 10 456 789</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">09:00</td>
                            <td class="px-6 py-4">
                                <div class="text-xs space-y-1">
                                    <div><span class="font-medium">TA:</span> 110/70 mmHg</div>
                                    <div><span class="font-medium">FC:</span> 65 bpm</div>
                                    <div><span class="font-medium">Temp:</span> 36.9°C</div>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <span class="px-2 py-1 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
                                    En consultation
                                </span>
                            </td>
                        </tr>
                        <tr class="hover:bg-gray-50">
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="text-sm font-medium text-gray-900">Youssef Alami</div>
                                <div class="text-sm text-gray-500">51 ans</div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">1 72 08 18 567 890</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">09:15</td>
                            <td class="px-6 py-4">
                                <div class="text-xs space-y-1">
                                    <div><span class="font-medium">TA:</span> 125/82 mmHg</div>
                                    <div><span class="font-medium">FC:</span> 78 bpm</div>
                                    <div><span class="font-medium">Temp:</span> 37.0°C</div>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <span class="px-2 py-1 inline-flex text-xs leading-5 font-semibold rounded-full bg-yellow-100 text-yellow-800">
                                    En attente
                                </span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
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

                <form action="${pageContext.request.contextPath}/findAll" method="GET" class="flex gap-2">
                    <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded-lg font-medium transition">
                        Rechercher
                    </button>
                </form>
            </div>



            <form class="space-y-6" action="${pageContext.request.contextPath}/dashboard/infirmier/save" method="POST">
                <!-- Personal Information -->
                <div class="border-b border-gray-200 pb-6">
                    <h4 class="text-lg font-medium text-gray-900 mb-4">Informations Personnelles</h4>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Nom *</label>
                            <input type="text" name="nom" required class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Prénom *</label>
                            <input type="text" name="prenom" required class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Date de naissance *</label>
                            <input type="date" name="dateNaissance" required class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">N° Sécurité Sociale *</label>
                            <input type="text" name="num_secu_cos" required class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Téléphone</label>
                            <input name="tele" type="tel" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                        </div>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="flex justify-end gap-3 pt-4 border-t border-gray-200">
                    <button type="button" onclick="closeModal()" class="px-6 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50 font-medium transition">
                        Annuler
                    </button>
                    <button type="submit" class="px-6 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg font-medium transition">
                        Enregistrer et Ajouter à la File d'Attente
                    </button>
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