import tkinter as tk
from math import floor as floor
from time import sleep as wait
'''
Funcionamento:
Gera uma matriz de pixels 640 x 480 e possui 3 botões, um para gerar uma
circunferencia, outro para gerar as letras definidas em uma lista, variando
seus tamanhos e um ultimo para gerar os numeros de 1 a 9, tambem testando
varios tamanhos. Os códigos, usando xpos e ypos como parametros foram feitos
de forma a ficarem o mais proximos possivel do codigo equivalente a ser usado
em VDHL, facilitando ao maximo sua adaptação
'''
n = 100
gap = 10
th = 5
Nx = 640
Ny = 480
r = 25
xpos = 30
contador = 0
ypos = 30
def create_pixels(Nx, Ny, pixel_size):
    pixels = []
    for i in range(Nx):
        row = []
        for j in range(Ny):
            x = i
            y = j
            color = 'black'
            pixel = canvas.create_rectangle(i*pixel_size, j*pixel_size, (i+1)*pixel_size, (j+1)*pixel_size, width=0, fill=color)
            row.append(pixel)
        pixels.append(row)
    return pixels

def create_circle(n, xpos, ypos, r, th):
    xc = xpos + floor(n/2)
    yc = ypos + floor(n/2)
    for xcur in range(xpos, xpos+n):
        for ycur in range(ypos, ypos+n):
            xrc = xcur - xc
            yrc = ycur - yc
            if (r-th/2)**2 < xrc**2 + yrc**2 < (r+th/2)**2:
                canvas.itemconfigure(pixels[xcur][ycur], fill='red')
    return

def create_number(number, xpos, ypos, size):
    if number == 1:
        for xcur in range(xpos, xpos + 4*size + 1):
            for ycur in range(ypos, ypos + 7*size + 1):
                if (((xcur >= xpos + 2*size and xcur < xpos + 3*size) and (ycur >= ypos and ycur < ypos + 7*size)) or
                (((xcur >= xpos + 1*size) and (xcur < xpos + 2*size)) and ((ycur >= ypos + 1*size) and (ycur < ypos + 2*size))) or
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size)))):
                    canvas.itemconfigure(pixels[xcur][ycur], fill='white')
    if number == 2:
        for xcur in range(xpos, xpos + 4*size + 1):
            for ycur in range(ypos, ypos + 7*size + 1):
                if (((ycur >= ypos and ycur < ypos + 1*size) and (xcur >= xpos + 1*size and xcur < xpos + 3*size) or
                    ((ycur >= ypos + 1*size and ycur < ypos + 2*size) and ((xcur >= xpos and xcur < xpos + 1*size) or (xcur >= xpos + 3*size and xcur < xpos + 4*size))) or
                    ((ycur >= ypos + 2*size and ycur < ypos + 3*size) and (xcur >= xpos + 3*size and xcur < xpos + 4*size)) or
                    ((ycur >= ypos + 3*size and ycur < ypos + 4*size) and (xcur >= xpos + 2*size and xcur < xpos + 3*size)) or
                    ((ycur >= ypos + 4*size and ycur < ypos + 5*size) and (xcur >= xpos + 1*size and xcur < xpos + 2*size)) or
                    ((ycur >= ypos + 5*size and ycur < ypos + 6*size) and (xcur >= xpos + 0*size and xcur < xpos + 1*size)) or
                    ((ycur >= ypos + 6*size and ycur < ypos + 7*size) and (xcur >= xpos + 0*size and xcur < xpos + 4*size)))):
                    canvas.itemconfigure(pixels[xcur][ycur], fill='white')
    if number == 3:
        for xcur in range(xpos, xpos + 4*size + 1):
            for ycur in range(ypos, ypos + 7*size + 1):
                if (((ycur >= ypos and ycur < ypos + 1*size) and (xcur >= xpos + 1*size and xcur < xpos + 3*size)) or
                    ((ycur >= ypos + 1*size and ycur < ypos + 2*size) and ((xcur >= xpos and xcur < xpos + 1*size) or (xcur >= xpos + 3*size and xcur < xpos + 4*size))) or
                    ((ycur >= ypos + 2*size and ycur < ypos + 3*size) and (xcur >= xpos + 3*size and xcur < xpos + 4*size)) or
                    ((ycur >= ypos + 3*size and ycur < ypos + 4*size) and (xcur >= xpos + 1*size and xcur < xpos + 3*size)) or
                    ((ycur >= ypos + 4*size and ycur < ypos + 5*size) and (xcur >= xpos + 3*size and xcur < xpos + 4*size)) or
                    ((ycur >= ypos + 5*size and ycur < ypos + 6*size) and ((xcur >= xpos and xcur < xpos + 1*size) or (xcur >= xpos + 3*size and xcur < xpos + 4*size))) or
                    ((ycur >= ypos + 6*size and ycur < ypos + 7*size) and (xcur >= xpos + 1*size and xcur < xpos + 3*size))):
                    canvas.itemconfigure(pixels[xcur][ycur], fill='white')
    if number == 4:
        for xcur in range(xpos, xpos + 4*size + 1):
            for ycur in range(ypos, ypos + 7*size + 1):
                if (((xcur >= xpos + 3*size and xcur < xpos + 4*size) and (ycur >= ypos and ycur < ypos + 7*size)) or
                    ((ycur >= ypos + 3*size and ycur < ypos + 4*size) and ((xcur >= xpos + 0*size and xcur < xpos + 3*size))) or
                    ((xcur >= xpos + 0*size and xcur < xpos + 1*size) and (ycur >= ypos and ycur < ypos + 4*size))):
                    canvas.itemconfigure(pixels[xcur][ycur], fill='white')
    if number == 5:
        for xcur in range(xpos, xpos + 4*size + 1):
            for ycur in range(ypos, ypos + 7*size + 1):
                if (((ycur >= ypos and ycur < ypos + 1*size) and (xcur >= xpos + 0*size and xcur < xpos + 4*size)) or
                    ((ycur >= ypos + 1*size and ycur < ypos + 4*size) and (xcur >= xpos + 0*size and xcur < xpos + 1*size)) or
                    ((ycur >= ypos + 3*size and ycur < ypos + 4*size) and (xcur >= xpos + 1*size and xcur < xpos + 3*size)) or
                    ((ycur >= ypos + 4*size and ycur < ypos + 5*size) and (xcur >= xpos + 3*size and xcur < xpos + 4*size)) or
                    ((ycur >= ypos + 5*size and ycur < ypos + 6*size) and ((xcur >= xpos and xcur < xpos + 1*size) or (xcur >= xpos + 3*size and xcur < xpos + 4*size))) or
                    ((ycur >= ypos + 6*size and ycur < ypos + 7*size) and (xcur >= xpos + 1*size and xcur < xpos + 3*size))):
                    canvas.itemconfigure(pixels[xcur][ycur], fill='white')
    if number == 6:
        for xcur in range(xpos, xpos + 4*size + 1):
            for ycur in range(ypos, ypos + 7*size + 1):
                if (((ycur >= ypos and ycur < ypos + 1*size) and (xcur >= xpos + 1*size and xcur < xpos + 3*size)) or
                    ((ycur >= ypos + 1*size and ycur < ypos + 2*size) and ((xcur >= xpos and xcur < xpos + 1*size) or (xcur >= xpos + 3*size and xcur < xpos + 4*size))) or
                    ((ycur >= ypos + 2*size and ycur < ypos + 3*size) and (xcur >= xpos and xcur < xpos + 1*size)) or
                    ((ycur >= ypos + 3*size and ycur < ypos + 4*size) and (xcur >= xpos + 0*size and xcur < xpos + 3*size)) or                    
                    ((ycur >= ypos + 4*size and ycur < ypos + 5*size) and ((xcur >= xpos and xcur < xpos + 1*size) or (xcur >= xpos + 3*size and xcur < xpos + 4*size))) or
                    ((ycur >= ypos + 5*size and ycur < ypos + 6*size) and ((xcur >= xpos and xcur < xpos + 1*size) or (xcur >= xpos + 3*size and xcur < xpos + 4*size))) or
                    ((ycur >= ypos + 6*size and ycur < ypos + 7*size) and (xcur >= xpos + 1*size and xcur < xpos + 3*size))):
                    canvas.itemconfigure(pixels[xcur][ycur], fill='white')
    if number == 7:
        for xcur in range(xpos, xpos + 4*size + 1):
            for ycur in range(ypos, ypos + 7*size + 1):
                if (((ycur >= ypos and ycur < ypos + 1*size) and (xcur >= xpos + 0*size and xcur < xpos + 4*size)) or
                    ((ycur >= ypos + 1*size and ycur < ypos + 2*size) and ((xcur >= xpos and xcur < xpos + 1*size) or (xcur >= xpos + 3*size and xcur < xpos + 4*size))) or
                    ((ycur >= ypos + 2*size and ycur < ypos + 7*size) and (xcur >= xpos + 3*size and xcur < xpos + 4*size))):
                    canvas.itemconfigure(pixels[xcur][ycur], fill='white')
    if number == 8:
        for xcur in range(xpos, xpos + 4*size + 1):
            for ycur in range(ypos, ypos + 7*size + 1):
                if (((ycur >= ypos and ycur < ypos + 1*size) or (ycur >= ypos + 3*size and ycur < ypos + 4*size) or (ycur >= ypos + 6*size and ycur < ypos + 7*size)) and (xcur >= xpos + 1*size and xcur < xpos + 3*size) or
                    ((((ycur >= ypos + 1*size and ycur < ypos + 3*size) or (ycur >= ypos + 4*size and ycur < ypos + 6*size))) and ((xcur >= xpos and xcur < xpos + 1*size) or (xcur >= xpos + 3*size and xcur < xpos + 4*size)))):
                    canvas.itemconfigure(pixels[xcur][ycur], fill='white')
    if number == 9:
        for xcur in range(xpos, xpos + 4*size + 1):
            for ycur in range(ypos, ypos + 7*size + 1):
                if (((ycur >= ypos + 6*size and ycur < ypos + 7*size) and (xcur >= xpos + 1*size and xcur < xpos + 3*size)) or
                    ((ycur >= ypos + 5*size and ycur < ypos + 6*size) and ((xcur >= xpos and xcur < xpos + 1*size) or (xcur >= xpos + 3*size and xcur < xpos + 4*size))) or
                    ((ycur >= ypos + 4*size and ycur < ypos + 5*size) and (xcur >= xpos + 3*size and xcur < xpos + 4*size)) or
                    ((ycur >= ypos + 3*size and ycur < ypos + 4*size) and (xcur >= xpos + 1*size and xcur < xpos + 4*size)) or                    
                    ((ycur >= ypos + 2*size and ycur < ypos + 3*size) and ((xcur >= xpos and xcur < xpos + 1*size) or (xcur >= xpos + 3*size and xcur < xpos + 4*size))) or
                    ((ycur >= ypos + 1*size and ycur < ypos + 2*size) and ((xcur >= xpos and xcur < xpos + 1*size) or (xcur >= xpos + 3*size and xcur < xpos + 4*size))) or
                    ((ycur >= ypos + 0*size and ycur < ypos + 1*size) and (xcur >= xpos + 1*size and xcur < xpos + 3*size))):
                    canvas.itemconfigure(pixels[xcur][ycur], fill='white')
    if number == 0:
        for xcur in range(xpos, xpos + 4*size + 1):
            for ycur in range(ypos, ypos + 7*size + 1):
                if ((((ycur >= ypos and ycur < ypos + 1*size) or (ycur >= ypos + 6*size and ycur < ypos + 7*size)) and (xcur >= xpos + 1*size and xcur < xpos + 3*size)) or
                    ((ycur >= ypos + 1*size and ycur < ypos + 6*size) and ((xcur >= xpos and xcur < xpos + 1*size) or (xcur >= xpos + 3*size and xcur < xpos + 4*size)))):
                    canvas.itemconfigure(pixels[xcur][ycur], fill='white')     
    return

def create_letter(letter, xpos, ypos, size):
    if letter == 'cruz':
        for xcur in range(xpos, xpos + 5*size + 1):
            for ycur in range(ypos, ypos + 7*size + 1):
                if ((((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 1*size) and (ycur < ypos + 2*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 1*size) and (xcur < xpos + 2*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 4*size) and (ycur < ypos + 5*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 5*size) and (ycur < ypos + 6*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size)))):
                    canvas.itemconfigure(pixels[xcur][ycur], fill='white')
    if letter == 'e':
        for xcur in range(xpos, xpos + 5*size + 1):
            for ycur in range(ypos, ypos + 7*size + 1):
                if ((((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 1*size) and (xcur < xpos + 2*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 1*size) and (ycur < ypos + 2*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 1*size) and (xcur < xpos + 2*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 4*size) and (ycur < ypos + 5*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 5*size) and (ycur < ypos + 6*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 1*size) and (xcur < xpos + 2*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size)))):
                    canvas.itemconfigure(pixels[xcur][ycur], fill='white')
    if letter == 'l':
        for xcur in range(xpos, xpos + 5*size + 1):
            for ycur in range(ypos, ypos + 7*size + 1):
                if ((((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 1*size) and (ycur < ypos + 2*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 4*size) and (ycur < ypos + 5*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 5*size) and (ycur < ypos + 6*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 1*size) and (xcur < xpos + 2*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size)))):
                    canvas.itemconfigure(pixels[xcur][ycur], fill='white')
    if letter == 'm':
        for xcur in range(xpos, xpos + 5*size + 1):
            for ycur in range(ypos, ypos + 7*size + 1):
                if ((((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 1*size) and (ycur < ypos + 2*size))) or 
                (((xcur >= xpos + 1*size) and (xcur < xpos + 2*size)) and ((ycur >= ypos + 1*size) and (ycur < ypos + 2*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 1*size) and (ycur < ypos + 2*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 1*size) and (ycur < ypos + 2*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 4*size) and (ycur < ypos + 5*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 4*size) and (ycur < ypos + 5*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 5*size) and (ycur < ypos + 6*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 5*size) and (ycur < ypos + 6*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size)))):
                    canvas.itemconfigure(pixels[xcur][ycur], fill='white')
    if letter == 'i':
        for xcur in range(xpos, xpos + 5*size + 1):
            for ycur in range(ypos, ypos + 7*size + 1):
                if ((((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 1*size) and (xcur < xpos + 2*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 1*size) and (ycur < ypos + 2*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 4*size) and (ycur < ypos + 5*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 5*size) and (ycur < ypos + 6*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 1*size) and (xcur < xpos + 2*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size)))):
                    canvas.itemconfigure(pixels[xcur][ycur], fill='white')
    if letter == 'g':
        for xcur in range(xpos, xpos + 5*size + 1):
            for ycur in range(ypos, ypos + 7*size + 1):
                if ((((xcur >= xpos + 1*size) and (xcur < xpos + 2*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 1*size) and (ycur < ypos + 2*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 4*size) and (ycur < ypos + 5*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 4*size) and (ycur < ypos + 5*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 5*size) and (ycur < ypos + 6*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 5*size) and (ycur < ypos + 6*size))) or 
                (((xcur >= xpos + 1*size) and (xcur < xpos + 2*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size)))):
                    canvas.itemconfigure(pixels[xcur][ycur], fill='white')
    if letter == 's':
        for xcur in range(xpos, xpos + 5*size + 1):
            for ycur in range(ypos, ypos + 7*size + 1):
                if ((((xcur >= xpos + 1*size) and (xcur < xpos + 2*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 1*size) and (ycur < ypos + 2*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 1*size) and (ycur < ypos + 2*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 1*size) and (xcur < xpos + 2*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 4*size) and (ycur < ypos + 5*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 5*size) and (ycur < ypos + 6*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 5*size) and (ycur < ypos + 6*size))) or 
                (((xcur >= xpos + 1*size) and (xcur < xpos + 2*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size)))):
                    canvas.itemconfigure(pixels[xcur][ycur], fill='white')
    if letter == 'happy face':
        for xcur in range(xpos, xpos + 5*size + 1):
            for ycur in range(ypos, ypos + 7*size + 1):
                if ((((xcur >= xpos + 1*size) and (xcur < xpos + 2*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 1*size) and (xcur < xpos + 2*size)) and ((ycur >= ypos + 1*size) and (ycur < ypos + 2*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 1*size) and (ycur < ypos + 2*size))) or 
                (((xcur >= xpos + 1*size) and (xcur < xpos + 2*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 1*size) and (xcur < xpos + 2*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 5*size) and (ycur < ypos + 6*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 5*size) and (ycur < ypos + 6*size))) or 
                (((xcur >= xpos + 1*size) and (xcur < xpos + 2*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size)))):
                    canvas.itemconfigure(pixels[xcur][ycur], fill='white')
    if letter == 'troféu':
        for xcur in range(xpos, xpos + 13*size + 1):
            for ycur in range(ypos, ypos + 14*size + 1):
                if ((((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 5*size) and (xcur < xpos + 6*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 6*size) and (xcur < xpos + 7*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 7*size) and (xcur < xpos + 8*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 8*size) and (xcur < xpos + 9*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 9*size) and (xcur < xpos + 10*size)) and ((ycur >= ypos + 0*size) and (ycur < ypos + 1*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 1*size) and (ycur < ypos + 2*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 1*size) and (ycur < ypos + 2*size))) or 
                (((xcur >= xpos + 5*size) and (xcur < xpos + 6*size)) and ((ycur >= ypos + 1*size) and (ycur < ypos + 2*size))) or 
                (((xcur >= xpos + 6*size) and (xcur < xpos + 7*size)) and ((ycur >= ypos + 1*size) and (ycur < ypos + 2*size))) or 
                (((xcur >= xpos + 7*size) and (xcur < xpos + 8*size)) and ((ycur >= ypos + 1*size) and (ycur < ypos + 2*size))) or 
                (((xcur >= xpos + 8*size) and (xcur < xpos + 9*size)) and ((ycur >= ypos + 1*size) and (ycur < ypos + 2*size))) or 
                (((xcur >= xpos + 9*size) and (xcur < xpos + 10*size)) and ((ycur >= ypos + 1*size) and (ycur < ypos + 2*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 1*size) and (xcur < xpos + 2*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 5*size) and (xcur < xpos + 6*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 6*size) and (xcur < xpos + 7*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 7*size) and (xcur < xpos + 8*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 8*size) and (xcur < xpos + 9*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 9*size) and (xcur < xpos + 10*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 10*size) and (xcur < xpos + 11*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 11*size) and (xcur < xpos + 12*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 12*size) and (xcur < xpos + 13*size)) and ((ycur >= ypos + 2*size) and (ycur < ypos + 3*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 5*size) and (xcur < xpos + 6*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 6*size) and (xcur < xpos + 7*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 7*size) and (xcur < xpos + 8*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 8*size) and (xcur < xpos + 9*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 9*size) and (xcur < xpos + 10*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 12*size) and (xcur < xpos + 13*size)) and ((ycur >= ypos + 3*size) and (ycur < ypos + 4*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 4*size) and (ycur < ypos + 5*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 4*size) and (ycur < ypos + 5*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 4*size) and (ycur < ypos + 5*size))) or 
                (((xcur >= xpos + 5*size) and (xcur < xpos + 6*size)) and ((ycur >= ypos + 4*size) and (ycur < ypos + 5*size))) or 
                (((xcur >= xpos + 6*size) and (xcur < xpos + 7*size)) and ((ycur >= ypos + 4*size) and (ycur < ypos + 5*size))) or 
                (((xcur >= xpos + 7*size) and (xcur < xpos + 8*size)) and ((ycur >= ypos + 4*size) and (ycur < ypos + 5*size))) or 
                (((xcur >= xpos + 8*size) and (xcur < xpos + 9*size)) and ((ycur >= ypos + 4*size) and (ycur < ypos + 5*size))) or 
                (((xcur >= xpos + 9*size) and (xcur < xpos + 10*size)) and ((ycur >= ypos + 4*size) and (ycur < ypos + 5*size))) or 
                (((xcur >= xpos + 12*size) and (xcur < xpos + 13*size)) and ((ycur >= ypos + 4*size) and (ycur < ypos + 5*size))) or 
                (((xcur >= xpos + 0*size) and (xcur < xpos + 1*size)) and ((ycur >= ypos + 5*size) and (ycur < ypos + 6*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 5*size) and (ycur < ypos + 6*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 5*size) and (ycur < ypos + 6*size))) or 
                (((xcur >= xpos + 5*size) and (xcur < xpos + 6*size)) and ((ycur >= ypos + 5*size) and (ycur < ypos + 6*size))) or 
                (((xcur >= xpos + 6*size) and (xcur < xpos + 7*size)) and ((ycur >= ypos + 5*size) and (ycur < ypos + 6*size))) or 
                (((xcur >= xpos + 7*size) and (xcur < xpos + 8*size)) and ((ycur >= ypos + 5*size) and (ycur < ypos + 6*size))) or 
                (((xcur >= xpos + 8*size) and (xcur < xpos + 9*size)) and ((ycur >= ypos + 5*size) and (ycur < ypos + 6*size))) or 
                (((xcur >= xpos + 9*size) and (xcur < xpos + 10*size)) and ((ycur >= ypos + 5*size) and (ycur < ypos + 6*size))) or 
                (((xcur >= xpos + 12*size) and (xcur < xpos + 13*size)) and ((ycur >= ypos + 5*size) and (ycur < ypos + 6*size))) or 
                (((xcur >= xpos + 1*size) and (xcur < xpos + 2*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 2*size) and (xcur < xpos + 3*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 5*size) and (xcur < xpos + 6*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 6*size) and (xcur < xpos + 7*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 7*size) and (xcur < xpos + 8*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 8*size) and (xcur < xpos + 9*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 9*size) and (xcur < xpos + 10*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 10*size) and (xcur < xpos + 11*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 11*size) and (xcur < xpos + 12*size)) and ((ycur >= ypos + 6*size) and (ycur < ypos + 7*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 7*size) and (ycur < ypos + 8*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 7*size) and (ycur < ypos + 8*size))) or 
                (((xcur >= xpos + 5*size) and (xcur < xpos + 6*size)) and ((ycur >= ypos + 7*size) and (ycur < ypos + 8*size))) or 
                (((xcur >= xpos + 6*size) and (xcur < xpos + 7*size)) and ((ycur >= ypos + 7*size) and (ycur < ypos + 8*size))) or 
                (((xcur >= xpos + 7*size) and (xcur < xpos + 8*size)) and ((ycur >= ypos + 7*size) and (ycur < ypos + 8*size))) or 
                (((xcur >= xpos + 8*size) and (xcur < xpos + 9*size)) and ((ycur >= ypos + 7*size) and (ycur < ypos + 8*size))) or 
                (((xcur >= xpos + 9*size) and (xcur < xpos + 10*size)) and ((ycur >= ypos + 7*size) and (ycur < ypos + 8*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 8*size) and (ycur < ypos + 9*size))) or 
                (((xcur >= xpos + 5*size) and (xcur < xpos + 6*size)) and ((ycur >= ypos + 8*size) and (ycur < ypos + 9*size))) or 
                (((xcur >= xpos + 6*size) and (xcur < xpos + 7*size)) and ((ycur >= ypos + 8*size) and (ycur < ypos + 9*size))) or 
                (((xcur >= xpos + 7*size) and (xcur < xpos + 8*size)) and ((ycur >= ypos + 8*size) and (ycur < ypos + 9*size))) or 
                (((xcur >= xpos + 8*size) and (xcur < xpos + 9*size)) and ((ycur >= ypos + 8*size) and (ycur < ypos + 9*size))) or 
                (((xcur >= xpos + 5*size) and (xcur < xpos + 6*size)) and ((ycur >= ypos + 9*size) and (ycur < ypos + 10*size))) or 
                (((xcur >= xpos + 6*size) and (xcur < xpos + 7*size)) and ((ycur >= ypos + 9*size) and (ycur < ypos + 10*size))) or 
                (((xcur >= xpos + 7*size) and (xcur < xpos + 8*size)) and ((ycur >= ypos + 9*size) and (ycur < ypos + 10*size))) or 
                (((xcur >= xpos + 5*size) and (xcur < xpos + 6*size)) and ((ycur >= ypos + 10*size) and (ycur < ypos + 11*size))) or 
                (((xcur >= xpos + 6*size) and (xcur < xpos + 7*size)) and ((ycur >= ypos + 10*size) and (ycur < ypos + 11*size))) or 
                (((xcur >= xpos + 7*size) and (xcur < xpos + 8*size)) and ((ycur >= ypos + 10*size) and (ycur < ypos + 11*size))) or 
                (((xcur >= xpos + 5*size) and (xcur < xpos + 6*size)) and ((ycur >= ypos + 11*size) and (ycur < ypos + 12*size))) or 
                (((xcur >= xpos + 6*size) and (xcur < xpos + 7*size)) and ((ycur >= ypos + 11*size) and (ycur < ypos + 12*size))) or 
                (((xcur >= xpos + 7*size) and (xcur < xpos + 8*size)) and ((ycur >= ypos + 11*size) and (ycur < ypos + 12*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 12*size) and (ycur < ypos + 13*size))) or 
                (((xcur >= xpos + 5*size) and (xcur < xpos + 6*size)) and ((ycur >= ypos + 12*size) and (ycur < ypos + 13*size))) or 
                (((xcur >= xpos + 6*size) and (xcur < xpos + 7*size)) and ((ycur >= ypos + 12*size) and (ycur < ypos + 13*size))) or 
                (((xcur >= xpos + 7*size) and (xcur < xpos + 8*size)) and ((ycur >= ypos + 12*size) and (ycur < ypos + 13*size))) or 
                (((xcur >= xpos + 8*size) and (xcur < xpos + 9*size)) and ((ycur >= ypos + 12*size) and (ycur < ypos + 13*size))) or 
                (((xcur >= xpos + 3*size) and (xcur < xpos + 4*size)) and ((ycur >= ypos + 13*size) and (ycur < ypos + 14*size))) or 
                (((xcur >= xpos + 4*size) and (xcur < xpos + 5*size)) and ((ycur >= ypos + 13*size) and (ycur < ypos + 14*size))) or 
                (((xcur >= xpos + 5*size) and (xcur < xpos + 6*size)) and ((ycur >= ypos + 13*size) and (ycur < ypos + 14*size))) or 
                (((xcur >= xpos + 6*size) and (xcur < xpos + 7*size)) and ((ycur >= ypos + 13*size) and (ycur < ypos + 14*size))) or 
                (((xcur >= xpos + 7*size) and (xcur < xpos + 8*size)) and ((ycur >= ypos + 13*size) and (ycur < ypos + 14*size))) or 
                (((xcur >= xpos + 8*size) and (xcur < xpos + 9*size)) and ((ycur >= ypos + 13*size) and (ycur < ypos + 14*size))) or 
                (((xcur >= xpos + 9*size) and (xcur < xpos + 10*size)) and ((ycur >= ypos + 13*size) and (ycur < ypos + 14*size)))):
                    canvas.itemconfigure(pixels[xcur][ycur], fill='yellow')

def linha_animada(): #testava uma linha sendo riscada (em um espaço menor devido ao tempo de processamento); Não foi usado!
    global contador
    if contador <=60:
        contador +=1 
        for xcur in range(4, 60):
            for ycur in range(24, 26):
                if (4 < xcur < 4+ 1*contador):
                    canvas.itemconfigure(pixels[xcur][ycur], fill='white')
        canvas.after(16, linha_animada)

              
def create_circle_click():
    global xpos, ypos, r, th
    create_circle(n, xpos, ypos, r, th)

def create_number_click():
    global xpos, ypos
    for size in range(9):
        for number in range(10):
            create_number(number, xpos, ypos, size)
            xpos += 5*size
        ypos += 10*size
        xpos = 30
    ypos = 30
def create_letter_click():
    global xpos, ypos
    for size in range(9):
        for letter in ['e', 'l', ' ', 'm', 'i', 'g', 's']:
            create_letter(letter, xpos, ypos, size)
            xpos += 6*size
        ypos += 10*size
        xpos = 30
    ypos = 30
window = tk.Tk()
window.title('Pixels')

pixel_size = 1.2

canvas = tk.Canvas(window, width=Nx*pixel_size, height=Ny*pixel_size)
canvas.pack()

pixels = create_pixels(Nx, Ny, pixel_size)

letter_button = tk.Button(window, text="Create Letter", command=create_letter_click)
circle_button = tk.Button(window, text="Create Circle", command=create_circle_click)
number_button = tk.Button(window, text="Create Number", command=create_number_click)
#line_button = tk.Button(window, text="Create Line", command=linha_animada)
#line_button.pack()
letter_button.pack()
number_button.pack()
circle_button.pack()
window.mainloop()
    
