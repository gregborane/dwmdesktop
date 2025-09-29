import sys
import threading
import tkinter as tk
import pystray
from PIL import Image, ImageDraw


def create_image():
    img = Image.new('RGB', (64, 64), color=(0, 0, 0))
    d = ImageDraw.Draw(img)
    d.rectangle([16, 16, 48, 48], fill=(255, 255, 255))
    return img


class SliderApp:
    def __init__(self):
        self.value = 50
        self.root = None

    def open_slider(self, icon, item):
        if self.root is not None:
            try:
                if self.root.winfo_exists():
                    self.root.deiconify()
                    return
            except:
                pass

        def run_tk():
            self.root = tk.Tk()
            self.root.title("Slider")
            self.root.geometry("250x80")
            self.root.protocol("WM_DELETE_WINDOW", self.root.withdraw)

            slider = tk.Scale(self.root, from_=0, to=100,
                              orient="horizontal", length=200,
                              command=self.set_value)
            slider.set(self.value)
            slider.pack(pady=10)

            self.root.mainloop()

        threading.Thread(target=run_tk, daemon=True).start()

    def set_value(self, val):
        self.value = int(val)


def main():
    app = SliderApp()
    menu = pystray.Menu(
        pystray.MenuItem("Open Slider", app.open_slider),
        pystray.MenuItem("Quit", lambda icon, item: icon.stop())
    )
    icon = pystray.Icon("slider", create_image(), "Slider Tray", menu)
    icon.run()


if __name__ == "__main__":
    main()

