import os
import subprocess
from pynput import keyboard

ctrl_pressed = False
shift_pressed = False
d_pressed = False
m_pressed = False
c_pressed = False


def on_key_press(key):
    try:
        global ctrl_pressed, shift_pressed, d_pressed
        if key == keyboard.Key.ctrl:
            ctrl_pressed = True
        elif key == keyboard.Key.shift:
            shift_pressed = True
        elif key == keyboard.KeyCode.from_char('d'):
            d_pressed = True
        if ctrl_pressed and shift_pressed and d_pressed:
            print("Ctrl+D detected!")
            # Perform your desired action here
            current_path = os.getcwd()
            print(current_path)
            result = subprocess.run(["sh", current_path+"/deploy.sh", "main"])
    except AttributeError:
        pass


def on_key_release(key):
    global ctrl_pressed, shift_pressed, d_pressed, m_pressed, c_pressed

    if key == keyboard.Key.ctrl:
        ctrl_pressed = False
    elif key == keyboard.Key.shift:
        shift_pressed = False
    elif key == keyboard.KeyCode.from_char('d'):
        d_pressed = False
    elif key == keyboard.KeyCode.from_char('m'):
        m_pressed = False
    elif key == keyboard.KeyCode.from_char('c'):
        c_pressed = False


def read_arg_to_run(key):
    if key == keyboard.KeyCode.from_char('m'):
        return "main"
    elif key == keyboard.KeCode.from_char("c"):
        return "core"
    else:
        return "both"

listener = keyboard.Listener(on_press=on_key_press, on_release=on_key_release)
listener.start()

listener.join()  # Wait for the listener to finish
