project "glfw"
	kind "StaticLib"
	language "C"

	targetdir ("%{wks.location}/Bin/" .. OutputDir .. "/%{prj.name}")
    objdir ("%{wks.location}/Bin-Int/" .. OutputDir .. "/%{prj.name}")

	files {
		"src/context.c",
		"src/egl_context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/null_init.c",
		"src/null_joystick.c",
		"src/null_monitor.c",
		"src/null_window.c",
		"src/osmesa_context.c",
		"src/platform.c",
		"src/vulkan.c",
		"src/wgl_context.c",
		"src/win32_init.c",
		"src/win32_joystick.c",
		"src/win32_module.c",
		"src/win32_monitor.c",
		"src/win32_thread.c",
		"src/win32_time.c",
		"src/win32_window.c",
		"src/window.c"
	}

	includedirs {
		"include/GLFW"
	}

	defines {
		"_GLFW_WIN32",
		"_CRT_SECURE_NO_WARNINGS"
	}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"

	filter "configurations:Dist"
		runtime "Release"
		optimize "On"