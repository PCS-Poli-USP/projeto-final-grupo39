from PIL import Image

def imagem_para_matriz(imagem):
    imagem = imagem.convert("L")  # Converte para escala de cinza
    largura, altura = imagem.size
    matriz_pixels = []
    for y in range(altura):
        linha = []
        for x in range(largura):
            pixel = imagem.getpixel((x, y))
            if pixel == 0:  # Assumindo que o valor 0 representa preto
                linha.append(0)
            else:
                linha.append(1)
        matriz_pixels.append(linha)
    return matriz_pixels
letras = ['w']
compiler = 'VHDL'
if compiler == 'python':
    for letra in letras: 
        file = r"C:\Users\monke\OneDrive\Área de Trabalho\Migs\Poli\vhdl\letras\\"
        file += letra + r'.png'
        imagem = Image.open(file)
        pixels = imagem_para_matriz(imagem)
        condition = f"    if letter == '{letra}':\n"
        condition += f'        for xcur in range(xpos, xpos + {len(pixels[0])}*size + 1):\n'
        condition += f'            for ycur in range(ypos, ypos + {len(pixels)}*size + 1):\n'
        condition += f'                if ('
        for i in range(len(pixels)):
            for j in range(len(pixels[i])):
                if pixels[i][j] == 0:
                    condition += f'(((xcur >= xpos + {j}*size) and (xcur < xpos + {j+1}*size)) and ((ycur >= ypos + {i}*size) and (ycur < ypos + {i+1}*size))) or \n                '
        condition = condition[:len(condition)-21] + '):\n'
        condition += "                    canvas.itemconfigure(pixels[xcur][ycur], fill='white')"
        print(condition)
elif compiler == 'VHDL':
    for letra in letras: 
        file = r"C:\Users\monke\OneDrive\Área de Trabalho\Migs\Poli\vhdl\letras\\"
        file += letra + r'.png'
        imagem = Image.open(file)
        pixels = imagem_para_matriz(imagem)
        condition = f"PACKAGE L{letra.upper()}_PACKAGE IS\n"
        condition += f'PROCEDURE L{letra.upper()}(SIGNAL EN_DRAW:IN STD_LOGIC;SIGNAL Xpos,Ypos,Xcur,Ycur:IN INTEGER;SIGNAL R,G,B:OUT STD_LOGIC_VECTOR(3 downto 0);SIGNAL DRAW: OUT STD_LOGIC);\n'
        condition += f'END L{letra.upper()}_PACKAGE;\n\n'
        condition = f"PACKAGE L{letra.upper()}_PACKAGE IS\n"
        condition += f'PROCEDURE L{letra.upper()}(SIGNAL EN_DRAW:IN STD_LOGIC;SIGNAL Xpos,Ypos,Xcur,Ycur:IN INTEGER;SIGNAL R,G,B:OUT STD_LOGIC_VECTOR(3 downto 0);SIGNAL DRAW: OUT STD_LOGIC) IS\n'
        condition += f'CONSTANT size : INTEGER := 4;\n\nBEGIN\n\n'
        condition += f" IF (EN_DRAW = '1') AND ("
        for i in range(len(pixels)):
            for j in range(len(pixels[i])):
                if pixels[i][j] == 0:
                    condition += f'(((Xcur >= Xpos + {j}*SIZE) AND (Xcur < Xpos + {j+1}*SIZE)) AND ((Ycur >= Ypos + {i}*SIZE) AND (Ycur < Ypos + {i+1}*SIZE))) OR \n                '
        condition = condition[:len(condition)-21] + ') THEN\n'
        condition += f'	 R<="1111";\n'
        condition += f'	 G<="1111";\n'
        condition += f'	 B<="1111";\n'
        condition += f"	 DRAW<='1';\n	 ELSE\n"
        condition += f"	 DRAW<='0';\n END IF;\n\n"
        condition += f"END L{letra.upper()};\nEND L{letra.upper()}_PACKAGE;"
        print(condition)
