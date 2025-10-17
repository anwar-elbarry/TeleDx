<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <h1 class="text-2xl font-semibold text-gray-900 mb-6">Éditer Patient</h1>

    <form action="${pageContext.request.contextPath}/dashboard/infirmier/update" method="POST" class="space-y-6">
        <input type="hidden" name="id" value="${patient.id}" />

        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
                <label class="block text-sm font-medium text-gray-700">Nom</label>
                <input type="text" name="nom" value="${patient.nom}" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" />
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Prénom</label>
                <input type="text" name="prenom" value="${patient.prenom}" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" />
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Date de Naissance</label>
                <input type="date" name="dateNaissance" value="${patient.date_naissance}" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" />
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Téléphone</label>
                <input type="tel" name="telephone" value="${patient.telephone}" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" />
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Email</label>
                <input type="email" name="email" value="${patient.email}" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" />
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">N° Sécurité Sociale</label>
                <input type="text" name="numSecu" value="${patient.num_securite_soc}" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" />
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Adresse</label>
                <input type="text" name="adresse" value="${patient.adresse}" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" />
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Ville</label>
                <input type="text" name="ville" value="${patient.ville}" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" />
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Code Postal</label>
                <input type="text" name="codePostal" value="${patient.codePostal}" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" />
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Mutuelle</label>
                <input type="text" name="mutuelle" value="${patient.mutuelle}" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" />
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">N° Mutuelle</label>
                <input type="text" name="numMutuelle" value="${patient.numMutuelle}" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" />
            </div>
        </div>

        <div class="grid grid-cols-1 gap-4">
            <div>
                <label class="block text-sm font-medium text-gray-700">Antécédents</label>
                <textarea name="antecedents" rows="3" class="mt-1 block w-full p-2 border border-gray-300 rounded-md">${patient.antecedents}</textarea>
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Allergies</label>
                <textarea name="allergies" rows="3" class="mt-1 block w-full p-2 border border-gray-300 rounded-md">${patient.allergies}</textarea>
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Traitements en cours</label>
                <textarea name="traitements" rows="3" class="mt-1 block w-full p-2 border border-gray-300 rounded-md">${patient.traitementsEnCours}</textarea>
            </div>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
                <label class="block text-sm font-medium text-gray-700">Groupe Sanguin</label>
                <input type="text" name="groupeSanguin" value="${patient.groupeSanguin}" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" />
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Poids (kg)</label>
                <input type="number" step="0.1" name="poids" value="${patient.poids}" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" />
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Taille (cm)</label>
                <input type="number" step="0.1" name="taille" value="${patient.taille}" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" />
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Température (°C)</label>
                <input type="number" step="0.1" name="temperature" value="${patient.temperature}" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" />
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Tension Artérielle</label>
                <input type="text" name="tension" value="${patient.tensionArterielle}" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" />
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Fréq. Cardiaque (bpm)</label>
                <input type="number" name="freqCardiaque" value="${patient.frequenceCardiaque}" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" />
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Fréq. Respiratoire (resp/min)</label>
                <input type="number" name="freqRespiratoire" value="${patient.frequenceRespiratoire}" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" />
            </div>
        </div>

        <div class="pt-4">
            <button type="submit" class="bg-indigo-600 text-white px-6 py-2 rounded-md hover:bg-indigo-700">Enregistrer</button>
            <a href="${pageContext.request.contextPath}/dashboard/infirmier" class="ml-3 px-6 py-2 border rounded-md">Annuler</a>
        </div>
    </form>
</div>

