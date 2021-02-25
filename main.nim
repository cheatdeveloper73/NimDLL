import winim/com
import winim

proc NimMain() {.cdecl, importc.}

proc DllMain(hModule: HINSTANCE, reasonForCall: DWORD, lpReserved: LPVOID): WINBOOL {.exportc, dynlib, stdcall.} =

    case reasonForCall

        of DLL_PROCESS_ATTACH:
            NimMain()
            DisableThreadLibraryCalls(hModule)
            MessageBox(0, "Injection Sucess!", "Made By Nerdie#1155", 0)

        of DLL_PROCESS_DETACH:
            discard
        of DLL_THREAD_ATTACH:
            discard
        of DLL_THREAD_DETACH:
            discard
        else:
            discard
    return TRUE 
