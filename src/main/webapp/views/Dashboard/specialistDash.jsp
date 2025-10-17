<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <!-- Stats Cards -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
            <div class="bg-white rounded-lg shadow p-6">
                <div class="flex items-center">
                    <div class="flex-shrink-0 bg-orange-100 rounded-full p-3">
                        <svg class="w-6 h-6 text-orange-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                        </svg>
                    </div>
                    <div class="ml-4">
                        <p class="text-sm font-medium text-gray-600">En attente</p>
                        <p class="text-2xl font-bold text-gray-900">5</p>
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
                        <p class="text-sm font-medium text-gray-600">Traitées</p>
                        <p class="text-2xl font-bold text-gray-900">23</p>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow p-6">
                <div class="flex items-center">
                    <div class="flex-shrink-0 bg-blue-100 rounded-full p-3">
                        <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                        </svg>
                    </div>
                    <div class="ml-4">
                        <p class="text-sm font-medium text-gray-600">Créneaux libres</p>
                        <p class="text-2xl font-bold text-gray-900">12</p>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow p-6">
                <div class="flex items-center">
                    <div class="flex-shrink-0 bg-purple-100 rounded-full p-3">
                        <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                        </svg>
                    </div>
                    <div class="ml-4">
                        <p class="text-sm font-medium text-gray-600">Revenus mois</p>
                        <p class="text-2xl font-bold text-gray-900">18,900 DH</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Tabs -->
        <div class="mb-6">
            <div class="border-b border-gray-200">
                <nav class="-mb-px flex space-x-8">
                    <button onclick="switchTab('expertises')" id="tab-expertises" class="tab-active border-b-2 border-purple-500 py-4 px-1 text-sm font-medium text-purple-600">
                        Demandes d'Expertise
                    </button>
                    <button onclick="switchTab('schedule')" id="tab-schedule" class="tab-inactive border-b-2 border-transparent py-4 px-1 text-sm font-medium text-gray-500 hover:text-gray-700 hover:border-gray-300">
                        Mes Créneaux
                    </button>
                    <button onclick="switchTab('history')" id="tab-history" class="tab-inactive border-b-2 border-transparent py-4 px-1 text-sm font-medium text-gray-500 hover:text-gray-700 hover:border-gray-300">
                        Historique
                    </button>
                </nav>
            </div>
        </div>

        <!-- Expertises Tab -->
        <div id="content-expertises" class="tab-content">
            <!-- Filters -->
            <div class="bg-white rounded-lg shadow p-4 mb-6">
                <div class="flex flex-wrap gap-4">
                    <div>
                        <label class="block text-xs font-medium text-gray-700 mb-1">Statut</label>
                        <select onchange="filterExpertises()" class="px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-purple-500">
                            <option value="">Tous</option>
                            <option value="EN_ATTENTE">En attente</option>
                            <option value="TERMINEE">Terminée</option>
                        </select>
                    </div>
                    <div>
                        <label class="block text-xs font-medium text-gray-700 mb-1">Priorité</label>
                        <select onchange="filterExpertises()" class="px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-purple-500">
                            <option value="">Toutes</option>
                            <option value="URGENTE">Urgente</option>
                            <option value="NORMALE">Normale</option>
                            <option value="NON_URGENTE">Non urgente</option>
                        </select>
                    </div>
                    <div class="flex items-end">
                        <button onclick="filterExpertises()" class="bg-purple-600 hover:bg-purple-700 text-white px-4 py-2 rounded-lg text-sm font-medium transition">
                            Filtrer
                        </button>
                    </div>
                </div>
            </div>

            <div class="space-y-4">
                <!-- Expertise Card 1 - URGENTE -->
                <div class="bg-white rounded-lg shadow overflow-hidden border-l-4 border-red-500">
                    <div class="p-6">
                        <div class="flex justify-between items-start mb-4">
                            <div class="flex-1">
                                <div class="flex items-center gap-3 mb-2">
                                    <h3 class="text-lg font-semibold text-gray-900">Samira Benjelloun</h3>
                                    <span class="px-2 py-1 text-xs font-semibold rounded-full bg-yellow-100 text-yellow-800">EN ATTENTE</span>
                                    <span class="px-2 py-1 text-xs font-semibold rounded-full bg-red-100 text-red-800">URGENTE</span>
                                </div>
                                <p class="text-sm text-gray-600 mb-3">27 ans • Demande reçue le 11/10/2025 à 09:15</p>

                                <div class="grid grid-cols-2 gap-4 mb-4">
                                    <div>
                                        <p class="text-xs font-medium text-gray-500 mb-1">Médecin Généraliste</p>
                                        <p class="text-sm text-gray-900">Dr. Hassan Tazi</p>
                                    </div>
                                    <div>
                                        <p class="text-xs font-medium text-gray-500 mb-1">Créneau</p>
                                        <p class="text-sm text-gray-900">11/10/2025 - 14:00 - 14:30</p>
                                    </div>
                                </div>

                                <div class="bg-gray-50 p-4 rounded-lg mb-4">
                                    <p class="text-sm font-medium text-gray-700 mb-2">Question posée:</p>
                                    <p class="text-sm text-gray-600">Patiente présente une éruption cutanée avec desquamation depuis 3 semaines. Pas de réponse aux corticoïdes topiques. Diagnostic différentiel entre eczéma et psoriasis? Photos jointes dans le dossier.</p>
                                </div>

                                <div class="bg-blue-50 p-4 rounded-lg">
                                    <p class="text-sm font-medium text-gray-700 mb-2">Informations patient:</p>
                                    <div class="grid grid-cols-2 gap-3 text-sm text-gray-600">
                                        <div><strong>Signes vitaux:</strong> TA: 110/70, Temp: 36.9°C</div>
                                        <div><strong>Allergies:</strong> Aucune connue</div>
                                        <div><strong>Antécédents:</strong> Rien à signaler</div>
                                        <div><strong>Traitements:</strong> Dermocorticoïde en cours</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="flex justify-between items-center pt-4 border-t border-gray-200">
                            <p class="text-lg font-bold text-purple-600">300 DH</p>
                            <button onclick="respondExpertise(1)" class="bg-purple-600 hover:bg-purple-700 text-white px-6 py-2 rounded-lg font-medium transition">
                                Répondre
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Expertise Card 2 - NORMALE -->
                <div class="bg-white rounded-lg shadow overflow-hidden border-l-4 border-blue-500">
                    <div class="p-6">
                        <div class="flex justify-between items-start mb-4">
                            <div class="flex-1">
                                <div class="flex items-center gap-3 mb-2">
                                    <h3 class="text-lg font-semibold text-gray-900">Fatima El Amrani</h3>
                                    <span class="px-2 py-1 text-xs font-semibold rounded-full bg-yellow-100 text-yellow-800">EN ATTENTE</span>
                                    <span class="px-2 py-1 text-xs font-semibold rounded-full bg-blue-100 text-blue-800">NORMALE</span>
                                </div>
                                <p class="text-sm text-gray-600 mb-3">32 ans • Demande reçue le 11/10/2025 à 10:30</p>

                                <div class="grid grid-cols-2 gap-4 mb-4">
                                    <div>
                                        <p class="text-xs font-medium text-gray-500 mb-1">Médecin Généraliste</p>
                                        <p class="text-sm text-gray-900">Dr. Karim Idrissi</p>
                                    </div>
                                    <div>
                                        <p class="text-xs font-medium text-gray-500 mb-1">Créneau</p>
                                        <p class="text-sm text-gray-900">12/10/2025 - 10:00 - 10:30</p>
                                    </div>
                                </div>

                                <div class="bg-gray-50 p-4 rounded-lg mb-4">
                                    <p class="text-sm font-medium text-gray-700 mb-2">Question posée:</p>
                                    <p class="text-sm text-gray-600">Acné kystique résistante aux traitements locaux. Envisager isotrétinoïne? Bilan hépatique et lipidique joints.</p>
                                </div>

                                <div class="bg-blue-50 p-4 rounded-lg">
                                    <p class="text-sm font-medium text-gray-700 mb-2">Données et analyses:</p>
                                    <p class="text-sm text-gray-600">Bilan hépatique normal. Cholestérol: 1.8g/L. Triglycérides: 0.9g/L. Échographie hépatique normale.</p>
                                </div>
                            </div>
                        </div>

                        <div class="flex justify-between items-center pt-4 border-t border-gray-200">
                            <p class="text-lg font-bold text-purple-600">300 DH</p>
                            <button onclick="respondExpertise(2)" class="bg-purple-600 hover:bg-purple-700 text-white px-6 py-2 rounded-lg font-medium transition">
                                Répondre
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Expertise Card 3 - NON URGENTE -->
                <div class="bg-white rounded-lg shadow overflow-hidden border-l-4 border-green-500">
                    <div class="p-6">
                        <div class="flex justify-between items-start mb-4">
                            <div class="flex-1">
                                <div class="flex items-center gap-3 mb-2">
                                    <h3 class="text-lg font-semibold text-gray-900">Mohammed Alami</h3>
                                    <span class="px-2 py-1 text-xs font-semibold rounded-full bg-yellow-100 text-yellow-800">EN ATTENTE</span>
                                    <span class="px-2 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">NON URGENTE</span>
                                </div>
                                <p class="text-sm text-gray-600 mb-3">52 ans • Demande reçue le 10/10/2025 à 16:45</p>

                                <div class="grid grid-cols-2 gap-4 mb-4">
                                    <div>
                                        <p class="text-xs font-medium text-gray-500 mb-1">Médecin Généraliste</p>
                                        <p class="text-sm text-gray-900">Dr. Hassan Tazi</p>
                                    </div>
                                    <div>
                                        <p class="text-xs font-medium text-gray-500 mb-1">Créneau</p>
                                        <p class="text-sm text-gray-900">13/10/2025 - 15:00 - 15:30</p>
                                    </div>
                                </div>

                                <div class="bg-gray-50 p-4 rounded-lg">
                                    <p class="text-sm font-medium text-gray-700 mb-2">Question posée:</p>
                                    <p class="text-sm text-gray-600">Grain de beauté suspect sur le dos, évolution depuis 6 mois. Critères ABCDE: asymétrie et bords irréguliers. Avis pour biopsie?</p>
                                </div>
                            </div>
                        </div>

                        <div class="flex justify-between items-center pt-4 border-t border-gray-200">
                            <p class="text-lg font-bold text-purple-600">300 DH</p>
                            <button onclick="respondExpertise(3)" class="bg-purple-600 hover:bg-purple-700 text-white px-6 py-2 rounded-lg font-medium transition">
                                Répondre
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Schedule Tab -->
        <div id="content-schedule" class="tab-content hidden">
            <div class="bg-white rounded-lg shadow overflow-hidden">
                <div class="px-6 py-4 border-b border-gray-200">
                    <h2 class="text-lg font-semibold text-gray-900">Mes Créneaux Horaires</h2>
                    <p class="text-sm text-gray-600 mt-1">Durée de consultation: 30 minutes • Tarif: 300 DH</p>
                </div>

                <div class="p-6">
                    <!-- Date Selector -->
                    <div class="mb-6 flex gap-4">
                        <button class="px-4 py-2 bg-purple-600 text-white rounded-lg font-medium">Aujourd'hui</button>
                        <button class="px-4 py-2 bg-gray-200 text-gray-700 rounded-lg font-medium hover:bg-gray-300">Demain</button>
                        <button class="px-4 py-2 bg-gray-200 text-gray-700 rounded-lg font-medium hover:bg-gray-300">12/10/2025</button>
                    </div>

                    <!-- Time Slots Grid -->
                    <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                        <!-- Morning Slots -->
                        <div class="border-2 border-green-500 bg-green-50 rounded-lg p-4">
                            <div class="flex items-center justify-between mb-2">
                                <span class="text-sm font-semibold text-gray-900">09:00 - 09:30</span>
                                <span class="w-3 h-3 bg-green-500 rounded-full"></span>
                            </div>
                            <p class="text-xs text-green-700 font-medium">✓ Disponible</p>
                        </div>

                        <div class="border-2 border-green-500 bg-green-50 rounded-lg p-4">
                            <div class="flex items-center justify-between mb-2">
                                <span class="text-sm font-semibold text-gray-900">09:30 - 10:00</span>
                                <span class="w-3 h-3 bg-green-500 rounded-full"></span>
                            </div>
                            <p class="text-xs text-green-700 font-medium">✓ Disponible</p>
                        </div>

                        <div class="border-2 border-red-500 bg-red-50 rounded-lg p-4">
                            <div class="flex items-center justify-between mb-2">
                                <span class="text-sm font-semibold text-gray-900">10:00 - 10:30</span>
                                <span class="w-3 h-3 bg-red-500 rounded-full"></span>
                            </div>
                            <p class="text-xs text-red-700 font-medium">✗ Réservé</p>
                            <p class="text-xs text-gray-600 mt-1">Fatima El Amrani</p>
                        </div>

                        <div class="border-2 border-green-500 bg-green-50 rounded-lg p-4">
                            <div class="flex items-center justify-between mb-2">
                                <span class="text-sm font-semibold text-gray-900">10:30 - 11:00</span>
                                <span class="w-3 h-3 bg-green-500 rounded-full"></span>
                            </div>
                            <p class="text-xs text-green-700 font-medium">✓ Disponible</p>
                        </div>

                        <div class="border-2 border-green-500 bg-green-50 rounded-lg p-4">
                            <div class="flex items-center justify-between mb-2">
                                <span class="text-sm font-semibold text-gray-900">11:00 - 11:30</span>
                                <span class="w-3 h-3 bg-green-500 rounded-full"></span>
                            </div>
                            <p class="text-xs text-green-700 font-medium">✓ Disponible</p>
                        </div>

                        <div class="border-2 border-green-500 bg-green-50 rounded-lg p-4">
                            <div class="flex items-center justify-between mb-2">
                                <span class="text-sm font-semibold text-gray-900">11:30 - 12:00</span>
                                <span class="w-3 h-3 bg-green-500 rounded-full"></span>
                            </div>
                            <p class="text-xs text-green-700 font-medium">✓ Disponible</p>
                        </div>

                        <!-- Afternoon Slots -->
                        <div class="border-2 border-red-500 bg-red-50 rounded-lg p-4">
                            <div class="flex items-center justify-between mb-2">
                                <span class="text-sm font-semibold text-gray-900">14:00 - 14:30</span>
                                <span class="w-3 h-3 bg-red-500 rounded-full"></span>
                            </div>
                            <p class="text-xs text-red-700 font-medium">✗ Réservé</p>
                            <p class="text-xs text-gray-600 mt-1">Samira Benjelloun</p>
                        </div>

                        <div class="border-2 border-green-500 bg-green-50 rounded-lg p-4">
                            <div class="flex items-center justify-between mb-2">
                                <span class="text-sm font-semibold text-gray-900">14:30 - 15:00</span>
                                <span class="w-3 h-3 bg-green-500 rounded-full"></span>
                            </div>
                            <p class="text-xs text-green-700 font-medium">✓ Disponible</p>
                        </div>

                        <div class="border-2 border-green-500 bg-green-50 rounded-lg p-4">
                            <div class="flex items-center justify-between mb-2">
                                <span class="text-sm font-semibold text-gray-900">15:00 - 15:30</span>
                                <span class="w-3 h-3 bg-green-500 rounded-full"></span>
                            </div>
                            <p class="text-xs text-green-700 font-medium">✓ Disponible</p>
                        </div>

                        <div class="border-2 border-green-500 bg-green-50 rounded-lg p-4">
                            <div class="flex items-center justify-between mb-2">
                                <span class="text-sm font-semibold text-gray-900">15:30 - 16:00</span>
                                <span class="w-3 h-3 bg-green-500 rounded-full"></span>
                            </div>
                            <p class="text-xs text-green-700 font-medium">✓ Disponible</p>
                        </div>

                        <div class="border-2 border-gray-300 bg-gray-100 rounded-lg p-4 opacity-50">
                            <div class="flex items-center justify-between mb-2">
                                <span class="text-sm font-semibold text-gray-500">16:00 - 16:30</span>
                                <span class="w-3 h-3 bg-gray-400 rounded-full"></span>
                            </div>
                            <p class="text-xs text-gray-500 font-medium">Passé</p>
                        </div>

                        <div class="border-2 border-gray-300 bg-gray-100 rounded-lg p-4 opacity-50">
                            <div class="flex items-center justify-between mb-2">
                                <span class="text-sm font-semibold text-gray-500">16:30 - 17:00</span>
                                <span class="w-3 h-3 bg-gray-400 rounded-full"></span>
                            </div>
                            <p class="text-xs text-gray-500 font-medium">Passé</p>
                        </div>
                    </div>

                    <!-- Legend -->
                    <div class="mt-6 flex gap-6">
                        <div class="flex items-center gap-2">
                            <span class="w-4 h-4 bg-green-500 rounded-full"></span>
                            <span class="text-sm text-gray-700">Disponible</span>
                        </div>
                        <div class="flex items-center gap-2">
                            <span class="w-4 h-4 bg-red-500 rounded-full"></span>
                            <span class="text-sm text-gray-700">Réservé</span>
                        </div>
                        <div class="flex items-center gap-2">
                            <span class="w-4 h-4 bg-gray-400 rounded-full"></span>
                            <span class="text-sm text-gray-700">Passé</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- History Tab -->
        <div id="content-history" class="tab-content hidden">
            <div class="bg-white rounded-lg shadow overflow-hidden">
                <div class="px-6 py-4 border-b border-gray-200">
                    <h2 class="text-lg font-semibold text-gray-900">Historique des Expertises</h2>
                </div>
                <div class="divide-y divide-gray-200">
                    <!-- History Item 1 -->
                    <div class="p-6 hover:bg-gray-50">
                        <div class="flex justify-between items-start">
                            <div class="flex-1">
                                <div class="flex items-center gap-3 mb-2">
                                    <h3 class="text-lg font-semibold text-gray-900">Hassan Idrissi</h3>
                                    <span class="px-2 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">TERMINÉE</span>
                                </div>
                                <p class="text-sm text-gray-600 mb-3">62 ans • Traité le 10/10/2025</p>

                                <div class="bg-gray-50 p-4 rounded-lg mb-3">
                                    <p class="text-sm font-medium text-gray-700 mb-2">Question:</p>
                                    <p class="text-sm text-gray-600">Grain de beauté suspect, évolution récente, avis pour biopsie?</p>
                                </div>

                                <div class="bg-green-50 p-4 rounded-lg">
                                    <p class="text-sm font-medium text-gray-700 mb-2">Votre avis:</p>
                                    <p class="text-sm text-gray-600">Lésion suspecte avec critères ABCDE positifs. Je recommande une biopsie excisionnelle urgente. Orientation vers chirurgie dermatologique dans les 48h.</p>
                                </div>
                            </div>
                            <div class="text-right">
                                <p class="text-lg font-bold text-gray-900">300 DH</p>
                            </div>
                        </div>
                    </div>

                    <!-- History Item 2 -->
                    <div class="p-6 hover:bg-gray-50">
                        <div class="flex justify-between items-start">
                            <div class="flex-1">
                                <div class="flex items-center gap-3 mb-2">
                                    <h3 class="text-lg font-semibold text-gray-900">Zineb Alaoui</h3>
                                    <span class="px-2 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">TERMINÉE</span>
                                </div>
                                <p class="text-sm text-gray-600 mb-3">35 ans • Traité le 09/10/2025</p>

                                <div class="bg-gray-50 p-4 rounded-lg mb-3">
                                    <p class="text-sm font-medium text-gray-700 mb-2">Question:</p>
                                    <p class="text-sm text-gray-600">Chute de cheveux importante post-partum, traitement adapté?</p>
                                </div>

                                <div class="bg-green-50 p-4 rounded-lg">
                                    <p class="text-sm font-medium text-gray-700 mb-2">Votre avis:</p>
                                    <p class="text-sm text-gray-600">Effluvium télogène post-partum classique. Traitement: compléments alimentaires (Biotine, Zinc, Fer si carence). Évolution spontanée favorable en 6-12 mois. Rassurer la patiente.</p>
                                </div>
                            </div>
                            <div class="text-right">
                                <p class="text-lg font-bold text-gray-900">300 DH</p>
                            </div>
                        </div>
                    </div>

                    <!-- History Item 3 -->
                    <div class="p-6 hover:bg-gray-50">
                        <div class="flex justify-between items-start">
                            <div class="flex-1">
                                <div class="flex items-center gap-3 mb-2">
                                    <h3 class="text-lg font-semibold text-gray-900">Omar Benjelloun</h3>
                                    <span class="px-2 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">TERMINÉE</span>
                                </div>
                                <p class="text-sm text-gray-600 mb-3">19 ans • Traité le 08/10/2025</p>

                                <div class="bg-gray-50 p-4 rounded-lg mb-3">
                                    <p class="text-sm font-medium text-gray-700 mb-2">Question:</p>
                                    <p class="text-sm text-gray-600">Acné sévère nodulaire résistant aux antibiotiques, indication isotrétinoïne?</p>
                                </div>

                                <div class="bg-green-50 p-4 rounded-lg">
                                    <p class="text-sm font-medium text-gray-700 mb-2">Votre avis:</p>
                                    <p class="text-sm text-gray-600">Indication formelle d'isotrétinoïne. Bilan pré-thérapeutique complet nécessaire. Prescription initiale 0.5mg/kg/j. Surveillance mensuelle hépatique et lipidique. Contraception obligatoire si femme.</p>
                                </div>
                            </div>
                            <div class="text-right">
                                <p class="text-lg font-bold text-gray-900">300 DH</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Profile Configuration Modal -->
    <div id="profileModal" class="hidden fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full z-50">
        <div class="relative top-20 mx-auto p-5 border w-full max-w-2xl shadow-lg rounded-md bg-white">
            <div class="flex justify-between items-center mb-4">
                <h3 class="text-xl font-semibold text-gray-900">Configuration du Profil</h3>
                <button onclick="closeProfileModal()" class="text-gray-400 hover:text-gray-600">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                    </svg>
                </button>
            </div>

            <form class="space-y-6">
                <div class="bg-purple-50 p-4 rounded-lg">
                    <div class="flex items-center gap-3">
                        <div class="bg-purple-100 rounded-full p-3">
                            <svg class="w-8 h-8 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                            </svg>
                        </div>
                        <div>
                            <h4 class="font-semibold text-gray-900">Dr. Laila Bennani</h4>
                            <p class="text-sm text-gray-600">Médecin Spécialiste</p>
                        </div>
                    </div>
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Spécialité médicale *</label>
                    <select class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent">
                        <option value="">-- Sélectionner --</option>
                        <option value="cardiologie">Cardiologie</option>
                        <option value="dermatologie" selected>Dermatologie</option>
                        <option value="pneumologie">Pneumologie</option>
                        <option value="neurologie">Neurologie</option>
                        <option value="endocrinologie">Endocrinologie</option>
                        <option value="gastro">Gastro-entérologie</option>
                        <option value="rhumatologie">Rhumatologie</option>
                        <option value="pediatrie">Pédiatrie</option>
                        <option value="ophtalmologie">Ophtalmologie</option>
                    </select>
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Tarif de consultation (DH) *</label>
                    <div class="relative">
                        <input type="number" value="300" min="100" step="50" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent">
                        <span class="absolute right-4 top-2 text-gray-500">DH</span>
                    </div>
                    <p class="text-xs text-gray-500 mt-1">Tarif par consultation de 30 minutes</p>
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Durée moyenne de consultation</label>
                    <div class="relative">
                        <input type="number" value="30" readonly class="w-full px-4 py-2 border border-gray-300 rounded-lg bg-gray-100 cursor-not-allowed">
                        <span class="absolute right-4 top-2 text-gray-500">minutes</span>
                    </div>
                    <p class="text-xs text-gray-500 mt-1">Durée fixe à 30 minutes</p>
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Années d'expérience</label>
                    <input type="number" value="15" min="0" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent">
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Bio professionnelle</label>
                    <textarea rows="4" placeholder="Décrivez votre parcours, vos domaines d'expertise..." class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent">Dermatologue spécialisée en dermatologie médicale et esthétique. Expérience de 15 ans dans le traitement des pathologies cutanées complexes.</textarea>
                </div>

                <div class="flex justify-end gap-3 pt-4 border-t border-gray-200">
                    <button type="button" onclick="closeProfileModal()" class="px-6 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50 font-medium transition">
                        Annuler
                    </button>
                    <button type="submit" class="px-6 py-2 bg-purple-600 hover:bg-purple-700 text-white rounded-lg font-medium transition">
                        Enregistrer les modifications
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Respond to Expertise Modal -->
    <div id="respondModal" class="hidden fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full z-50">
        <div class="relative top-20 mx-auto p-5 border w-full max-w-4xl shadow-lg rounded-md bg-white mb-20">
            <div class="flex justify-between items-center mb-4">
                <h3 class="text-xl font-semibold text-gray-900">Répondre à la Demande d'Expertise</h3>
                <button onclick="closeRespondModal()" class="text-gray-400 hover:text-gray-600">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                    </svg>
                </button>
            </div>

            <form class="space-y-6">
                <!-- Patient Info Summary -->
                <div class="bg-blue-50 p-4 rounded-lg">
                    <h4 class="font-semibold text-gray-900 mb-3">Informations du patient</h4>
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <p class="text-sm text-gray-600">Patient:</p>
                            <p class="text-sm font-medium text-gray-900">Samira Benjelloun, 27 ans</p>
                        </div>
                        <div>
                            <p class="text-sm text-gray-600">Médecin demandeur:</p>
                            <p class="text-sm font-medium text-gray-900">Dr. Hassan Tazi</p>
                        </div>
                        <div>
                            <p class="text-sm text-gray-600">Priorité:</p>
                            <p class="text-sm font-medium text-red-600">URGENTE</p>
                        </div>
                        <div>
                            <p class="text-sm text-gray-600">Créneau:</p>
                            <p class="text-sm font-medium text-gray-900">11/10/2025 - 14:00</p>
                        </div>
                    </div>
                </div>

                <!-- Question Asked -->
                <div class="bg-gray-50 p-4 rounded-lg">
                    <h4 class="font-semibold text-gray-900 mb-2">Question posée:</h4>
                    <p class="text-sm text-gray-600">Patiente présente une éruption cutanée avec desquamation depuis 3 semaines. Pas de réponse aux corticoïdes topiques. Diagnostic différentiel entre eczéma et psoriasis? Photos jointes dans le dossier.</p>
                </div>

                <!-- Medical Opinion -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Avis médical *</label>
                    <textarea rows="6" placeholder="Votre diagnostic, analyse et conclusions..." class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent" required></textarea>
                    <p class="text-xs text-gray-500 mt-1">Fournissez votre diagnostic et votre analyse détaillée</p>
                </div>

                <!-- Recommendations -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Recommandations *</label>
                    <textarea rows="5" placeholder="Traitement recommandé, examens complémentaires, suivi..." class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent" required></textarea>
                    <p class="text-xs text-gray-500 mt-1">Stratégie thérapeutique et conduite à tenir</p>
                </div>

                <!-- Additional Notes -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Notes complémentaires</label>
                    <textarea rows="3" placeholder="Précisions, mises en garde, informations supplémentaires..." class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent"></textarea>
                </div>

                <!-- Follow-up Options -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Suivi recommandé</label>
                    <div class="space-y-2">
                        <label class="flex items-center gap-2">
                            <input type="checkbox" class="rounded">
                            <span class="text-sm text-gray-700">Consultation de suivi dans 2 semaines</span>
                        </label>
                        <label class="flex items-center gap-2">
                            <input type="checkbox" class="rounded">
                            <span class="text-sm text-gray-700">Examens complémentaires nécessaires</span>
                        </label>
                        <label class="flex items-center gap-2">
                            <input type="checkbox" class="rounded">
                            <span class="text-sm text-gray-700">Orientation vers un autre spécialiste</span>
                        </label>
                    </div>
                </div>

                <!-- Cost Confirmation -->
                <div class="bg-purple-50 p-4 rounded-lg">
                    <div class="flex justify-between items-center">
                        <span class="text-sm font-medium text-gray-700">Honoraires de consultation:</span>
                        <span class="text-2xl font-bold text-purple-600">300 DH</span>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="flex justify-end gap-3 pt-4 border-t border-gray-200">
                    <button type="button" onclick="closeRespondModal()" class="px-6 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50 font-medium transition">
                        Annuler
                    </button>
                    <button type="submit" class="px-6 py-2 bg-green-600 hover:bg-green-700 text-white rounded-lg font-medium transition flex items-center gap-2">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                        </svg>
                        Envoyer l'Avis et Marquer comme Terminée
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Tab Management
        function switchTab(tabName) {
            document.querySelectorAll('.tab-content').forEach(el => el.classList.add('hidden'));

            document.querySelectorAll('[id^="tab-"]').forEach(el => {
                el.classList.remove('tab-active', 'border-purple-500', 'text-purple-600');
                el.classList.add('tab-inactive', 'border-transparent', 'text-gray-500');
            });

            document.getElementById('content-' + tabName).classList.remove('hidden');

            const activeTab = document.getElementById('tab-' + tabName);
            activeTab.classList.remove('tab-inactive', 'border-transparent', 'text-gray-500');
            activeTab.classList.add('tab-active', 'border-purple-500', 'text-purple-600');
        }

        // Modal Management
        function showProfileModal() {
            document.getElementById('profileModal').classList.remove('hidden');
        }

        function closeProfileModal() {
            document.getElementById('profileModal').classList.add('hidden');
        }

        function respondExpertise(id) {
            document.getElementById('respondModal').classList.remove('hidden');
        }

        function closeRespondModal() {
            document.getElementById('respondModal').classList.add('hidden');
        }


        function filterExpertises() {
            alert('Filtrage des expertises appliqué');
        }

        // Close modals when clicking outside
        document.getElementById('profileModal').addEventListener('click', function(e) {
            if(e.target === this) {
                closeProfileModal();
            }
        });

        document.getElementById('respondModal').addEventListener('click', function(e) {
            if(e.target === this) {
                closeRespondModal();
            }
        });

        // Form submission handlers
        document.addEventListener('DOMContentLoaded', function() {
            // Profile form
            const profileForm = document.querySelector('#profileModal form');
            if(profileForm) {
                profileForm.addEventListener('submit', function(e) {
                    e.preventDefault();
                    alert('Profil mis à jour avec succès!');
                    closeProfileModal();
                });
            }

            // Response form
            const respondForm = document.querySelector('#respondModal form');
            if(respondForm) {
                respondForm.addEventListener('submit', function(e) {
                    e.preventDefault();
                    alert('Avis envoyé avec succès! La demande a été marquée comme terminée.');
                    closeRespondModal();
                    // Refresh the page or update the UI
                    location.reload();
                });
            }
        });
    </script>