project "glfw"
	kind "StaticLib"
	language "C"

	targetdir ("%{wks.location}/Bin/" .. OutputDir .. "/%{prj.name}")
	objdir ("%{wks.location}/Bin-Int/" .. OutputDir .. "/%{prj.name}")

	defines {
		"_CRT_SECURE_NO_WARNINGS"
	}

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
		"src/platform.c",
		"src/vulkan.c",
		"src/window.c"
	}

	includedirs {
		"include/GLFW"
	}

	filter "system:windows"
		defines {
			"_GLFW_WIN32"
		}

		files {
			"src/wgl_context.c",
			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_module.c",
			"src/win32_monitor.c",
			"src/win32_thread.c",
			"src/win32_time.c",
			"src/win32_window.c"
		}
	
	filter "system:linux"
		defines {
			"_GLFW_X11"
		}

		files {
			"src/egl_context.c",
			"src/glx_context.c",
			"src/linux_joystick.c",
			"src/posix_module.c",
			"src/posix_poll.c",
			"src/posix_time.c",
			"src/posix_thread.c",
			"src/x11_init.c",
			"src/x11_monitor.c",
			"src/x11_window.c",
			"src/xkb_unicode.c"
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
