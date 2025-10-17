<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="user" value="${sessionScope.user}" scope="page" />

<!-- Header -->
<nav class="sticky top-0 z-50 bg-gradient-to-r from-white to-slate-50 shadow-lg border-b border-gray-200">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-20">
            <!-- Logo Section -->
            <div class="flex items-center gap-3 cursor-pointer group">
                <div class="flex-shrink-0 bg-gradient-to-br from-blue-600 to-blue-700 p-2 rounded-xl shadow-lg group-hover:shadow-xl group-hover:scale-105 transition-all duration-200">
                    <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                </div>
                <div class="flex flex-col">
                    <h1 class="text-xl font-bold bg-gradient-to-r from-blue-600 to-blue-700 bg-clip-text text-transparent">
                        Télé-Expertise
                    </h1>
                    <span class="text-xs text-gray-500 font-medium">Système médical</span>
                </div>
            </div>

            <!-- User Section -->
            <div class="flex items-center gap-6">
                <!-- User Info Card -->
                <div class="hidden sm:flex items-center gap-3 bg-slate-100 hover:bg-slate-200 px-4 py-2 rounded-lg transition-colors duration-200">
                    <div class="w-10 h-10 rounded-full bg-gradient-to-br from-blue-600 to-blue-700 flex items-center justify-center text-white font-bold text-sm shadow-md">
                        ${not empty user ? user.username.substring(0, 2).toUpperCase() : 'US'}</div>
                    </div>
                    <div class="flex flex-col">
                        <span id="user-name" class="text-sm font-semibold text-gray-900"></span>
                        <span id="user-role" class="text-xs text-gray-600"></span>
                    </div>
                </div>

                <!-- Mobile User Avatar -->
                <div class="sm:hidden w-10 h-10 rounded-full bg-gradient-to-br from-blue-600 to-blue-700 flex items-center justify-center text-white font-bold text-sm shadow-md">
                    AM
                </div>

                <!-- Logout Button -->
            <form action="${pageContext.request.contextPath}/logout" method="get">
                <button onclick="logout()" class="flex items-center gap-2 bg-gradient-to-r from-red-500 to-red-600 hover:from-red-600 hover:to-red-700 text-white px-4 py-2.5 rounded-lg font-semibold text-sm shadow-lg hover:shadow-xl transform hover:-translate-y-0.5 transition-all duration-200 active:translate-y-0">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
                    </svg>
                    <span class="hidden sm:inline">Déconnexion</span>
                </button>
            </form>
            </div>
        </div>
    </div>
</nav>