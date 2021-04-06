import matplotlib
matplotlib.use('TkAgg')
from numpy import *
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from tkinter import *
import tkinter as tk
from matplotlib.figure import Figure



def action(arg):
    """Inserts a pressed button's value into formula box"""
    formula_enter.insert(END, arg)

def function_splitter():
    """Splits functions and returns them in a list"""
    function = formula_enter.get()
    if function == "": #jeśli użytkownik nic nie wpisał, to program nie ma jak zadziałać
        return 1
    else:
        list_of_functions = function.split(";")
        return list_of_functions


def drawer(xfrom, xto, yfrom, yto, title, ylabel, xlabel, legend):
    """Makes a chart"""
    if function_splitter() == 1:
        formula_enter.delete(0, END)
        formula_enter.insert(0, "enter formula")
    else:
        for widget in frame.winfo_children(): #czyszczę ramkę, żeby dodać nowy wykres
            widget.destroy()
        fig = Figure(figsize=(7, 7), facecolor='white') #kolejne parametry do wykresu
        axis = fig.add_subplot(111)
        x = linspace(xfrom, xto, 1000)
        axis.set_ylim(yfrom, yto)
        for i in function_splitter():
            axis.plot(x, eval(i), label=i)
        axis.set_title(title)
        axis.set_ylabel(ylabel)
        axis.set_xlabel(xlabel)
        axis.grid()
        if legend == 1:
            axis.legend()
        else:
            pass
        canvas = FigureCanvasTkAgg(fig, master=frame)
        canvas.get_tk_widget().pack()
        canvas.draw()


def plotter():
    """Checks if arguments passed by a user are correct and plots if they are"""
    try:
        float(xfrom_enter.get()) #najpierw sprawdzę, czy na pewno zakresy się zgadzają
    except ValueError:
        xfrom_enter.delete(0, END)
        xfrom_enter.insert(0, "change it")
        return 1
    try:
        float(xto_enter.get())
    except ValueError:
        xto_enter.delete(0,END)
        xto_enter.insert(0, "change it")
        return 1
    try:
        float(yfrom_enter.get())
    except ValueError:
        yfrom_enter.delete(0, END)
        yfrom_enter.insert(0, "change it")
        return 1
    try:
        float(yto_enter.get())
    except ValueError:
        yto_enter.delete(0, END)
        yto_enter.insert(0, "change it")
        return 1
    try:
        drawer(float(xfrom_enter.get()), float(xto_enter.get()), float(yfrom_enter.get()), float(yto_enter.get()),
               title_enter.get(), ylabel_enter.get(), xlabel_enter.get(), CheckVar1.get())
    except (SyntaxError, NameError, ValueError):
        formula_enter.delete(0, END)
        formula_enter.insert(0, "wrong formula, change it")
        return 1


if __name__ == "__main__":
    window = Tk()

    window.title("Graphs maker")
    window.geometry('1000x650')

    # ramka
    frame = tk.Frame(window)
    frame.pack(side='right')

    formula_label = Label(window, text="Formula:")
    formula_label.pack()
    formula_label.place(x=10, y=10)

    formula_enter = tk.Entry(window, width=40)
    formula_enter.pack()
    formula_enter.place(x=10, y=30)

    # przyciski z funkcjami
    semi_button = tk.Button(window, text=";", width=7, height=1, command=lambda: action(';'))
    semi_button.pack()
    semi_button.place(x=10, y=50)

    power_button = tk.Button(window, text="^", width=7, height=1, command=lambda: action('**'))
    power_button.pack()
    power_button.place(x=70, y=50)

    lbracket_button = tk.Button(window, text="(", width=7, height=1, command=lambda: action('('))
    lbracket_button.pack()
    lbracket_button.place(x=130, y=50)

    rbracket_button = tk.Button(window, text=")", width=7, height=1, command=lambda: action(')'))
    rbracket_button.pack()
    rbracket_button.place(x=190, y=50)

    plus_button = tk.Button(window, text="+", width=7, height=1, command=lambda: action('+'))
    plus_button.pack()
    plus_button.place(x=10, y=80)

    minus_button = tk.Button(window, text="-", width=7, height=1, command=lambda: action('-'))
    minus_button.pack()
    minus_button.place(x=70, y=80)

    minus_button = tk.Button(window, text="-", width=7, height=1, command=lambda: action('-'))
    minus_button.pack()
    minus_button.place(x=70, y=80)

    multi_button = tk.Button(window, text="*", width=7, height=1, command=lambda: action('*'))
    multi_button.pack()
    multi_button.place(x=130, y=80)

    div_button = tk.Button(window, text="/", width=7, height=1, command=lambda: action('/'))
    div_button.pack()
    div_button.place(x=190, y=80)

    sin_button = tk.Button(window, text="sin()", width=7, height=1, command=lambda: action('sin()'))
    sin_button.pack()
    sin_button.place(x=10, y=110)

    cos_button = tk.Button(window, text="cos()", width=7, height=1, command=lambda: action('cos()'))
    cos_button.pack()
    cos_button.place(x=70, y=110)

    tan_button = tk.Button(window, text="tan()", width=7, height=1, command=lambda: action('tan()'))
    tan_button.pack()
    tan_button.place(x=130, y=110)

    ln_button = tk.Button(window, text="log()", width=7, height=1, command=lambda: action('log()'))
    ln_button.pack()
    ln_button.place(x=190, y=110)

    # zakresy na osiach
    xaxis_label = Label(window, text="Range of x axis:")
    xaxis_label.pack()
    xaxis_label.place(x=30, y=170)

    xaxisf_label = Label(window, text="From:")
    xaxisf_label.pack()
    xaxisf_label.place(x=10, y=190)

    xaxist_label = Label(window, text="To:")
    xaxist_label.pack()
    xaxist_label.place(x=100, y=190)

    xfrom_enter = tk.Entry(window, width=10)
    xfrom_enter.pack()
    xfrom_enter.place(x=10, y=220)

    xto_enter = tk.Entry(window, width=10)
    xto_enter.pack()
    xto_enter.place(x=100, y=220)

    yaxis_label = Label(window, text="Range of y axis:")
    yaxis_label.pack()
    yaxis_label.place(x=30, y=260)

    yaxisf_label = Label(window, text="From:")
    yaxisf_label.pack()
    yaxisf_label.place(x=10, y=280)

    yaxist_label = Label(window, text="To:")
    yaxist_label.pack()
    yaxist_label.place(x=100, y=280)

    yfrom_enter = tk.Entry(window, width=10)
    yfrom_enter.pack()
    yfrom_enter.place(x=10, y=310)

    yto_enter = tk.Entry(window, width=10)
    yto_enter.pack()
    yto_enter.place(x=100, y=310)

    # tytuł oraz etykiety osi
    title_label = Label(window, text="Title of chart:")
    title_label.pack()
    title_label.place(x=30, y=340)

    title_enter = tk.Entry(window, width=25)
    title_enter.pack()
    title_enter.place(x=10, y=360)

    xlabel_label = Label(window, text="x label:")
    xlabel_label.pack()
    xlabel_label.place(x=30, y=390)

    xlabel_enter = tk.Entry(window, width=25)
    xlabel_enter.pack()
    xlabel_enter.place(x=10, y=410)

    ylabel_label = Label(window, text="y label:")
    ylabel_label.pack()
    ylabel_label.place(x=30, y=440)

    ylabel_enter = tk.Entry(window, width=25)
    ylabel_enter.pack()
    ylabel_enter.place(x=10, y=460)

    # przycisk do legendy
    CheckVar1 = IntVar()
    legend_check = tk.Checkbutton(window, text="Legend", variable=CheckVar1, onvalue=1, offvalue=0)
    legend_check.pack()
    legend_check.place(x=10, y=500)

    # uruchamiajacy rysowanie
    start_button = tk.Button(window, text="Show me my chart!", command=plotter)
    start_button.pack()
    start_button.place(x=10, y=540)

    # konczacy dzialanie programu
    end_button = tk.Button(window, text='End', width=15, command=window.destroy)
    end_button.pack()
    end_button.place(x=10, y=580)

    window.mainloop()




