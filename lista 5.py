from tkinter import *
import tkinter as tk
from bs4 import BeautifulSoup
import requests
import pickle
from urllib.request import urlopen
import urllib


def internet_check():
    """"Checks if computer is connected to the internet"""
    try:
        urlopen('https://www.google.com/', timeout=1)
    except urllib.error.URLError:
        return("error")



def data_about_exchange():
    """"If computer is connected, it downloads data about exchange and saves it"""
    if internet_check() != "error":  #jesli internet jest, to wtedy pobieram dane, jesli nie, to odczytuje stary plik
        website = requests.get('https://www.nbp.pl/home.aspx?f=/kursy/kursya.html')
        website_html = website.text
        soup = BeautifulSoup(website_html,features="html.parser")
        #print(soup.prettify())
        table = soup.find( "table", {"class": "pad5"} )
        #print(table)
        rows = []
        table_rows = table.find_all('tr')
        file = open("data.txt", 'wb')
        for tr in table_rows[1:]:
            td = tr.find_all('td')
            row = [i.text for i in td]
            rows.append(row)
        pickle.dump(rows, file)
        file.close()
    else:
        pass



def converting(initial, final, amount):
    """"It converts currencies (which are arguments)"""
    file = open("data.txt", 'rb')
    data = pickle.load(file)
    #print(data)
    initial_list = [] #osobno chce sobie wypisac obie waluty, ktore sa podane przez uzytkownika do przeliczenia
    final_list = []
    for i in range(len(data)):
        if initial == data[i][1]:
            initial_list = data[i]
        elif final == data[i][1]:
            final_list = data[i]
        else:
            pass
    if initial_list != []:
        if len(initial_list[1]) == 7:
            initial_list[2] = float(initial_list[2].replace(',', '.'))/100
        elif len(initial_list[1]) == 9:
            initial_list[2] = float(initial_list[2].replace(',', '.'))/10000
    if final_list != []:
        if len(final_list[1]) == 7:
            final_list[2] = float(final_list[2].replace(',', '.'))/100
        elif len(final_list[1]) == 9:
              final_list[2] = float(final_list[2].replace(',', '.'))/10000
    if initial == final: #tutaj warunki na przeliczanie, osobno na PLN bo nie ma ich na stronie NBP
        return amount
    elif initial == '1 PLN':
        good_final_value = float(str(final_list[2]).replace(',', '.'))
        value = amount/good_final_value
        return value
    elif final == '1 PLN':
        good_initial_value = float(str(initial_list[2]).replace(',','.'))
        value = amount*good_initial_value
        return value
    else:
        good_initial_value = float(str(initial_list[2]).replace(',', '.'))
        good_final_value = float(str(final_list[2]).replace(',', '.'))
        value = (amount*good_initial_value)/good_final_value
        return value


def list_of_currencies():
    """"Makes a list of currencies from data.txt"""
    file = open("data.txt", 'rb')
    data = pickle.load(file)
    currencies = []
    for i in range(len(data)):
        currencies.append(data[i][1])
    currencies.sort()
    return currencies




def start_button():
    """"Checks if arguments are correct. When they are it shows a result"""
    arg1=initial_listbox.get(ACTIVE)
    arg2=final_listbox.get(ACTIVE)
    arg3=amount_enter.get()
    try:
        float(arg3)
    except ValueError:
        amount_show.delete(0, END)
        amount_show.insert(0, "Wrong amount")
        return 1
    try:
        int(initial_listbox.curselection()[0])
    except IndexError:
        amount_show.delete(0, END)
        amount_show.insert(0, "Choose currency")
        return 1
    try:
        int(final_listbox.curselection()[0])
    except IndexError:
        amount_show.delete(0, END)
        amount_show.insert(0, "Choose currency")
        return 1
    amount_show.delete(0, END)
    amount_show.insert(0, str(converting(arg1, arg2, float(arg3))))




window = Tk()

window.title("Currency converter")
window.geometry('620x350')


data_about_exchange()



initial_label = Label(window, text="Initial currency:")
initial_label.pack()
initial_label.place(x=10, y=10)


initial_listbox = tk.Listbox(window, exportselection=0)
initial_listbox.insert(1, '1 PLN')
for i in range(len(list_of_currencies())):
    initial_listbox.insert(i+2, list_of_currencies()[i])
initial_listbox.pack()
initial_listbox.place(x=10, y=30)



final_label = Label(window, text="Final currency:")
final_label.pack()
final_label.place(x=200, y=10)



final_listbox = tk.Listbox(window, exportselection=0)
final_listbox.insert(1, '1 PLN')
for i in range(len(list_of_currencies())):
    final_listbox.insert(i+2, list_of_currencies()[i])
final_listbox.pack()
final_listbox.place(x=200, y=30)


amount_label = Label(window, text="Amount:")
amount_label.pack()
amount_label.place(x=390, y=10)



amount_enter = tk.Entry(window)
amount_enter.pack()
amount_enter.place(x=390, y=30)




convert_button = tk.Button(window, text="Convert", command=start_button)
convert_button.pack()
convert_button.place(x=10, y=300)

text_result_label = tk.Label(window, text="The final amount is:")
text_result_label.pack()
text_result_label.place(x=100, y=280)

amount_show = tk.Entry(window)
amount_show.pack()
amount_show.place(x=100, y=300)


end_button = tk.Button(window, text='End', width=15, command=window.destroy)
end_button.pack()
end_button.place(x=500, y=300)

window.mainloop()






