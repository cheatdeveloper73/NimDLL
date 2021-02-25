# --gc:arc --NoMain --app:lib --cpu:i386
import winim/com
import winim

#proc mainThread(hModule: HINSTANCE) =
#    AllocConsole()
#    discard stdout.reopen("CONOUT$", fmWrite)
#    MessageBox(0, "Sucessful Injection.", 0)

proc NimMain() {.cdecl, importc.}

proc DllMain(hModule: HINSTANCE, reasonForCall: DWORD, lpReserved: LPVOID): WINBOOL {.exportc, dynlib, stdcall.} =

    case reasonForCall

        of DLL_PROCESS_ATTACH:
            NimMain()
            DisableThreadLibraryCalls(hModule)
            #CreateThread(nil, nil, cast[LPTHREAD_START_ROUTINE](mainThread), cast[LPVOID](hModule), nil, nil)
            MessageBox(0, "Sucessful Injection.")

        of DLL_PROCESS_DETACH:
            discard
        of DLL_THREAD_ATTACH:
            discard
        of DLL_THREAD_DETACH:
            discard
        else:
            discard
    return TRUE
