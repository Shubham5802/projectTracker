<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- NAVBAR -->
<nav class="bg-gray-800 text-white px-6 py-3 shadow-md">
    <div class="flex items-center justify-between">

        <!-- LEFT SECTION -->
        <div class="flex items-center space-x-6">

            <!-- Brand -->
            <a href="/projects" class="text-xl font-bold hover:text-gray-300">
                IRCTC Project Tracker
            </a>
            
             <!-- ================= Dashboard DROPDOWN ================= -->
            <div class="relative group">
                <button class="hover:text-gray-300 px-2 py-1">
                    Dashboard ▾
                </button>

                <div class="absolute opacity-0 invisible
                            group-hover:opacity-100 group-hover:visible
                            transition-all duration-200
                            bg-white text-gray-800 shadow-lg rounded mt-2 w-48">

                   <a href="/dashboard" class="hover:text-gray-300">Dashboard</a>
                </div>
            </div>

            <!-- ================= PROJECTS DROPDOWN ================= -->
            <div class="relative group">
                <button class="hover:text-gray-300 px-2 py-1">
                    Projects ▾
                </button>

                <div class="absolute opacity-0 invisible
                            group-hover:opacity-100 group-hover:visible
                            transition-all duration-200
                            bg-white text-gray-800 shadow-lg rounded mt-2 w-48">

                    <a href="/projects"
                       class="block px-4 py-2 hover:bg-gray-100">Project List</a>

                    <a href="/projects/create"
                       class="block px-4 py-2 hover:bg-gray-100">Create Project</a>
                </div>
            </div>

            <!-- ================= TEAMS DROPDOWN ================= -->
            <div class="relative group">
                <button class="hover:text-gray-300 px-2 py-1">
                    Teams ▾
                </button>

                <div class="absolute opacity-0 invisible
                            group-hover:opacity-100 group-hover:visible
                            transition-all duration-200
                            bg-white text-gray-800 shadow-lg rounded mt-2 w-48">

                    <a href="/teams"
                       class="block px-4 py-2 hover:bg-gray-100">Team List</a>

                    <a href="/teams/create"
                       class="block px-4 py-2 hover:bg-gray-100">Create Team</a>

                    <!-- Divider -->
                    <!-- <div class="border-t my-1"></div>

                    Nested Label
                    <span class="px-4 py-2 block font-semibold text-gray-600">
                        Members
                    </span>

                    <a href="/members/list"
                       class="block px-4 py-2 hover:bg-gray-100">Member List</a>

                    <a href="/members/create-form"
                       class="block px-4 py-2 hover:bg-gray-100">Add Member</a> -->

                </div>
            </div>
        </div>

        <!-- RIGHT SECTION -->
        <div class="flex items-center space-x-4">
            <span class="text-gray-300 text-sm">v1.0</span>
        </div>

    </div>
</nav>
